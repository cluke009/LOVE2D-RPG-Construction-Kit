arc_path = 'arc/'
require(arc_path .. 'arc')
_navi = require(arc_path .. 'navi')

-- load variables
function love.load()
    -- shortcuts for love stuff
    le = love.event
    lg = love.graphics
    
    -- colors
    col = {
        white = {255,255,255},
	}
    -- images
    img = {
        logo = lg.newImage('pics/logo.png'),
		face = lg.newImage('pics/face.png'),
        avatar = lg.newImage('pics/avatar.png'),
        bg = lg.newImage('pics/bg-highup.png')
    }
    
    iw,ih = img.logo:getWidth(),img.logo:getHeight()
    sw,sh = 320,240
    lg.setBackgroundColor(unpack(col.white))
	    
    -- for game
    m = {}
    m[1] = _navi:new('Hey!|,|, Welcome to |c{mblue}Navi|c{white}, a message library for |c{mblue}LOVE|c{white}. |nPress |c{mgreen}'..arc.btn.ent..'|c{white} to continue.',
        {x=160, y=140, alx='m', alxb='m', alyb='m'})
    m[2] = _navi:new('This is a demo to show off Navi\'s features. Look through the code in |c{mred}main.lua|c{white} to help you understand what some of the options do.|nBut for a more complete review, read the |c{mred}manual.txt|c{white} file.|mAs you probably noticed, you can |c{mgreen}change text text color|c{white}, add pauses,|: and start text |non a new line. You can also request a keypress|!, and finally, continue the message|min the next message box. All these are done using string |c{mpurple}formatters|c{white}.', {x=160, y=140, alxb='m', alyb='m', w=200, nrows=5})
    m[3] = _navi:new('You can fix the message box width and have a name and face picture. This might work well if, i.e. you\'re making an RPG.', {x=10, y = 120, wbox=300, nrows=6, name='litearc', face=img.avatar})
    m[4] = _navi:new('Some messages cannot be skipped, so you have to sit through and read them. This may be good for certain cutscenes where timing is important.', {x=160, y = 120, alx='m', alxb='m', alyb='m', wbox=300, box=false, skip=false, wait=6})
    m[5] = _navi:new('Alright! Now for an (easy) question.|,.|,.|, What does "Navi refer to?"', {x=10, y = 120, wbox=300, nrows=6, name='litearc', face=img.avatar, nvchs=3, choices={'The aliens in Avatar', 'The little fairy from Zelda', 'Short for "navigator"', 'A village in Estonia'}})
    m_correct = _navi:new('Correct! |,|,You might have known this already from the forum topic (...or I guess the picture in the logo might have given it away).', {x=160, y=140, w=160, alxb='m', alyb='m'})
    m_wrong = _navi:new('Nope, sorry!', {x=160, y=140, w=100, alxb='m', alyb='m'})
    m2 = _navi:new('Anyway, that\'s it! Again, read the manual for more info as I didn\'t show off everything. And please report any bugs or give suggestions in the forum topic (see the |c{mred}manual.txt|c{white} file for a link). Thanks!',
        {x=160, y=140, alxb='m', alyb='m', w=200})
end

-- key press
function love.keypressed(k)
    arc.set_key(k)
    if k == 'q' then
        le.push('quit')
    end
end

-- update game
function love.update(dt)
    arc.check_keys(dt)
end

-- draw stuff
function love.draw()
	lg.setColor(col.white)
    lg.draw(img.bg,0,0)
    lg.draw(img.logo,0,20)
    
    if (m_correct:is_over() or m_wrong:is_over()) then
        m2:play(10,10)
    else
        if m[#m]:is_over() then
            local p = m[5]:get_pick()
            if p == 2 then
                m_correct:play(10,10)
            else
                m_wrong:play(10,10)
            end
        else _navi.play_list(m,10,10) end
    end
    arc.clear_key()
end
