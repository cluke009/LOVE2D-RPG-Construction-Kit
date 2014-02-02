
 _navi = require(... .. '.arc')

local Navi = Sprite:extend {
    dialog = {},
    draw = function(self, x, y)
        _navi.play_list(self.dialog, 0, 0)
        _navi.arc.clear_key()
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

        _navi.arc.set_key(the.keys:allPressed())
        _navi.arc.check_keys(elapsed)
    end
}

return Navi 
