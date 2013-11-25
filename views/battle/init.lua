local BattleController  = require 'views.battle.battle_controller'
local MenuHelper        = require 'helpers.menu_helper'

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
        self.fill = Fill:new{
            x = 0,    width  = 800,
            y = 0,    height = 600,
            fill = {255, 0, 0},
        }
        self.indicator = Tile:new{
            x = 0,      width = 22,
            y = 0,      height = 22,
            image = 'assets/img/arrow.png'
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

        self.menu = MenuHelper:new {
            coord = {20,440,150,23,false},
            items = {
                {'Attack', function()
                    local queue = BattleController.data.queue
                    local turnKind = queue[1].kind
                    local turnKey = queue[1].key
                    _, self.enemyID = BattleController:action('attack', turnKey, enemy)
                end},
                {'Skill', function()

                    end},
                {'Defend', function()

                end},
                {'Item', function()

                end},
                {'Flee', function()

                end},
            },
        }
        self:add(self.menu)
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
                x = 128 + (64 * (k - 1)),
                y = 300,
                scale = 2
            }

            self:add(self['enemyImg' .. k])

            self['enemyImg' .. k]:play('anim')
        end

        -- Draw heroes
        for k, v in pairs(BattleController.data.hero) do
            self['heroFill' .. k] = Fill:new{
                x = 20 + (120 * (k - 1)),       width  = 100,
                y = 20,                         height = 150,
                fill = {0, 0, 0},
                border = { 255, 255, 255, 255 },
            }
            self['heroText' .. k] = Text:new{
                x = 30 + (120 * (k - 1)),
                y = 30,
                width = 100,
                height = 200,
                font = STATE.font,
                text = BattleController.data.hero[k].name
            }
            self['heroStats' .. k] = Text:new{
                x = 30 + (120 * (k - 1)),
                y = 50,
                width = 100,
                height = 200,
                font = STATE.font,
                text = 'H ' .. BattleController.data.hero[k].stats.hp .. '\nM ' .. BattleController.data.hero[k].stats.mp
            }

            self:add(self['heroFill' .. k])
            self:add(self['heroText' .. k])
            self:add(self['heroStats' .. k])
        end
        self:add(self.indicator)
        self:add(self.dmgAnim)
    end,
    onDeactivate = function(self)
        -- Remove misc
        self:remove(self.indicator)
        self:remove(self.dmgText)
        self:remove(self.bgMenu)
        self:remove(self.fill)
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
        local battle, battleText  = BattleController:win()
        local heroID, dmg

        if turnKind == 'enemy' then
            print('enemy')
        else
            table_print(queue)
            self:heroTurn()
        end


    end,
    enemyTurn = function(self)
        self.menu.visible = false
        self.menu.active = false

        self.counter.enemyAttack = 1
        dmg, heroID = BattleController:enemyTurn()

        -- Remove enemy sprite if dead
        if self.enemyID and bcEnemy[self.enemyID].dead ~= nil then
            local k = self.enemyID
            self['enemyImg' .. k].visible = false
            self['enemyText' .. k].visible = false
        end

        BattleController:updateQueue('hero', heroID)

    end,
    heroTurn = function(self)
        self.menu.visible = true
        self.menu.active = true
    end,
    win = function(self)
        self:deactivate()
    end,
    lose = function(self)
        self:deactivate()
    end,


}

return BattleView
