log = {
    text = {},
    init = Text:new{
        x = 320,
        y = 20,
        width = 400,
        tint = { 255, 0, 0 },
        -- font = STATE.font,
        text = 'start log \n',
        visible = false
    }
}
function log:add( text )
    if STATE.log then
        table.insert(self.text, os.time() .. ': ' .. text .. '\n')
        -- table.insert(self.text,os.date('%X', os.time()) .. ': ' .. text .. '\n')
        self:update(true)
    end
end

function log:update( update )
    if STATE.log then
        if the.keys:justPressed('l') and self.init.visible then
            self.init.visible = false
        elseif the.keys:justPressed('l') and not self.init.visible then
            self.init.visible = true
        elseif update or self.init.visible then
            local t = ''
            for i,v in ipairs(self.text) do
                t = t .. v
            end
            log.init.text = t
        end
    end
end
