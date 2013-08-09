local BattleController = require 'controller.battle.battle_controller'
--
-- Class: BattleView
-- Display code for battles
--
-- Extends:
--      <Subview>
--
-- Require:
-- - battleController
--
local BattleView = Subview:new{
    activate = function (self, enemyGroup)
        self.enemyGroup = enemyGroup
        if the.view == self then
            if STRICT then
                local info = debug.getinfo(2, 'Sl')
                print('Warning: treid to activate an already active subview (' ..
                      info.short_src .. ', line ' .. info.currentline .. ')')
            end
            return
        end

        self.parentView = the.view
        the.app.view = self
        self.activated = true
        if self.onActivate then self:onActivate() end
    end,
    onActivate = function(self)
        BattleController:init(self.enemyGroup)
        -- Create misc
        self.fill = Tile:new{
            x = 300,    width  = 800,
            y = 300,    height = 600,
            scale = 2,
            image = 'assets/img/lpc_home_cup.png'
        }
        self.bgMenu = Fill:new{
            x = 10,     width  = 780,
            y = 470,    height = 120,
            fill = { 0, 0, 255, 200 },
            border = { 255, 255, 255, 255 },
        }
        self.indicator = Tile:new{
            x = 0,      width = 22,
            y = 0,      height = 22,
            image = 'assets/img/arrow.png'
        }
        self.dmgText = Text:new{
            x = 0,      width = 1000,
            y = 0,      height = 120,
            tint = { 1, 0, 0 },
            font = STATE.font,
        }
        self.dmgTextShadow = Text:new{
            x = 0,      width = 1000,
            y = 0,      height = 120,
            tint = { 1, 1, 1 },
            font = STATE.font,
        }
        self.dmgAnim = Animation:new{
            image = 'assets/img/dmg.png',
            sequences = {
                anim = {
                    frames = { 1,2,3,4,3,2, },
                    fps = 24
                },
            },
            height = 130,
            width = 139,
            visible = false,
        }
        -- Add misc
        self:add(self.fill)
        self:add(self.bgMenu)

        -- Draw heroes
        for k, v in pairs(BattleController.data.hero) do
            self['heroImg' .. k] = Tile:new{
                image = BattleController.data.hero[k].img.left.image,
                height = BattleController.data.hero[k].img.height,
                width = BattleController.data.hero[k].img.width,
                x = 554 + (32 * (k - 1)),
                y = 64 + (64 * (k - 1)),
            }
            self['heroText' .. k .. 'shadow'] = Text:new{
                x = 302,
                y = 492 + (25 * (k - 1)),
                width =1000,
                tint = { 0, 0, 0 },
                font = STATE.font,
            }
            self['heroText' .. k] = Text:new{
                x = 300,
                y = 490 + (25 * (k - 1)),
                width =1000,
                tint = { 1, 1, 1 },
                font = STATE.font,
            }

            self:add(self['heroImg' .. k])
            self:add(self['heroText' .. k .. 'shadow'])
            self:add(self['heroText' .. k])
        end

        -- Draw enemies
        local e = {} -- Enemy name table
        for k, v in pairs(BattleController.data.enemy) do
            local name = BattleController.data.enemy[k].name
            e[name] = name

            self['enemyImg' .. k] = Animation:new{
                image = BattleController.data.enemy[k].img.idle.image,
                sequences = {
                    anim = {
                        frames = BattleController.data.enemy[k].img.idle.frames,
                        fps = BattleController.data.enemy[k].img.idle.fps
                    },
                },
                height = BattleController.data.enemy[k].img.height,
                width = BattleController.data.enemy[k].img.width,
                x = 64 + (32 * (k - 1)),
                y = 300 - (64 * (k - 1)),
            }
            self['enemyText' .. k .. 'shadow'] = Text:new{
                x = self['enemyImg' .. k].x + self['enemyImg' .. k].height + 2,
                y = self['enemyImg' .. k].y + self['enemyImg' .. k].width + 2,
                width =1000,
                tint = { 0, 0, 0 },
                font = STATE.font,
            }
            self['enemyText' .. k] = Text:new{
                x = self['enemyImg' .. k].x + self['enemyImg' .. k].height,
                y = self['enemyImg' .. k].y + self['enemyImg' .. k].width,
                width =1000,
                tint = { 1, 1, 1 },
                font = STATE.font,
            }

            self:add(self['enemyImg' .. k])
            self:add(self['enemyText' .. k .. 'shadow'])
            self:add(self['enemyText' .. k])
            self['enemyImg' .. k]:play('anim')
        end

        --  Print enemy names
        local i = 1
        for k,v in pairs(e) do
            self['enemyName' .. i .. 'shadow'] = Text:new{
                x = 22,
                y = 492 + (25 * (i - 1)),
                width =1000,
                tint = { 0, 0, 0 },
                font = STATE.font,
                text = k
            }
            self['enemyName' .. i] = Text:new{
                x = 20,
                y = 490 + (25 * (i - 1)),
                width =1000,
                tint = { 1, 1, 1 },
                font = STATE.font,
                text = k
            }

            self:add(self['enemyName' .. i .. 'shadow'])
            self:add(self['enemyName' .. i])

            i = i + 1
        end

        self:add(self.indicator)
        self:add(self.dmgTextShadow)
        self:add(self.dmgText)
        self:add(self.dmgAnim)
    end,
    onDeactivate = function(self)
        -- Remove misc
        self:remove(self.indicator)
        self:remove(self.dmgText)
        self:remove(self.bgMenu)
        self:remove(self.fill)

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

        -- Zero out existing data
        -- BattleController.data = nil
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
        local battle, battleText  = BattleController:win()

        local heroID, dmg

        -- Start enemy idle animations
        -- if queue[2] and queue[2].kind == 'enemy' then
        --     local k = queue[2].key
        --     self['enemyImg' .. k].image = bcEnemy[k].img.idle.image
        --     self['enemyImg' .. k].sequences.anim.frames = bcEnemy[k].img.idle.frames

        -- end

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
            self['enemyImg' .. k].sequences.anim.frames = bcEnemy[k].img.idle.frames
            -- self['enemyImg' .. k]:freeze(1)
            -- Display damage
            self.dmgText.text = dmg
            self.dmgText.x = self['heroImg' .. heroID].x + self['heroImg' .. heroID].width
            self.dmgText.y = self['heroImg' .. heroID].y
            self.dmgTextShadow.text = dmg
            self.dmgTextShadow.x = self['heroImg' .. heroID].x + self['heroImg' .. heroID].width + 2
            self.dmgTextShadow.y = self['heroImg' .. heroID].y + 2
            -- Update queue
            BattleController:updateQueue('hero', heroID)
        end

        if self.dmgAnim.currentFrame == 4 then
            self.dmgAnim:freeze(1)
            self.dmgAnim.visible = false
        end

        -- Start enemy damage animations
        if self.enemyID ~= nil then
            local k = self.enemyID
            if self.counter.enemyDmg == 1 then
                self.dmg, self.enemyID = BattleController:heroTurn()
            end
            -- Display damage
            self.dmgText.text = self.dmg
            self.dmgText.x = self['enemyImg' .. k].x - self['enemyImg' .. k].width
            self.dmgText.y = self['enemyImg' .. k].y
            self.dmgTextShadow.text = self.dmg
            self.dmgTextShadow.x = self['enemyImg' .. k].x + 2 - self['enemyImg' .. k].width
            self.dmgTextShadow.y = self['enemyImg' .. k].y + 2
            --  DMG animation
            self.dmgAnim.visible = true
            self.dmgAnim.x = self['enemyImg' .. k].x
            self.dmgAnim.y = self['enemyImg' .. k].y
            self.dmgAnim:play('anim')
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
            self['enemyImg' .. k].sequences.anim.frames = bcEnemy[k].img.idle.frames
            -- self['enemyImg' .. k]:freeze(1)

            -- Update queue
            BattleController:updateQueue('enemy', self.enemyID)

            -- Remove enemy sprite if dead
            if self.enemyID and bcEnemy[self.enemyID].dead ~= nil then
                local k = self.enemyID
                self['enemyImg' .. k].visible = false
                self['enemyText' .. k].visible = false
            end

            self.enemyID = nil
            self.counter.enemyDmg = 1
        end

        -- Update indicator
        if turnKind == 'enemy' then
            local k = turnKey
            self.indicator.x = self['enemyImg' .. k].x - self['enemyImg' .. k].height
            self.indicator.y = self['enemyImg' .. k].y - self['enemyImg' .. k].width
        elseif turnKind == 'hero' then
            local k = turnKey
            self.indicator.x = 275
            self.indicator.y = 482 + (25 * (k - 1))
        end

        -- Update health bars
        for k, v in pairs(BattleController.data.enemy) do
            local hp = BattleController.data.enemy[k].stats.hp
            local hpmax = BattleController.data.enemy[k].stats.hpmax
            -- local mp = BattleController.data.enemy[k].stats.mp
            -- local mpmax = BattleController.data.enemy[k].stats.mpmax
            -- local name = string.rpad(BattleController.data.enemy[k].name, 8, '.')
            -- local text = name .. '    HP: ' .. hp .. '/' .. hpmax .. ' MP: ' .. mp .. '/' .. mpmax
            local text = hp .. '/' .. hpmax
            self['enemyText' .. k .. 'shadow'].text = text
            self['enemyText' .. k].text = text
        end
        for k, v in pairs(BattleController.data.hero) do
            local hp = string.lpad(BattleController.data.hero[k].stats.hp, 3, '0')
            local hpmax = BattleController.data.hero[k].stats.hpmax
            local mp = string.lpad(BattleController.data.hero[k].stats.mp, 2, '0')
            local mpmax = BattleController.data.hero[k].stats.mpmax
            local name = string.rpad(BattleController.data.hero[k].name, 8, '.')
            local text = name .. ' HP: ' .. hp .. '/' .. hpmax .. ' MP: ' .. mp .. '/' .. mpmax
            self['heroText' .. k .. 'shadow'].text = text
            self['heroText' .. k].text = text
        end

        -- Controls
        if turnKind == 'hero' then
            if the.keys:justPressed('1') then
                _, self.enemyID = BattleController:action('attack', 1, 1)
            elseif the.keys:justPressed('2') then
                _, self.enemyID = BattleController:action('attack', 1, 2)
            elseif the.keys:justPressed('3') then
                _, self.enemyID = BattleController:action('attack', 1, 3)
            elseif the.keys:justPressed('4') then
                _, self.enemyID = BattleController:action('attack', 1, 4)
            elseif the.keys:justPressed('5') then
                _, self.enemyID = BattleController:action('attack', 1, 5)
            elseif the.keys:justPressed('rshift') then
                _, self.enemyID = BattleController:defend(1)
            end
        end
        if the.keys:justPressed('escape') then
            self:deactivate()
        end

        -- Win/Lose screen
        if battle ~= nil and battle == true then
            battle = nil
            local d = Dialog:new()
            d.fill.x = 10
            d.fill.y = 10
            d.dialog = {
                'EXP: ' .. battleText.exp,
                'Gold: ' .. battleText.gold
            }
            d.text.x = 20
            d.text.y = 20

            d.onDeactivate = function()
                self:deactivate()
            end
            d:activate()

        elseif battle == false then
            battle = nil
            local d = Dialog:new()
            d.fill.x = 10
            d.fill.y = 10
            d.dialog = { 'You suck dead guy.!' }
            d.text.x = 20
            d.text.y = 20

            d.onDeactivate = function()
                self:deactivate()
            end
            d:activate()
        end
    end
}

return BattleView
