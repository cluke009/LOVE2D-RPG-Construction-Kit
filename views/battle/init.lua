--
-- Class: BattleView
-- Display code for battles
--
-- Extends:
--      <Subview>
--
-- Require:
-- - battleController
local enemyTurn = Timer:new()
local BattleEvent = require'views.battle.event'

local BattleView = Subview:new{
    onActivate = function(self)
        Battle:init(self.enemyGroup)
        -- Battle.text = ''
        self.bg = Tile:new{ image = self.config.bg }
        self.fill = Fill:new{x=180,y=235,width=320,height=300,tint={0,0,.2},alpha=0.25}
        self:add(self.bg)
        self:add(self.fill)
        -- Draw enemies
        for i,v in ipairs(self.enemyGroup) do
            self['enemy'..i] = Tile:new{
                image = enemies[v].img.idle.image,
                width = enemies[v].img.width,
                height = enemies[v].img.height,
                x = enemies[v].img.width * i
            }
            self:add(self['enemy'..i])
        end
        -- Turn text
        self.turn = Text:new{text = '', x = 20, y = 210, width = 300, font = STATE.conf.font }
        self.turnshadow = Text:new{tint={0,0,0},text = '', x = 21, y = 211, width = 300, font = STATE.conf.font }
        Battle.text = Text:new{text = '', x = 205, y = 245, width = 320,}
        self:add(self.turnshadow)
        self:add(self.turn)
        self:add(Battle.text)
        -- Enemy timer
        local win = false
        enemyTurn:every(1, function()
            -- print(Battle:win(),'--')
            if not win then
                local dmg, battletext, heroID = Battle:enemyTurn()
                Battle.text.text =  Battle.text.text ..  battletext .. '\n'
                local w,h = Battle.text:getSize()
                if h > 110 then
                    Battle.text.text = Battle.text.text:gsub('.-\n', '',1)
                end
                win = Battle:queueUpdate()
            end
        end)
        self:add(enemyTurn)

        self:drawHero()
    end,
    onDeactivate = function(self)
        for i,v in ipairs(self.enemyGroup) do
            self:remove(self['enemy'..i])
        end
        self:remove(enemyTurn)
        self:remove(self.bg)
        self:remove(self.turn)
        self:remove(self.fill)
        self:remove(self.turnshadow)
        self:remove(Battle.text)
    end,
    onNew = function(self)
    end,
    onUpdate = function(self, elapsed)
        love.graphics.setColor(255,255,255)

        self.turnKind = Battle.data.queue[1].kind
        self.turnKey  = Battle.data.queue[1].key
        self.turn.text = 'Turn:    ' .. Battle.data[self.turnKind][self.turnKey].name
        self.turnshadow.text = 'Turn:    ' .. Battle.data[self.turnKind][self.turnKey].name
        for i,v in ipairs(self.enemyGroup) do
            self['enemy'..i].scale = 1
        end

        -- Turn status
        self:turnStatus()
        self:drawHeroUpdate()
    end,
    turnStatus = function(self)
        local over, status = Battle:win()

        if over and status == 1 then 
            enemyTurn.active = false                                                                                                           
            Event:register(2,'battle', BattleEvent:getDialog())
        elseif over and status == 2 then
            enemyTurn.active = false
            Event:register(3,'battle', BattleEvent:getDialog())
        elseif self.turnKind == 'enemy' then
            self.turn.tint = {0.7,0,0,1}
            for i,v in ipairs(self.enemyGroup) do
                if i == self.turnKey then
                    self['enemy'..self.turnKey].scale = 1.5
                end
            end
            enemyTurn.active = true
        else
            self.turn.tint = {0,0.5,0.5,1}
            Navi.events = {}
            enemyTurn.active = false
            Event:register(1,'battle', BattleEvent:getDialog())
            for i,v in ipairs(Battle.data.enemy) do
                if v.dead then self['enemy'..i].visible = false end
            end
        end
    end,
    drawHeroUpdate = function(self)
        for k,v in pairs(Battle.data.heroes) do
            if self.turnKind == 'hero' and self.turnKey == k then
                self['heroBorder' .. k].visible = true
            else
                self['heroBorder' .. k].visible = false
            end
            local hp = v.stats.hp/v.stats.hpmax
            local hpbar = 86 * hp
            local mp = v.stats.mp/v.stats.mpmax
            local mpbar = 86 * mp
            self['heroHealth' .. k].width = hpbar
            self['heroMana' .. k].width = mpbar
            self['heroHealthTextShadow' .. k].text = '\n\n' .. v.stats.hp .. '/' .. v.stats.hpmax
            self['heroManaTextShadow' .. k].text = '\n\n\n' .. v.stats.mp .. '/' .. v.stats.mpmax
            self['heroHealthText' .. k].text = '\n\n' .. v.stats.hp .. '/' .. v.stats.hpmax
            self['heroManaText' .. k].text = '\n\n\n' .. v.stats.mp .. '/' .. v.stats.mpmax
        end
    end,
    drawHero = function(self)
        local i = 0
        for k,v in pairs(Battle.data.heroes) do
            self['heroImg' .. k] = Tile:new{
                image = v.portraits[1],
                width = 96,
                height = 96,
                x = 520,
                y = 112 * i + 24
            }
            self['heroBorder' .. k] = Fill:new{
                -- border = {247,238,89,255},
                fill = {247,238,89,255},
                width = 100,
                height = 100,
                x = 518,
                y = 112 * i + 22
            }
            self['heroTextBorder' .. k] = Fill:new{
                -- border = {255,255,255,255},
                fill = {0,0,0,125},
                width = 96,
                height = 38,
                x = 520,
                y = 112 * i + 82
            }
            self['heroTextShadow' .. k] = Text:new{
                font = STATE.conf.font,
                tint = {0,0,0},
                text = v.name .. '\n\n\n\n' .. '-HP\n-MP',
                width = 128,
                height = 96,
                x = 521,
                y = 112 * i + 9
            }
            self['heroText' .. k] = Text:new{
                font = STATE.conf.font,
                text = v.name .. '\n\n\n\n' .. '-HP\n-MP',
                width = 128,
                height = 96,
                x = 520,
                y = 112 * i + 8
            }
            self['heroHealth' .. k] = Fill:new{
                -- border = {255,255,255,255},
                fill = {0,255,0,255},
                width = 86,
                height = 2,
                x = 525,
                y = 112 * i + 97
            }
            self['heroHealthShadow' .. k] = Fill:new{
                border = {0,0,0,255},
                fill = {255,255,0,255},
                width = 86,
                height = 2,
                x = 526,
                y = 112 * i + 97
            }
            self['heroMana' .. k] = Fill:new{
                -- border = {255,255,255,255},
                fill = {0,0,255,255},
                width = 86,
                height = 2,
                x = 525,
                y = 112 * i + 115
            }
            self['heroManaShadow' .. k] = Fill:new{
                border = {0,0,0,255},
                fill = {255,255,0,255},
                width = 86,
                height = 2,
                x = 525,
                y = 112 * i + 115
            }
            self['heroHealthTextShadow' .. k] = Text:new{
                font = STATE.conf.font,
                tint = {0,0,0},
                text = '\n\n' .. v.stats.hp..'/'..v.stats.hpmax,
                align = 'right',
                width = 128,
                height = 96,
                x = 486,
                y = 112 * i + 46
            }
            self['heroHealthText' .. k] = Text:new{
                font = STATE.conf.font,
                text = '\n\n' .. v.stats.hp..'/'..v.stats.hpmax,
                align = 'right',
                width = 128,
                height = 96,
                x = 485,
                y = 112 * i + 45
            }
            self['heroManaTextShadow' .. k] = Text:new{
                font = STATE.conf.font,
                tint = {0,0,0},
                text = '\n\n\n' .. v.stats.mp..'/'..v.stats.mpmax,
                align = 'right',
                width = 128,
                height = 96,
                x = 486,
                y = 112 * i + 46
            }
            self['heroManaText' .. k] = Text:new{
                font = STATE.conf.font,
                text = '\n\n\n' .. v.stats.mp..'/'..v.stats.mpmax,
                align = 'right',
                width = 128,
                height = 96,
                x = 485,
                y = 112 * i + 45
            }


            self:add(self['heroBorder' .. k])
            self:add(self['heroImg' .. k])
            self:add(self['heroTextBorder' .. k])
            self:add(self['heroTextShadow' .. k])
            self:add(self['heroText' .. k])
            self:add(self['heroHealthShadow' .. k])
            self:add(self['heroManaShadow' .. k])
            self:add(self['heroHealth' .. k])
            self:add(self['heroMana' .. k])
            self:add(self['heroHealthTextShadow' .. k])
            self:add(self['heroManaTextShadow' .. k])
            self:add(self['heroHealthText' .. k])
            self:add(self['heroManaText' .. k])
            i = i + 1
        end
    end,
}

return BattleView
