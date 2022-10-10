font = {}
testo = {}

function font:load() --💾
	love.keyboard.setKeyRepeat(true)
	testo[1] = "Host"
	testo[2] = "Client"
	testo[3] = "*"
	testo[4] = "localhost"
	testo[5] = "WALL TExT hErE"
	testo[6] = [[L'umano il cui nome sara' scritto su questo quaderno morira'.]]

	self.horror = love.graphics.newFont("assets/fonts/horror.ttf",36)
	self.pixel = love.graphics.newFont("assets/fonts/pixel.ttf",100)
	self.Digi = love.graphics.newFont("assets/fonts/Digi.ttf",80)
	self.cardName = love.graphics.newFont("assets/fonts/Liberator.ttf",80)
	self.Avenir = love.graphics.newFont("assets/fonts/AvenirLTStd-Roman.otf",17)
	self.arial = love.graphics.newFont("assets/fonts/arial.ttf",70)
	self.verdana = love.graphics.newFont("assets/fonts/verdana.ttf",30)
	self.extraFont = love.graphics.newFont(12)
	self.RamonaBold = love.graphics.newFont("assets/fonts/Ramona-Bold.ttf",70)
	self.RamonaLight = love.graphics.newFont("assets/fonts/Ramona-Light.ttf",70)
		--per scritte a comparsa
	scaleTime = 0
	scaleX = 0.5
	scaleY = 0.5
end

function font:update(dt) --🔁
	if testo[3] == "" then 
		testo[3] = "*"
	elseif testo[4] == "" then 
		testo[4] = "localhost"
	end
	if blink then 
		Timer.after(.1, function()  --⏱️
			blink = false
		end)
	end
end	

function font:draw() --✏️
	for s,crivere in ipairs(scrivere) do
		if crivere then
			font:drawField(s) --✏️📄
		end
	end
	if blink then
		love.graphics.setColor(0,0,0) --🎨
		love.graphics.rectangle("fill",0,0,window.width,window.height)
		love.graphics.setColor(1,1,1) --🎨
	end
end

function font:loadField(A,B,C,D,E,F,testo) --📄

	FONT_SIZE        = A
	FONT_LINE_HEIGHT = 1.3

	FIELD_TYPE = "normal" -- Possible values: normal, password, multiwrap, multinowrap
	
	FIELD_OUTER_X      = B
	FIELD_OUTER_Y      = C-20
	FIELD_OUTER_WIDTH  = D
	FIELD_OUTER_HEIGHT = E
	FIELD_PADDING      = F

	FIELD_INNER_X      = B+F
	FIELD_INNER_Y      = C+F
	FIELD_INNER_WIDTH  = D
	FIELD_INNER_HEIGHT = E

	SCROLLBAR_WIDTH = 0
	BLINK_INTERVAL  = 0.90

	theFont = love.graphics.newFont(A)
	theFont:setLineHeight(FONT_LINE_HEIGHT)

	field = InputField(testo, FIELD_TYPE)
	field:setFont(theFont)
	field:setDimensions(FIELD_INNER_WIDTH, FIELD_INNER_HEIGHT)
end

function font:drawField(n) --✏️📄
	    -- Input field.
    love.graphics.setScissor(FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Background.
    love.graphics.setColor(0, 0, 0, 0.9) --🎨
    love.graphics.rectangle("fill", FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Selection.
	love.graphics.setColor(.2, .2, 1) --🎨
	for _, selectionX, selectionY, selectionWidth, selectionHeight in field:eachSelection() do
	    love.graphics.rectangle("fill", FIELD_INNER_X+selectionX, FIELD_INNER_Y+selectionY, selectionWidth, selectionHeight)
	end

    -- Text.
	love.graphics.setFont(theFont)
	love.graphics.setColor(1, 1, 1) --🎨
	for _, lineText, lineX, lineY in field:eachVisibleLine() do
	    love.graphics.print(lineText, FIELD_INNER_X+lineX, FIELD_INNER_Y+lineY)
	    testo[n] = lineText
	end

    -- Cursor.
    local cursorWidth = 2
    local cursorX, cursorY, cursorHeight = field:getCursorLayout()
    local alpha = ((field:getBlinkPhase() / BLINK_INTERVAL) % 1 < .5) and 1 or 0
    love.graphics.setColor(1, 1, 1, alpha) --🎨
    love.graphics.rectangle("fill", FIELD_INNER_X+cursorX-cursorWidth/2, FIELD_INNER_Y+cursorY, cursorWidth, cursorHeight)

    love.graphics.setScissor()

    -- Scrollbars.
    local horiOffset, horiCoverage, vertOffset, vertCoverage = field:getScrollHandles()

    local horiHandleLength = horiCoverage * FIELD_OUTER_WIDTH
    local vertHandleLength = vertCoverage * FIELD_OUTER_HEIGHT
    local horiHandlePos    = horiOffset   * FIELD_OUTER_WIDTH
    local vertHandlePos    = vertOffset   * FIELD_OUTER_HEIGHT

    -- Handles.
	love.graphics.setColor(.7, .7, .7) --🎨
	love.graphics.rectangle("fill", FIELD_OUTER_X+FIELD_OUTER_WIDTH, FIELD_OUTER_Y+vertHandlePos,  SCROLLBAR_WIDTH, vertHandleLength) -- Vertical scrollbar.
	love.graphics.rectangle("fill", FIELD_OUTER_X+horiHandlePos, FIELD_OUTER_Y+FIELD_OUTER_HEIGHT, horiHandleLength, SCROLLBAR_WIDTH) -- Horizontal scrollbar.
end

function Testi_Easteregg(n) --📄
	if testo[n] == "sans" then															--megalovenia
		love.audio.setVolume(0.5) --[🎵
		sfx.megalovenia_short:play()
	elseif testo[n] == "Sans" then 
		love.audio.setVolume(0.6)	
		sfx.megalovenia_short:play()
	elseif testo[n] == "SANS" then 
		love.audio.setVolume(1)
		sfx.megalovenia_short:setEffect("Reverb")	
		sfx.megalovenia_short:play()
	elseif testo[n] == "tf2" or testo[n] == "TF2" or testo[n] == "Kazotsky Kick" then 	--Kazotsky Kick
		love.audio.setVolume(1)
		if music.menu:isPlaying() then 
			music.menu:stop()
		elseif Bad_Millie:isPlaying() then
			Bad_Millie:pause()
		elseif Red_Sun:isPlaying() then
			music.Red_Sun:pause()
		end
		music.kazotsky_kick:setLooping(true)
		music.kazotsky_kick:play()
	elseif testo[n] == "Taiwan" or testo[n] == "TAIWAN" or testo[n] == "taiwan" then 	--Red_Sun
		testo[n] = "China"
		love.audio.setVolume(2)
		if music.menu:isPlaying() then 
			music.menu:stop()
		elseif Bad_Millie:isPlaying() then
			Bad_Millie:pause()
		elseif music.kazotsky_kick:isPlaying() then
			music.kazotsky_kick:pause()
		end
		music.Red_Sun:setLooping(true)
		music.Red_Sun:play()
	elseif testo[n] == "pepone" or testo[n] == "Pepone" or testo[n] == "PEPONE" then 	--Bad  Millie
		if music.menu:isPlaying() then 
			music.menu:stop()
		elseif music.kazotsky_kick:isPlaying() then
			music.kazotsky_kick:pause()
		elseif music.Red_Sun:isPlaying() then
			music.Red_Sun:pause()
		end
		Bad_Millie:play()
		Bad_Millie_Bool = true
	elseif testo[n] == "blink" or testo[n] == "Blink" or testo[n] == "BLINK" then 		--blink
		Timer.after((math.random(20,200)/10), function() --⏱️
			blink = true
		end)
	elseif testo[n] == "AAA" or testo[n] == "aaa" or testo[n] == "Aaa" then 			--blink
		sfx.AAA:play()		
	else 																			--Ferma ogni audio
		love.audio.stop(
			sfx.megalovenia_short,
			music.kazotsky_kick,
			music.Red_Sun)
		Bad_Millie:pause()
		Bad_Millie_Bool = false
		music.menu:play()
	end
	love.audio.setVolume(1) --🎵]
end