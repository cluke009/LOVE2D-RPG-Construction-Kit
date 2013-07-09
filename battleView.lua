local BattleController = require'battleController'

local BattleView = Subview:new{
    onActivate = function(self)
        BattleController:init()
        -- Create misc
        self.fill = Fill:new{
            width = 800,
            height = 600,
            fill = { 255, 255, 255, 255 }
        }
        self.text = Text:new{
            x = 20,
            y = 20,
            width = 760,
            tint = { 0, 0, 0 },
            font = 24,
            text = 'Battle'
        }
        self.indicator = Tile:new{
            x = 0,
            y = 0,
            width = 22,
            height = 22,
            image = 'assets/img/arrow.png'
        }
        self.dmgText = Text:new{
            x = 220,
            y = 0,
            width = 1000,
            tint = { 255, 0, 0 },
            font = 18,
            text = 'test'
        }

        -- Add misc
        self:add(self.fill)
        self:add(self.text)
        self:add(self.indicator)
        self:add(self.dmgText)

        -- Draw heroes
        for k, v in pairs(BattleController.data.hero) do

            self['heroImg' .. k] = Tile:new{
                image = BattleController.data.hero[k].image,
                height = BattleController.data.hero[k].height,
                width = BattleController.data.hero[k].width,
                x = 40 + (128 * (k - 1)),
                y = 340,
            }
            self['heroText' .. k] = Text:new{
                x = 60 + (128 * (k - 1)),
                y = 368,
                tint = { 0, 0, 0 },
                font = 12,
                text = BattleController.data.hero[k].stats.hp .. '/' .. BattleController.data.hero[k].stats.hpmax
            }

            self:add(self['heroImg' .. k])
            self:add(self['heroText' .. k])
        end

        -- Draw enemies
        for k, v in pairs(BattleController.data.enemy) do

            self['enemyImg' .. k] = Animation:new{
                image = BattleController.data.enemy[k].img.idle.image,
                sequences = {
                    anim = {
                        frames = { 1 },
                        fps = BattleController.data.enemy[k].img.idle.fps
                    },
                },
                height = BattleController.data.enemy[k].height,
                width = BattleController.data.enemy[k].width,
                x = 40 + (128 * (k - 1)),
                y = 40,
            }
            self['enemyText' .. k] = Text:new{
                x = 60 + (128 * (k - 1)),
                y = 168,
                tint = { 0, 0, 0 },
                font = 12,
                text = BattleController.data.enemy[k].stats.hp .. '/' .. BattleController.data.enemy[k].stats.hp
            }

            self:add(self['enemyImg' .. k])
            self:add(self['enemyText' .. k])
        end
    end,
    onDeactivate = function(self)
    -- Remove misc
        self:remove(self.indicator)
        self:remove(self.dmgText)
        self:remove(self.fill)
        self:remove(self.text)

        -- Remove heroes
        for k, v in pairs(BattleController.data.hero) do
            self:remove(self['heroImg' .. k])
            self:remove(self['heroText' .. k])
        end

        -- Remove enemies
        for k, v in pairs(BattleController.data.enemy) do
            self:remove(self['enemyImg' .. k])
            self:remove(self['enemyText' .. k])
        end

        BattleController.data = nil
    end,
    onNew = function(self)
    end,
    counter = {
        enemyAttack = 1,
        enemyDmg = 1,
    },
    onUpdate = function(self)
    -- Variables
        local queue = BattleController.data.queue
        local turnKind = queue[1].kind
        local turnKey = queue[1].key
        local bcEnemy = BattleController.data.enemy
        local bcHero = BattleController.data.hero

        -- TEMP['battleView.onUpdate.enemyID'] = self.enemyID
        local heroID, dmg

        -- Start enemy idle animations
        if queue[2] and queue[2].kind == 'enemy' then
            local k = queue[2].key
            self['enemyImg' .. k].image = bcEnemy[k].img.idle.image
            self['enemyImg' .. k].sequences.anim.frames = bcEnemy[k].img.idle.frames
            self['enemyImg' .. k]:play('anim')
        end

        -- Start enemy attack animations
        if turnKind == 'enemy' then
            local k = turnKey
            self['enemyImg' .. k].image = bcEnemy[k].img.attack.image
            self['enemyImg' .. k].sequences.anim.frames = bcEnemy[k].img.attack.frames
            self['enemyImg' .. k]:play('anim')
            self.anim = #self['enemyImg' .. k].sequences.anim.frames * (60 / self['enemyImg' .. k].sequences.anim.fps)
            self.counter.enemyAttack = self.counter.enemyAttack + 1
        end

        -- Stop enemy attack animations
        if self.anim ~= nil and self.counter.enemyAttack >= self.anim then
            local k = turnKey
            self.counter.enemyAttack = 1
            dmg, heroID = BattleController:enemyTurn()

            -- Update animation
            self['enemyImg' .. k].image = bcEnemy[k].img.idle.image
            self['enemyImg' .. k].paused = true

            -- Display damage
            self.dmgText.text = '- ' .. dmg
            self.dmgText.x = self['heroImg' .. heroID].x + 30
            self.dmgText.y = self['heroImg' .. heroID].y - 30

            -- Update queue
            BattleController:updateQueue('hero', heroID)
        end

        -- Start enemy damage animations
        if self.enemyID ~= nil then
            local k = self.enemyID

            if self.counter.enemyDmg == 1 then
                self.dmg, self.enemyID = BattleController:heroTurn()
            end

            -- Display damage
            self.dmgText.text = '- ' .. self.dmg
            self.dmgText.x = self['enemyImg' .. k].x + 60
            self.dmgText.y = self['enemyImg' .. k].y - 15

            -- Update animation
            self['enemyImg' .. k].image = bcEnemy[k].img.dmg.image
            self['enemyImg' .. k].sequences.anim.frames = bcEnemy[k].img.dmg.frames
            self['enemyImg' .. k]:play('anim')
            self.animDmg = #self['enemyImg' .. k].sequences.anim.frames * (60 / self['enemyImg' .. k].sequences.anim.fps)
            self.counter.enemyDmg = self.counter.enemyDmg + 1
        end

        -- Stop enemy damage animations
        if self.animDmg ~= nil and self.counter.enemyDmg >= self.animDmg then

            local k = self.enemyID


            -- Update animation
            self['enemyImg' .. k].image = bcEnemy[k].img.idle.image
            self['enemyImg' .. k].paused = true

            -- Update queue
            BattleController:updateQueue('enemy', self.enemyID)
            self.enemyID = nil
            self.counter.enemyDmg = 1
        end

        -- Update selector
        if turnKind == 'enemy' then
            local k = turnKey
            self.indicator.x = 20 + (128 * (k - 1))
            self.indicator.y = 60
        elseif turnKind == 'hero' then
            local k = turnKey
            self.indicator.x = 20 + (128 * (k - 1))
            self.indicator.y = 340
        end

        -- Update health bars
        for k, v in pairs(BattleController.data.enemy) do
            self['enemyText' .. k].text = BattleController.data.enemy[k].stats.hp .. '/' .. BattleController.data.enemy[k].stats.hp
        end
        for k, v in pairs(BattleController.data.hero) do
            self['heroText' .. k].text = BattleController.data.hero[k].stats.hp .. '/' .. BattleController.data.hero[k].stats.hpmax
        end

        -- Controls
        if the.keys:justPressed('1') then
            -- self.enemyID = 1
            _, self.enemyID = BattleController:action('attack', 1, 1)
        elseif the.keys:justPressed('2') then
            -- self.enemyID = 2
            _, self.enemyID = BattleController:action('attack', 1, 2)
        elseif the.keys:justPressed('3') then
            -- self.enemyID = 3
            _, self.enemyID = BattleController:action('attack', 1, 3)
        elseif the.keys:justPressed('4') then
            -- self.enemyID = 4
            _, self.enemyID = BattleController:action('attack', 1, 4)
        elseif the.keys:justPressed('5') then
            -- self.enemyID = 5
            _, self.enemyID = BattleController:action('attack', 1, 5)
        elseif the.keys:justPressed('rshift') then
            _, self.enemyID = BattleController:defend(1)
        elseif the.keys:justPressed('escape') then
            self:deactivate()
        end
    end
}


return BattleView