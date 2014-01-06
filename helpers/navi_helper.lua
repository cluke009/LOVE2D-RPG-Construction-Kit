arc_path = 'helpers/navi/arc/'
require(arc_path .. 'arc')
_navi = require(arc_path .. 'navi')

Navi = Sprite:extend {
    dialog = {},
    draw = function(self, x, y)
    print('draw')
        _navi.play_list(self.dialog,0,0)
        arc.clear_key()
    end,
    onUpdate = function (self, elapsed)
        print('onUpdate')
        if self.dialog[#self.dialog]:is_over() then
            self.is_over = true
            self.choice = self.dialog[#self.dialog]:get_pick()
            the.app.view:remove(self)
            return true
        end
        -- We need to specically set "up" and "down" for navi choices
        arc.set_key(the.keys:allPressed())
        -- if the.keys:pressed('up') then arc.set_key('up') end
        -- if the.keys:pressed('down') then arc.set_key('down') end
        arc.check_keys(elapsed)
    end
}
