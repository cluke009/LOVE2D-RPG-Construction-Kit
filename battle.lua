local Menu      = require 'menu.menu'
local enemies   = require 'assets.tables.enemies'
local items     = require 'assets.tables.items'
local equipment = require 'assets.tables.equipment'
local formula   = require 'formula'

local Battle, localHero, localEnemy

-- TODO: all tables should have accessor classes rather than be called directly?
local Equipment = {
    get = function ( self, equipmentID )
        return equipment[equipmentID]
    end,
    set = function ( self, equipmentID )

    end,
    equipped = function ( self, heroID, ... )
        local data = {}
        if STATE.equip[heroID] then
            local i = 1
            for k,v in pairs(STATE.equip[heroID]) do
                if arg[1] and equipment[v] then
                    data[i] = equipment[v][arg[1]]
                else
                    data[i] = equipment[v]
                end
                i = i + 1
            end
        end

        return data
    end,
}

BattleModel = {
    init = function ( self )
        self.data = {
            hero = {},
            enemy = {},
            queue = {}
        }
        self:hero()
        self:enemy()
        self:queue()
        -- pretty.dump(self.data)
        return self.data
    end,
    hero = function ( self )
        -- Merge hero data
        for k, v in pairs(STATE.heroes) do
            if v.active then
                -- Copy active heroes
                self.data.hero[k] = table.deepcopy(v)

                local stats = self.data.hero[k]['stats']

                -- Add bonuses from equipment to stats
                for i, effects in ipairs(Equipment:equipped(k, 'effect')) do
                    for k, v in pairs(effects) do
                        stats[k] = stats[k] + v
                    end
                end
            end
        end
        -- pretty.dump(self.data.hero[1])
    end,
    enemy = function ( self )
        local array = {}
        local enemyGroup = enemies[Battle.enemyInit]['group']

        -- Lua likes to pick 2 every time with only one random. Who knows why?
        local superRand = math.random(math.random(1, 3), 5)
        -- superRand = 2 -- or not at all random

        for i=1, superRand do
            local randID = math.random(1, #enemyGroup)
            randID = enemies[Battle.enemyInit]['group'][randID]

            table.insert(array, table.deepcopy(enemies[randID]))
            array[i]['key'] = randID

            -- Randomize stats +/- 10%
            for k,v in pairs(array[i]['stats']) do
                local randStats = v + math.round(v * (random(-10, 10)/100))
                array[i]['stats'][k] = randStats
            end
        end

        self.data.enemy = array
    end,
    queue = function ( self )
        -- Queue
        for k, v in pairs(self.data.hero) do
            table.insert(self.data.queue, {kind='hero',key=k,spd = v.stats.spd})
        end

        for k, v in pairs(self.data.enemy) do
            table.insert(self.data.queue, {kind='enemy',key=k,spd = v.stats.spd})
        end

        table.sort(self.data.queue,
        function(a,b)
            return a.spd>b.spd
        end)

    end
}

BattleController = {
    init = function (self)
        self.data = BattleModel:init()
        -- pretty.dump(self.data)
    end,
    updateQueue = function (self, kind, ID)
        -- Move first item to last item
        local size = #self.data.queue
        self.data.queue[size + 1] = self.data.queue[1]

        -- Take dead characters out of queue
        if self.data[kind] and self.data[kind][ID].stats.hp <= 0 then
            for k,v in pairs(self.data.queue) do
                if v.key == ID and v.kind == kind then
                    self.data.queue[k] = nil
                    self.data[kind][ID].dead = true
                end
            end
        end

        -- Empty first item
        self.data.queue[1] = nil

        -- Reindex: copy table then delete it
        local i = 1
        for k,v in pairs(self.data.queue) do
            self.data.queue[i] = self.data.queue[k]
            self.data.queue[k] = nil
            i = i + 1
        end
        -- pretty.dump(self.data.queue)
    end,
    enemyTurn = function (self)
        -- TODO: handle total party death
        local heroID = formula.enemyAI(self.data.hero)
        local enemyID = self.data.queue[1].key
        local dmg
        dmg, _ = formula.attack(self.data.enemy[enemyID], self.data.hero[heroID])

        return dmg, heroID
    end,
    isDead = function (self, ID)

    end,

    heroTurn = function ( self )
        if self.arg.action == 'attack' then
            dmg, _ = formula.attack(self.arg[1], self.arg[2])
            local enemyID = Battle.enemyID
            return dmg, enemyID
        end

    end,

    action = function ( self,action, ... )
        self.arg = arg
        self.arg.action = action
        local dmg = 0
        local enemyID = Battle.enemyID
        return dmg, enemyID
    end,

    -- attack = function (self, offense, defense)
    --     dmg, _ = formula.attack(offense, defense)
    --     local enemyID = 1
    --     -- self:updateQueue()
    --     -- pretty.dump(defense)
    --     return dmg, enemyID
    -- end,
    defend = function (self, heroID)
        -- _, defense = formula.attack(offense, defense)
        -- formula.defense(heroID)
        print('defend')
        self:updateQueue()
    end,


}


Battle = Subview:new
{
    onActivate = function ( self )
        BattleController:init()
        -- Create misc
        self.fill = Fill:new{
            width = 800,
            height = 600,
            fill = {255, 255, 255, 255}
        }
        self.text = Text:new{
            x = 20,
            y = 20,
            width = 760,
            tint = {0,0,0},
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
            tint = {255,0,0},
            font = 18,
            text = 'test'
        }

        -- Add misc
        self:add(self.fill)
        self:add(self.text)
        self:add(self.indicator)
        self:add(self.dmgText)

        -- Draw heroes
        for k,v in pairs(BattleController.data.hero) do

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
                tint = {0,0,0},
                font = 12,
                text = BattleController.data.hero[k].stats.hp .. '/' .. BattleController.data.hero[k].stats.hpmax
            }

            self:add(self['heroImg' .. k])
            self:add(self['heroText' .. k])
        end

        -- Draw enemies
        for k,v in pairs(BattleController.data.enemy) do

            self['enemyImg' .. k] = Animation:new{
                image = BattleController.data.enemy[k].img.idle.image,
                sequences = {
                    anim = {
                        frames = {1},
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
                tint = {0,0,0},
                font = 12,
                text = BattleController.data.enemy[k].stats.hp .. '/' .. BattleController.data.enemy[k].stats.hp
            }

            self:add(self['enemyImg' .. k])
            self:add(self['enemyText' .. k])
        end

    end,
    onDeactivate = function ( self )
        -- Remove misc
        self:remove(self.indicator)
        self:remove(self.dmgText)
        self:remove(self.fill)
        self:remove(self.text)

        -- Remove heroes
        for k,v in pairs(BattleController.data.hero) do
            self:remove(self['heroImg' .. k])
            self:remove(self['heroText' .. k])
        end

        -- Remove enemies
        for k,v in pairs(BattleController.data.enemy) do
            self:remove(self['enemyImg' .. k])
            self:remove(self['enemyText' .. k])
        end

        BattleController.data = nil

    end,
    onNew = function ( self )

    end,
    counter = {
        enemyAttack = 1,
        enemyDmg = 1,
    },
    onUpdate = function ( self )
        -- Variables
        local queue         = BattleController.data.queue
        local turnKind      = queue[1].kind
        local turnKey       = queue[1].key
        local bcEnemy       = BattleController.data.enemy
        local bcHero        = BattleController.data.hero

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
            self.anim = #self['enemyImg' .. k].sequences.anim.frames *  (60 / self['enemyImg' .. k].sequences.anim.fps)
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
            self.animDmg = #self['enemyImg' .. k].sequences.anim.frames *  (60 / self['enemyImg' .. k].sequences.anim.fps)
            self.counter.enemyDmg = self.counter.enemyDmg + 1
        end

        -- Stop enemy damage animations
        if self.animDmg ~= nil and self.counter.enemyDmg >= self.animDmg then
            local k = self.enemyID
            self.counter.enemyDmg = 1

            -- Update animation
            self['enemyImg' .. k].image = bcEnemy[k].img.idle.image
            self['enemyImg' .. k].paused = true

            -- Update queue
            BattleController:updateQueue('enemy', self.enemyID)
            self.enemyID = nil
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
        for k,v in pairs(BattleController.data.enemy) do
            self['enemyText' .. k].text = BattleController.data.enemy[k].stats.hp .. '/' .. BattleController.data.enemy[k].stats.hp
        end
        for k,v in pairs(BattleController.data.hero) do
            self['heroText' .. k].text = BattleController.data.hero[k].stats.hp .. '/' .. BattleController.data.hero[k].stats.hpmax
        end

        -- Controls
        if the.keys:justPressed('1') then
            self.enemyID = 1
            BattleController:action('attack', BattleController.data.hero[1], BattleController.data.enemy[1])
        elseif the.keys:justPressed('2') then
            self.enemyID = 2
            BattleController:action('attack', BattleController.data.hero[1], BattleController.data.enemy[2])
        elseif the.keys:justPressed('3') then
            self.enemyID = 3
            BattleController:action('attack', BattleController.data.hero[1], BattleController.data.enemy[3])
        elseif the.keys:justPressed('4') then
            self.enemyID = 4
            BattleController:action('attack', BattleController.data.hero[1], BattleController.data.enemy[4])
        elseif the.keys:justPressed('5') then
            self.enemyID = 5
            BattleController:action('attack', BattleController.data.hero[1], BattleController.data.enemy[5])
        elseif the.keys:justPressed('rshift') then
            BattleController:defend(1)
        elseif the.keys:justPressed('escape') then
            self:deactivate()
        end
    end

}


return Battle
