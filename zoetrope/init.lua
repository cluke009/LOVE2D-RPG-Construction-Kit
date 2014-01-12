-- copy references to existing globals so that
-- debug.reload() will have a correct initial starting point.

if DEBUG then
	-- remember initial state

	local _initialGlobals = {}
	local _initialPackages = {}

	for key, value in pairs(_G) do
		_initialGlobals[key] = value
	end

	for key, value in pairs(package.loaded) do
		-- it looks as though the type of a module
		-- that is currently being loaded, but hasn't
		-- completed is userdata

		if type(value) ~= 'userdata' then
			_initialPackages[key] = value
		end
	end

	debugger =
	{
		_initialGlobals = _initialGlobals,
		_initialPackages = _initialPackages,
		_originalErrhand = love.errhand,
		_crashed = false
	}

	-- replace crash handler
	-- we have to do this at this stage; there seems to be
	-- some magic that happens to connect to this function
	-- such that changing it later, even when creating the
	-- initial view, doesn't work

	love.errhand = function (message)
		if debugger._handleCrash then debugger._handleCrash(message) end
	end
end

-- Warn about accessing undefined globals in strict mode

if STRICT then
	setmetatable(_G, {
		__index = function (table, key)
			local info = debug.getinfo(2, 'Sl')
			local print = debugger.unsourcedPrint or print
			print('Warning: accessing undefined global ' .. key .. ', ' ..
				  info.short_src .. ' line ' .. info.currentline)
		end
	})
end

require 'zoetrope.core.class'

require 'zoetrope.core.app'
require 'zoetrope.core.cached'
require 'zoetrope.core.collision'
require 'zoetrope.core.globals'
require 'zoetrope.core.sprite'
require 'zoetrope.core.group'
require 'zoetrope.core.promise'
require 'zoetrope.core.timer'
require 'zoetrope.core.tween'
require 'zoetrope.core.view'

require 'zoetrope.input.gamepad'
require 'zoetrope.input.keys'
require 'zoetrope.input.mouse'

require 'zoetrope.sprites.animation'
require 'zoetrope.sprites.emitter'
require 'zoetrope.sprites.fill'
require 'zoetrope.sprites.map'
require 'zoetrope.sprites.text'
require 'zoetrope.sprites.tile'

require 'zoetrope.ui.button'
require 'zoetrope.ui.cursor'
require 'zoetrope.ui.textinput'

require 'zoetrope.utils.factory'
require 'zoetrope.utils.recorder'
require 'zoetrope.utils.storage'
require 'zoetrope.utils.subview'

if DEBUG then
	require 'zoetrope.debug.instrument'
	require 'zoetrope.debug.console'
	require 'zoetrope.debug.locals'
	require 'zoetrope.debug.performance'
	require 'zoetrope.debug.shortcuts'
	require 'zoetrope.debug.stack'
	require 'zoetrope.debug.stepper'
	require 'zoetrope.debug.watch'
	require 'zoetrope.debug.debugger'
end

-- simple load function to bootstrap the app if love.load() hasn't already been defined;
-- defining it again after this works fine as well

if not love.load then
	love.load = function()
		if the.app then
			-- if we only extended an app, instantiate it
			if not (the.app.view and the.app.meta) then the.app = the.app:new() end
			the.app:run()
		end
	end
end
