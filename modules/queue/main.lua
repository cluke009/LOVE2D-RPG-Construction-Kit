-- Set debug options
STRICT = true
DEBUG  = true
io.stdout:setvbuf("no")

-- Requires
require 'zoetrope'
local MyModule = require 'modules.mymodule'

-- Create new app
the.app = App:new
{
    onRun = function (self)

    end,

    onUpdate = function (self)

    end,
}
