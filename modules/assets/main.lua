-- Set debug options
STRICT = true
DEBUG  = true
io.stdout:setvbuf("no")

-- Requires
require 'zoetrope'
local AssetLoader = require 'modules.asset_loader'

-- Create new app
the.app = App:new
{
    onRun = function (self)

    end,

    onUpdate = function (self)

    end,
}
