Font = {}
Testo = {}
	--lista Testi
--Testo[1] = player_1
--Testo[2] = player_2
--Testo[3] = IP_host
--Testo[4] = IP_client

function Font:load()
	love.keyboard.setKeyRepeat(true)
	Testo[1] = "Host"
	Testo[2] = "client"
	Testo[3] = "*"
	Testo[4] = "localhost"

	self.combatTextFont = love.graphics.newFont("fonts/bit.ttf",80)
	self.flagTextFont = love.graphics.newFont("fonts/bit.ttf",18)
	self.shiftFont = love.graphics.newFont("fonts/bit.ttf",18)
	self.numberFont = love.graphics.newFont("fonts/bit.ttf",24)
	self.menu = love.graphics.newFont("fonts/bit.ttf",60)
	self.menu2 = love.graphics.newFont("fonts/bit.ttf",24)
	self.menu3 = love.graphics.newFont("fonts/bit.ttf",36)
	self.horror = love.graphics.newFont("fonts/horror.ttf",36)
	self.pixel = love.graphics.newFont("fonts/pixel.ttf",100)

	self.cardName = love.graphics.newFont("fonts/Liberator.ttf",80)
	self.cardInfo = love.graphics.newFont("fonts/AvenirLTStd-Roman.otf",17)
	self.arial = love.graphics.newFont("fonts/arial.ttf",70)
	self.credits = love.graphics.newFont("fonts/verdana.ttf",30)

	self.extraFont = love.graphics.newFont(12)
	--per scritte a comparsa
	scaleTime = 0
	scaleX = 0.5
	scaleY = 0.5
end

function Font:load_stats1()							--💬

	FONT_SIZE        = 50
	FONT_LINE_HEIGHT = 1.3

	FIELD_TYPE = "normal" -- Possible values: normal, password, multiwrap, multinowrap
	
	FIELD_OUTER_X      = 76
	FIELD_OUTER_Y      = 275
	FIELD_OUTER_WIDTH  = 272
	FIELD_OUTER_HEIGHT = 62
	FIELD_PADDING      = 24

	FIELD_INNER_X      = FIELD_OUTER_X + FIELD_PADDING
	FIELD_INNER_Y      = FIELD_OUTER_Y-- + FIELD_PADDING
	FIELD_INNER_WIDTH  = FIELD_OUTER_WIDTH  - 2*FIELD_PADDING
	FIELD_INNER_HEIGHT = FIELD_OUTER_HEIGHT-- - 2*FIELD_PADDING

	SCROLLBAR_WIDTH = 0
	BLINK_INTERVAL  = 0.90

	theFont = love.graphics.newFont(FONT_SIZE)
	theFont:setLineHeight(FONT_LINE_HEIGHT)

	field = InputField(Testo[1], FIELD_TYPE)
	field:setFont(theFont)
	field:setDimensions(FIELD_INNER_WIDTH, FIELD_INNER_HEIGHT)
end

function Font:load_stats2()							--💬

	FONT_SIZE        = 50
	FONT_LINE_HEIGHT = 1.3

	FIELD_TYPE = "normal" -- Possible values: normal, password, multiwrap, multinowrap
	
	FIELD_OUTER_X      = 76
	FIELD_OUTER_Y      = 371
	FIELD_OUTER_WIDTH  = 272
	FIELD_OUTER_HEIGHT = 62
	FIELD_PADDING      = 24

	FIELD_INNER_X      = FIELD_OUTER_X + FIELD_PADDING
	FIELD_INNER_Y      = FIELD_OUTER_Y-- + FIELD_PADDING
	FIELD_INNER_WIDTH  = FIELD_OUTER_WIDTH  - 2*FIELD_PADDING
	FIELD_INNER_HEIGHT = FIELD_OUTER_HEIGHT-- - 2*FIELD_PADDING

	SCROLLBAR_WIDTH = 0
	BLINK_INTERVAL  = 0.90

	theFont = love.graphics.newFont(FONT_SIZE)
	theFont:setLineHeight(FONT_LINE_HEIGHT)

	field = InputField(Testo[2], FIELD_TYPE)
	field:setFont(theFont)
	field:setDimensions(FIELD_INNER_WIDTH, FIELD_INNER_HEIGHT)
end

function Font:load_stats3()							--💬

	FONT_SIZE        = 18
	FONT_LINE_HEIGHT = 1.3

	FIELD_TYPE = "normal" -- Possible values: normal, password, multiwrap, multinowrap
	
	FIELD_OUTER_X      = 1000
	FIELD_OUTER_Y      = 275
	FIELD_OUTER_WIDTH  = 200
	FIELD_OUTER_HEIGHT = 62
	FIELD_PADDING      = 24

	FIELD_INNER_X      = FIELD_OUTER_X + FIELD_PADDING
	FIELD_INNER_Y      = FIELD_OUTER_Y + 20
	FIELD_INNER_WIDTH  = FIELD_OUTER_WIDTH  - 2*FIELD_PADDING
	FIELD_INNER_HEIGHT = FIELD_OUTER_HEIGHT

	SCROLLBAR_WIDTH = 0
	BLINK_INTERVAL  = 0.90

	theFont = love.graphics.newFont(FONT_SIZE)
	theFont:setLineHeight(FONT_LINE_HEIGHT)

	field = InputField(Testo[3], FIELD_TYPE)
	field:setFont(theFont)
	field:setDimensions(FIELD_INNER_WIDTH, FIELD_INNER_HEIGHT)
end

function Font:load_stats4()							--💬

	FONT_SIZE        = 18
	FONT_LINE_HEIGHT = 1.3

	FIELD_TYPE = "normal" -- Possible values: normal, password, multiwrap, multinowrap
	
	FIELD_OUTER_X      = 1000
	FIELD_OUTER_Y      = 371
	FIELD_OUTER_WIDTH  = 200
	FIELD_OUTER_HEIGHT = 62
	FIELD_PADDING      = 24

	FIELD_INNER_X      = FIELD_OUTER_X + FIELD_PADDING
	FIELD_INNER_Y      = FIELD_OUTER_Y + 20
	FIELD_INNER_WIDTH  = FIELD_OUTER_WIDTH  - 2*FIELD_PADDING
	FIELD_INNER_HEIGHT = FIELD_OUTER_HEIGHT

	SCROLLBAR_WIDTH = 0
	BLINK_INTERVAL  = 0.90

	theFont = love.graphics.newFont(FONT_SIZE)
	theFont:setLineHeight(FONT_LINE_HEIGHT)

	field = InputField(Testo[4], FIELD_TYPE)
	field:setFont(theFont)
	field:setDimensions(FIELD_INNER_WIDTH, FIELD_INNER_HEIGHT)
end


function Font:draw()

    -- Input field.
    love.graphics.setScissor(FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Background.
    love.graphics.setColor(0, 0, 0, 0.9)
    love.graphics.rectangle("fill", FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Selection.
	love.graphics.setColor(.2, .2, 1)
	for _, selectionX, selectionY, selectionWidth, selectionHeight in field:eachSelection() do
	    love.graphics.rectangle("fill", FIELD_INNER_X+selectionX, FIELD_INNER_Y+selectionY, selectionWidth, selectionHeight)
	end

    -- Text.
	love.graphics.setFont(theFont)
	love.graphics.setColor(1, 1, 1)
	for _, lineText, lineX, lineY in field:eachVisibleLine() do
	    love.graphics.print(lineText, FIELD_INNER_X+lineX, FIELD_INNER_Y+lineY)
	    Testo[1] = lineText
	end

    -- Cursor.
    local cursorWidth = 2
    local cursorX, cursorY, cursorHeight = field:getCursorLayout()
    local alpha = ((field:getBlinkPhase() / BLINK_INTERVAL) % 1 < .5) and 1 or 0
    love.graphics.setColor(1, 1, 1, alpha)
    love.graphics.rectangle("fill", FIELD_INNER_X+cursorX-cursorWidth/2, FIELD_INNER_Y+cursorY, cursorWidth, cursorHeight)

    love.graphics.setScissor()

    -- Scrollbars.
    local horiOffset, horiCoverage, vertOffset, vertCoverage = field:getScrollHandles()

    local horiHandleLength = horiCoverage * FIELD_OUTER_WIDTH
    local vertHandleLength = vertCoverage * FIELD_OUTER_HEIGHT
    local horiHandlePos    = horiOffset   * FIELD_OUTER_WIDTH
    local vertHandlePos    = vertOffset   * FIELD_OUTER_HEIGHT

    -- Handles.
	love.graphics.setColor(.7, .7, .7)
	love.graphics.rectangle("fill", FIELD_OUTER_X+FIELD_OUTER_WIDTH, FIELD_OUTER_Y+vertHandlePos,  SCROLLBAR_WIDTH, vertHandleLength) -- Vertical scrollbar.
	love.graphics.rectangle("fill", FIELD_OUTER_X+horiHandlePos, FIELD_OUTER_Y+FIELD_OUTER_HEIGHT, horiHandleLength, SCROLLBAR_WIDTH) -- Horizontal scrollbar.

	love.graphics.setColor(love.math.colorFromBytes(255,255,255))
	love.graphics.print("INSERISCI IL TUO NOME E PREMI INVIO", 100, 760)

    love.graphics.setColor(1,1,1,1)
end

function Font:draw2()

    -- Input field.
    love.graphics.setScissor(FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Background.
    love.graphics.setColor(0, 0, 0, 0.9)
    love.graphics.rectangle("fill", FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Selection.
	love.graphics.setColor(.2, .2, 1)
	for _, selectionX, selectionY, selectionWidth, selectionHeight in field:eachSelection() do
	    love.graphics.rectangle("fill", FIELD_INNER_X+selectionX, FIELD_INNER_Y+selectionY, selectionWidth, selectionHeight)
	end

    -- Text.
	love.graphics.setFont(theFont)
	love.graphics.setColor(1, 1, 1)
	for _, lineText, lineX, lineY in field:eachVisibleLine() do
	    love.graphics.print(lineText, FIELD_INNER_X+lineX, FIELD_INNER_Y+lineY)
	    Testo[2] = lineText
	end

    -- Cursor.
    local cursorWidth = 2
    local cursorX, cursorY, cursorHeight = field:getCursorLayout()
    local alpha = ((field:getBlinkPhase() / BLINK_INTERVAL) % 1 < .5) and 1 or 0
    love.graphics.setColor(1, 1, 1, alpha)
    love.graphics.rectangle("fill", FIELD_INNER_X+cursorX-cursorWidth/2, FIELD_INNER_Y+cursorY, cursorWidth, cursorHeight)

    love.graphics.setScissor()

    -- Scrollbars.
    local horiOffset, horiCoverage, vertOffset, vertCoverage = field:getScrollHandles()

    local horiHandleLength = horiCoverage * FIELD_OUTER_WIDTH
    local vertHandleLength = vertCoverage * FIELD_OUTER_HEIGHT
    local horiHandlePos    = horiOffset   * FIELD_OUTER_WIDTH
    local vertHandlePos    = vertOffset   * FIELD_OUTER_HEIGHT

    -- Handles.
	love.graphics.setColor(.7, .7, .7)
	love.graphics.rectangle("fill", FIELD_OUTER_X+FIELD_OUTER_WIDTH, FIELD_OUTER_Y+vertHandlePos,  SCROLLBAR_WIDTH, vertHandleLength) -- Vertical scrollbar.
	love.graphics.rectangle("fill", FIELD_OUTER_X+horiHandlePos, FIELD_OUTER_Y+FIELD_OUTER_HEIGHT, horiHandleLength, SCROLLBAR_WIDTH) -- Horizontal scrollbar.

	love.graphics.setColor(love.math.colorFromBytes(255,255,255))
	love.graphics.print("INSERISCI IL TUO NOME E PREMI INVIO", 100, 760)

    love.graphics.setColor(1,1,1,1)
end

function Font:draw3()

    -- Input field.
    love.graphics.setScissor(FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Background.
    love.graphics.setColor(0, 0, 0, 0.9)
    love.graphics.rectangle("fill", FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Selection.
	love.graphics.setColor(.2, .2, 1)
	for _, selectionX, selectionY, selectionWidth, selectionHeight in field:eachSelection() do
	    love.graphics.rectangle("fill", FIELD_INNER_X+selectionX, FIELD_INNER_Y+selectionY, selectionWidth, selectionHeight)
	end

    -- Text.
	love.graphics.setFont(theFont)
	love.graphics.setColor(1, 1, 1)
	for _, lineText, lineX, lineY in field:eachVisibleLine() do
	    love.graphics.print(lineText, FIELD_INNER_X+lineX, FIELD_INNER_Y+lineY)
	    Testo[3] = lineText
	end

    -- Cursor.
    local cursorWidth = 2
    local cursorX, cursorY, cursorHeight = field:getCursorLayout()
    local alpha = ((field:getBlinkPhase() / BLINK_INTERVAL) % 1 < .5) and 1 or 0
    love.graphics.setColor(1, 1, 1, alpha)
    love.graphics.rectangle("fill", FIELD_INNER_X+cursorX-cursorWidth/2, FIELD_INNER_Y+cursorY, cursorWidth, cursorHeight)

    love.graphics.setScissor()

    -- Scrollbars.
    local horiOffset, horiCoverage, vertOffset, vertCoverage = field:getScrollHandles()

    local horiHandleLength = horiCoverage * FIELD_OUTER_WIDTH
    local vertHandleLength = vertCoverage * FIELD_OUTER_HEIGHT
    local horiHandlePos    = horiOffset   * FIELD_OUTER_WIDTH
    local vertHandlePos    = vertOffset   * FIELD_OUTER_HEIGHT

    -- Handles.
	love.graphics.setColor(.7, .7, .7)
	love.graphics.rectangle("fill", FIELD_OUTER_X+FIELD_OUTER_WIDTH, FIELD_OUTER_Y+vertHandlePos,  SCROLLBAR_WIDTH, vertHandleLength) -- Vertical scrollbar.
	love.graphics.rectangle("fill", FIELD_OUTER_X+horiHandlePos, FIELD_OUTER_Y+FIELD_OUTER_HEIGHT, horiHandleLength, SCROLLBAR_WIDTH) -- Horizontal scrollbar.

	love.graphics.setColor(love.math.colorFromBytes(255,255,255))
	love.graphics.print([[INSERISCI L'IP DI HAMACHI E PREMI INVIO ESEMPIO: 69.69.69.69]], 100, 760)

    love.graphics.setColor(1,1,1,1)
end

function Font:draw4()

    -- Input field.
    love.graphics.setScissor(FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Background.
    love.graphics.setColor(0, 0, 0, 0.9)
    love.graphics.rectangle("fill", FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Selection.
	love.graphics.setColor(.2, .2, 1)
	for _, selectionX, selectionY, selectionWidth, selectionHeight in field:eachSelection() do
	    love.graphics.rectangle("fill", FIELD_INNER_X+selectionX, FIELD_INNER_Y+selectionY, selectionWidth, selectionHeight)
	end

    -- Text.
	love.graphics.setFont(theFont)
	love.graphics.setColor(1, 1, 1)
	for _, lineText, lineX, lineY in field:eachVisibleLine() do
	    love.graphics.print(lineText, FIELD_INNER_X+lineX, FIELD_INNER_Y+lineY)
	    Testo[4] = lineText
	end

    -- Cursor.
    local cursorWidth = 2
    local cursorX, cursorY, cursorHeight = field:getCursorLayout()
    local alpha = ((field:getBlinkPhase() / BLINK_INTERVAL) % 1 < .5) and 1 or 0
    love.graphics.setColor(1, 1, 1, alpha)
    love.graphics.rectangle("fill", FIELD_INNER_X+cursorX-cursorWidth/2, FIELD_INNER_Y+cursorY, cursorWidth, cursorHeight)

    love.graphics.setScissor()

    -- Scrollbars.
    local horiOffset, horiCoverage, vertOffset, vertCoverage = field:getScrollHandles()

    local horiHandleLength = horiCoverage * FIELD_OUTER_WIDTH
    local vertHandleLength = vertCoverage * FIELD_OUTER_HEIGHT
    local horiHandlePos    = horiOffset   * FIELD_OUTER_WIDTH
    local vertHandlePos    = vertOffset   * FIELD_OUTER_HEIGHT

    -- Handles.
	love.graphics.setColor(.7, .7, .7)
	love.graphics.rectangle("fill", FIELD_OUTER_X+FIELD_OUTER_WIDTH, FIELD_OUTER_Y+vertHandlePos,  SCROLLBAR_WIDTH, vertHandleLength) -- Vertical scrollbar.
	love.graphics.rectangle("fill", FIELD_OUTER_X+horiHandlePos, FIELD_OUTER_Y+FIELD_OUTER_HEIGHT, horiHandleLength, SCROLLBAR_WIDTH) -- Horizontal scrollbar.

	love.graphics.setColor(love.math.colorFromBytes(255,255,255))
	love.graphics.print([[INSERISCI L'IP DATO DALL'ALTRO GIOCATORE E PREMI INVIOESEMPIO: 69.69.69.69]], 100, 760)

    love.graphics.setColor(1,1,1,1)
end

function Testi_Easteregg(n)
	if Testo[n] == "sans" then 													--megalovenia
		love.audio.setVolume(0.5)																	--[🎵
		sfx.megalovenia_short:play()
	elseif Testo[n] == "Sans" then 
		love.audio.setVolume(0.6)	
		sfx.megalovenia_short:play()
	elseif Testo[n] == "SANS" then 
		love.audio.setVolume(1)
		sfx.megalovenia_short:setEffect("Reverb")	
		sfx.megalovenia_short:play()
	elseif Testo[n] == "tf2" or Testo[n] == "TF2" or Testo[n] == "Kazotsky Kick" then 	--Kazotsky Kick
		love.audio.setVolume(1)
		music.kazotsky_kick:play()
	elseif Testo[n] == "pepone" or Testo[n] == "Pepone" or Testo[n] == "PEPONE" then 	--Bad  Millie
		Bad_Millie:play()
		Bad_Millie_Bool = true
	elseif Testo[n] == "blink" or Testo[n] == "Blink" or Testo[n] == "BLINK" then 	--blink
		tick.recur(function() blink = true end, (math.random(20,200)/10))
	elseif Testo[n] == "AAA" or Testo[n] == "aaa" or Testo[n] == "Aaa" then 	--blink
		sfx.AAA:play()
	else 																--Ferma ogni audio
		love.audio.stop(
			sfx.megalovenia_short,
			music.kazotsky_kick)
		Bad_Millie:pause()
		Bad_Millie_Bool = false
	end
	love.audio.setVolume(1)																			--🎵]
end

function LOAD_FONTS()
	Font:load()
	Font:load_stats1()
end

function UPDATE_FONTS(dt)
	if Testo[3] == "" then 
		Testo[3] = "*"
	elseif Testo[4] == "" then 
		Testo[4] = "localhost"
	end
	if blink then 
		tick.delay(function () blink = false end , .1)
	end
end

function DRAW_FONTS()
	if Scrivere1 then
		Font:draw()			--💬
	elseif Scrivere2 then
		Font:draw2()		--💬
	elseif Scrivere3 then
		Font:draw3()		--💬
	elseif Scrivere4 then
		Font:draw4()		--💬
	end
	if blink then
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill",0,0,window.width,window.height)
		love.graphics.setColor(1,1,1)
	end
end