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
            font = { 24 }
        }
        self:add(self.text)
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

        self:loadLayers('assets/maps/' .. STATE.map .. '.lua')

        if STATE.prevmap then
            -- Coordinates upon entering new room.
            self.hero.x = STATE.heroStartX
            self.hero.y = STATE.heroStartY
        else
            -- The starting coordinates of our player.
            self.hero.x = STATE.heroStartX
            self.hero.y = STATE.heroStartY
        end

        self:add(self.hero)

        self.focus = self.hero
        self:clampTo(self.map)

        -- Send map name to hud.
        if STATE.hud == true then
            Hud.text.text = STATE.map
            self:add(Hud)
        end
    end,
    onUpdate = function(self)
        self.map:displace(self.hero)
        self.objects:collide(self.hero)


        if the.keys:justPressed('escape') then
            love.event.quit()
        end
    end
}



