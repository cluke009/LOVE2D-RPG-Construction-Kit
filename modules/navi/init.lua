
local _navi = require(... .. '.arc')

local Navi = Sprite:extend {
    dialog = {},
    draw = function(self, x, y)
        _navi.play_list(self.dialog, 0, 0)
        arc.clear_key()
    end,
    onNew = function (self, obj)
        local t = {}
        for i,v in ipairs(self.dialog) do
            t[i] = _navi:new(unpack(self.dialog[i]))
        end
        self.dialog = t
    end,
    onUpdate = function (self, elapsed)
        if self.dialog[#self.dialog]:is_over() then
            self.is_over = true
            self.choice = self.dialog[#self.dialog]:get_pick()
            the.app.view:remove(self)
            return true
        end

        arc.set_key(the.keys:allPressed())
        arc.check_keys(elapsed)
    end
}

return Navi
