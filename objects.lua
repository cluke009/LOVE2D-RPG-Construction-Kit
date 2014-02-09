
-- Create Hero object
Hero = Animation:extend
{
    width = 32,
    height = 32,
    image = 'assets/img/heroes/spritetest.png',

    sequences = {
        down = {
            frames ={1,2},
            fps = 5,
        },
        left = {
            frames ={3,4},
            fps = 5,
        },
        right = {
            frames ={7,8},
            fps = 5,
        },
        up = {
            frames ={5,6},
            fps = 5,
        },
    },
    rand = function(self)
        local low = 100
        local high = 175
        if STATE.encounters[STATE.mapName].active then
            print(STATE.mapName)
            low, high = unpack(STATE.encounters[STATE.mapName].rate)
        end
        self.encounter = math.random(low, high)
    end,
    onNew = function(self, obj)
        -- local encounters = require('assets.maps.' .. the.app.view.mapName .. '.config')
        -- print(the.app.view.mapName )
        self:rand()
    end,
    animate = function(self, elapsed)
    end,
    onUpdate = function (self, elapsed)
        -- local animate = self:animate(elapsed)
        if not self:animate(elapsed) then
            -- self.velocity.x = 0
            -- self.velocity.y = 0
        end
        -- Its time to run
        local velo = 120
        if the.keys:pressed('shift') then
            velo = 300
        end


        -- Its time to move
        if not Event.navi then
            if the.keys:pressed('up') and self.velocity.x == 0 then
                self.encounter = self.encounter - 1
                self.velocity.y = -velo
                self:play('up')
            elseif the.keys:pressed('down') and self.velocity.x == 0 then
                self.encounter = self.encounter - 1
                self.velocity.y = velo
                self:play('down')
            elseif the.keys:pressed('left') and self.velocity.y == 0 then
                self.encounter = self.encounter - 1
                self.velocity.x = -velo
                self:play('left')
            elseif the.keys:pressed('right') and self.velocity.y == 0 then
                self.encounter = self.encounter - 1
                self.velocity.x = velo
                self:play('right')
            elseif self.velocity.x == 0 and self.velocity.y == 0 then
                self:freeze()
            end
            --
            -- KeyReleased
            --
            if the.keys:justReleased('up') then
                local x,y = the.app.view.map:pixelToMap(self.x,self.y)
                local spriteAtMap = the.app.view.map:spriteAtMap(x,y)
                self['uy'] = (spriteAtMap and y * 32 or (y - 1) * 32)
                self.up = true
            elseif the.keys:justReleased('down') then
                local x,y = the.app.view.map:pixelToMap(self.x,self.y)
                local spriteAtMap =  the.app.view.map:spriteAtMap(x,y + 1)
                self['dy'] = (spriteAtMap and (y - 1) * 32 or y * 32)
                self.down = true
            elseif the.keys:justReleased('left') then
                local x,y = the.app.view.map:pixelToMap(self.x,self.y)
                local spriteAtMap =  the.app.view.map:spriteAtMap(x,y)
                self['lx'] = (spriteAtMap and x * 32 or (x - 1) * 32)
                self.left = true
            elseif the.keys:justReleased('right') then
                local x,y = the.app.view.map:pixelToMap(self.x,self.y)
                local spriteAtMap = the.app.view.map:spriteAtMap(x + 1,y)
                self['rx'] = (spriteAtMap and (x - 1) * 32 or x * 32)
                self.right = true
            end

            if STATE.encounters[STATE.mapName].active and self.encounter == 0 then
                local id = math.random(1, #STATE.encounters[STATE.mapName].random)
                BattleView.config = require('assets.maps.' .. STATE.mapName .. '.config')
                BattleView.enemyGroup = STATE.encounters[STATE.mapName]['random'][id]
                BattleView:activate()
                STATE.encounters[STATE.mapName].max = STATE.encounters[STATE.mapName].max - 1

                if STATE.encounters[STATE.mapName].max == 0 then
                    STATE.encounters[STATE.mapName].active = false
                end

                self:rand()
            end
        else
            self.velocity.x = 0
            self.velocity.y = 0
        end
        --
        -- Interpolate coordinates
        --
        if self.up and self.y <= self.uy then
            self.y, self.velocity.y, self.up = self.uy, 0, false
        elseif self.down and self.y >= self.dy then
            self.y, self.velocity.y, self.down = self.dy, 0, false
        elseif self.left and self.x <= self.lx then
            self.x, self.velocity.x, self.left = self.lx, 0, false
        elseif self.right and self.x >= self.rx then
            self.x, self.velocity.x, self.right = self.rx, 0, false
        end
    end
}

--
-- Anything else that might go on your map.
Obj = Animation:extend {
    __class__ = 'Obj',
    onNew = function(self)
        self.id     = tonumber(self.id)
        self.image  = objs[self.id].image
        if objs[self.id].width then self.width  = objs[self.id].width end
        if objs[self.id].height then self.height = objs[self.id].height end
        if self.id == 0 then self.solid = false end
        self.sequences  = objs[self.id].sequences
        if self.sequences and self.sequences.auto then
            self:play('auto')
        end
    end,
    onCollide = function(self, other)
        if other:instanceOf(Hero) then self.other = other end
        if other:instanceOf(Hero) and self.solid ~= 'false' then
            self:displace(other)
        end
    end,
    animate = function(self, elapsed)
    end,
    onUpdate = function(self, elapsed)
        Event:checkObj(self)
        self:animate(elapsed)

        if self.other then
            local otherX = self.other.x + (self.other.width / 2)
            local otherY = self.other.y + (self.other.height / 2)
            local selfX = self.x + (self.width / 2)
            local selfY = self.y + (self.height / 2)
            local offsetX = (self.width / 2) + (self.other.width / 2)
            local offsetY = (self.height / 2) + (self.other.height / 2)

            if math.abs(otherX - selfX) <= offsetX and math.abs(otherY - selfY) <= offsetY then
                if self.event then
                    Event:register(self.event)
                end
            end
        end
    end
}

--
-- Add the property "id" with the "id value" from npcs.lua.
NPC = Obj:extend {
    __class__ = 'NPC',
    onNew = function(self)
        self.id     = tonumber(self.id)
        self.image  = npcs[self.id].image
        self.width  = npcs[self.id].width
        self.height = npcs[self.id].height
    end,
}
