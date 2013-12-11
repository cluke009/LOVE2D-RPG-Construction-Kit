local menu = require 'views.menu.game'
local Save = require 'helpers.save'

--
-- Title: HUD / Mapview
--

--
-- Class: HUD
-- Display the currently loaded map.
--
-- Extends:
--      <Group>
--
local t1 = os.time()
local Hud = Group:new{
    onNew = function(self)
        self.translateScale.x = 0
        self.translateScale.y = 0
        self:add(Fill:new{
            x = 10,
            y = 10,
            width = 200,
            height = 50,
            fill = { 255, 255, 255, 100 },
            border = { 0, 0, 0, 255 }
        })
        self.text = Text:new{
            x = 20,
            y = 20,
            tint = { 255, 0, 0 },
            font = STATE.conf.font
        }
        self.text2 = Text:new{
            x = 20,
            y = 40,
            tint = { 255, 0, 0 },
            font = STATE.conf.font
        }
        self:add(self.text)
        self:add(self.text2)
    end
}

--
-- Class: MapView
-- Our main maploader.
--
-- Extends:
--      <View>
--
-- Example code:
--     (begin code)
--     self.view = MapView:new()
--     (end code)
--
MapView = View:extend{
    onNew = function(self)
        self.hero = Hero:new()
        -- self:loadLayers('assets/maps/' .. STATE.conf.map .. '.lua')
        self:loadLayers('maps/' .. STATE.conf.map .. '/'.. STATE.conf.map .. '.lua')

        -- Player coordinates.
        self.hero.x = STATE.conf.heroStartX
        self.hero.y = STATE.conf.heroStartY

        self:add(self.hero)

        self.focus = self.hero
        self:clampTo(self.map)
        
        -- Send map name to hud.
        if STATE.conf.hud == true then
            Hud.text.text = STATE.conf.map
            self:add(Hud)
        end
    end,
    onUpdate = function(self)
        self.map:displace(self.hero)
        self.map:collide(self.hero)
        self.objects:collide(self.hero)

        Hud.text2.text = Save:secondsToClock(os.difftime(os.time(), t1)  + STATE.conf.time.seconds)

        if the.keys:justPressed('1') then
            Save:save('1')
        elseif the.keys:justPressed('2') then
            Save:save('2')
        elseif the.keys:justPressed('3') then
            Save:save('3')
        end

        if the.keys:justPressed(' ') and menu.activated ~= true then
            menu:activate()
        elseif the.keys:justPressed('escape') then
            -- love.event.quit()
        end
    end
}
