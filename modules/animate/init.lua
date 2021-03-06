local Animation = {
    delta = 0,
    moveObject = function(self, name, options)
        -- local i, max = 1, #options
        local i, oi, count = 1, 1, #options
        local dir
        local lx, ly, velo = options[i][1] * 32, options[i][2] * 32, options[i][3]
        the[name].animate = function (self, elapsed)
            if (oi % 2 ~= 0) and i <= count then
                if ly < self.y then dir = 'up'
                    elseif ly > self.y then dir = 'down'
                    elseif lx < self.x then dir = 'left'
                    elseif lx > self.x then dir = 'right'
                end
                oi = 2
            elseif i <= count then
                if dir == 'up' and self.y >= ly then
                    the[name].velocity.y = -velo
                elseif dir == 'down' and self.y <= ly then
                    the[name].velocity.y = velo
                elseif dir == 'left' and self.x >= lx then
                    the[name].velocity.x = -velo
                elseif dir == 'right' and self.x <= lx then
                    the[name].velocity.x = velo
                else
                    the[name].velocity.y = 0
                    the[name].velocity.x = 0
                    the[name].x = lx
                    the[name].y = ly
                    oi = 1
                    i = i + 1
                    if options[i] then
                        lx, ly, velo = options[i][1] * 32, options[i][2] * 32, options[i][3]
                    end
                end
            else
                return false
            end
            return true
        end
    end,
    moveCamera = function(self, options)
        local i, count = 1, #options
        local target, duration, ease = unpack(options[1])
        if type(target) == 'string' then target = the[target] end
        the.app.animate = function (self, elapsed)
            if i <= count then
                local promise = the.app.view:panTo(target, duration, ease)
                :andThen(function()
                    if target == the.hero then
                        the.app.view.focus = the.hero
                    end
                end)
                if promise.state == 'fulfilled' then
                    i = i + 1
                    if options[i] then
                        target, duration, ease = unpack(options[i])
                        if type(target) == 'string' then target = the[target] end
                        promise = the.app.view:panTo(target, duration, ease)
                    end
                end
            end
        end
    end,
}

return Animation
