--
-- Class: Trigger
-- Custom callbacks to use within Tiled.
--
-- Extends:
--      <Class>
--
local Trigger = Class:extend {
    --
    -- Method: battle
    --
    battle = function(self, options)
        local Battle    = require 'view.battle.battle_view'
        local Encounter = require 'assets.tables.encounters'

        Battle:activate(Encounter['north'][1])
    end,

    --
    -- Method: removeObj
    -- Removes an object from the map
    --
    removeObj = function(self, options)
        if not STATE.removeObj[options.map] then
            STATE.removeObj[options.map] = {}
            if not STATE.removeObj[options.map][options.kind] then
                STATE.removeObj[options.map][options.kind] = {}
                if not STATE.removeObj[options.map][options.kind][tonumber(options.obj)] then
                    STATE.removeObj[options.map][options.kind][tonumber(options.obj)] = {true}
                end
            end
        elseif not STATE.removeObj[options.map][options.kind][tonumber(options.obj)] then
            STATE.removeObj[options.map][options.kind][tonumber(options.obj)] = {true}
        end
    end,

    --
    -- Method: restoreObj
    -- Restores an object to the map
    --
    restoreObj = function(self, options)
        STATE.removeObj[options.map][options.kind][tonumber(options.obj)][1] = false
    end,

    --
    -- Method: shop
    -- Opens up a shop with the supplied ID.
    --
    -- Require:
    -- - 'view.shop.shop_view'
    --
    shop = function ( self, options )
        local ShopView = require 'modes.shop'
        ShopView.shopID = options.shop
        ShopView:activate()
    end,

    --
    -- Method: inventory
    -- Opens up a shop with the supplied ID.
    --
    inventory = function ( self, options )
        local Assets  = require 'helpers.asset_helper'
        Assets:putInventory(options.kind, options.id)
    end,

    --
    -- Method: map
    -- Sends player to the supplied map
    --
    map = function ( self, options )
        STATE.map = options.map
        the.app.view = MapView:new()
    end,

    --
    -- Method: party
    -- Add character to party
    --
    party = function(self, options)
        STATE.heroes[tonumber(options.heroes)].active = true
    end,

    --
    -- Method: restore
    -- Restores MP/HP
    --
    restore = function ( self, options )
        if options.hp == 'true' then
            local hero = STATE.heroes
            for i,v in ipairs(hero) do
                if v.active == true then
                    hero[i].stats.hp = hero[i].stats.hpmax
                end
            end
            the.app.view:flash({ 255, 0, 0 }, .75)
        end
        if options.mp == 'true' then
            local hero = STATE.heroes
            for i,v in ipairs(hero) do
                if v.active == true then
                    hero[i].stats.mp = hero[i].stats.mpmax
                end
            end
            the.app.view:flash({ 0, 0, 255 }, .75)
        end
    end,

    --
    -- Method: scene
    -- Triggers cutscene from Tiled. Replaces "the.app.view" with scene.
    --
    -- Arguments:
    --      scene - Filename of scene to load.
    --
    -- Require:
    -- - 'assets.cutscenes.' .. scene
    --
    scene = function(self, options)
        local scene = require('assets.cutscenes.' .. options.scene)
        local myView = View:extend {
            count = 1,
            dcount = 1,
            onNew = function(self)
                self.fill = Fill:new{
                    x = 10,
                    y = 440,
                    width = 780,
                    height = 150,
                    fill = { 255, 255, 255, 200 }
                }
                self.img = Tile:new{
                    image = scene[1]['image'],
                }
                self.text = Text:new{
                    x = 20,
                    y = 450,
                    width = 760,
                    tint = { 0, 0, 0 },
                    font = STATE.font,
                    text = scene[1]['dialog'][1]
                }
                self:add(self.img)
                if options.anim ~= 'true' then
                    self:add(self.fill)
                    self:add(self.text)
                end
            end,
            onUpdate = function(self)
                if options.anim == 'true' then
                    self.dcount = self.dcount + 1

                    if self.dcount > 40 then
                        self.count = self.count + 1
                        self.dcount = 1

                        if #scene >= self.count then
                            self.img:die()

                            self.img = Tile:new{
                                image = scene[self.count]['image']
                            }

                            self:add(self.img)
                        end
                    end
                    if #scene < self.count then
                        the.app.view = MapView:new()
                        if the.app.view.foreground then
                            the.app.view:moveToFront(the.app.view.foreground)
                        end
                    end
                else
                    if the.keys:justPressed('return') then

                        self.dcount = self.dcount + 1

                        if #scene[self.count]['dialog'] < self.dcount then
                            self.count = self.count + 1
                            self.dcount = 1

                            if #scene >= self.count then
                                self.img:die()
                                self.fill:die()

                                self.img = Tile:new{
                                    image = scene[self.count]['image']
                                }
                                self.fill = Fill:new{
                                    x = 10,
                                    y = 440,
                                    width = 780,
                                    height = 150,
                                    fill = { 255, 255, 255, 200 }
                                }

                                self:add(self.img)
                                self:add(self.fill)
                            end
                        end
                        self.text:die()
                        if #scene >= self.count then
                            self.text = Text:new{
                                x = 20,
                                y = 450,
                                width = 760,
                                tint = { 0, 0, 0 },
                                font = STATE.font,
                                text = scene[self.count]['dialog'][self.dcount]
                            }
                            self:add(self.text)
                        end

                    elseif #scene < self.count then
                        the.app.view = MapView:new()
                        if the.app.view.foreground then
                            the.app.view:moveToFront(the.app.view.foreground)
                        end
                    end
                end

            end
        }
        the.app.view = myView:new()
    end
}

return Trigger
