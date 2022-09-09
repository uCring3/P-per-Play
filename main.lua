io.stdout:setvbuf("no")

enet = require ("enet")			--🌐
sock = require ("libs/sock")
bitser = require ("libs/bitser")
require("host")
require("connect")				--🌐

require("general")
require("achievement")
require("gui")

tick = require ("libs/tick")
Object = require ("libs/classic")
anim8 = require ("libs/anim8")
InputField = require("libs/InputField")			--💬
require("libs/flux")
--require("libs/chrono")
--require("libs/fade")
Konami = require "libs/konami"
Konami.setWaitTime(1.5)
flux = require("libs/flux")
--chrono = Chrono()

require("music")						--[🎵
require("sfx")						--🎵]

require("entity")
require("entities/camps")
require("draw_order")
require("menu")
require("tutorial")
require("hamachi")
require("inventario")
require("player")
require("player2")
require("entities/cards")
require("entities/cards2")
require("abilita")

require("room")

require("font")
require("text_anim")
require("cursor")

function love.load()
	--window 															--[🔲
    window = {} 
    window.width, window.height, window.flags = love.window.getMode( )	--🔲]									

	attaccante = nessuno
	nessuno = {puoattaccare}

    cambia_turno = false
    giocatore = 1
    numeroCarteInMano = 1

    LOAD_ACHIEVEMENT()
    LOAD_JUMPSCARE()
    	--premi 6 9 del tastierino numerico 69 volte
    Konami.newCode({"kp6", "kp9", "kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6"}, function() love.system.openURL("https://www.reddit.com/user/Cring3_Crimson") end)
	gameState = "menu"
	LOAD_FONTS()
	host.IP = Testo[3]			--[🌐-💬
	connect.IP = Testo[4]		--🌐-💬]
	LOAD_CURSOR()
	LOAD_GENERAL()
	LOAD_TEXT_ANIM("", 0, 0, 0, 0, 0, 0, 0)
	--LOAD_FADE()
	LOAD_ROOM()
	campo:load()
	LOAD_MENU()
	LOAD_SFX()					--[🎵
	LOAD_MUSIC()
	love.audio.setVolume(1)
	music.menu:setLooping(true)
	music.menu:play()			--🎵]
end

function LOAD_INGAME()
	gameState = "inGame"
	LOAD_ROOM()
	LOAD_PLAYER()
	LOAD_PLAYER2()
	LOAD_GUI()
	LOAD_inventario()
	LOAD_GENERAL()
	Konami.newCode({"up", "up", "down", "down", "left", "right", "left", "right", "b", "a"}, function() 
		player.HP = player.maxHP
		general:scambio_dati_player_propria()
		 end)
end

function love.update(dt)

	Konami.update(dt)
	field:update(dt)			--💬
	tick.update(dt)
	
	if hoster then			--[🌐
		UPDATE_HOST(dt)
	end
	if connesso then		
		UPDATE_CONNECT(dt)
	end						--🌐]

    UPDATE_GENERAL(dt)
	flux.update(dt)
	UPDATE_GENERAL(dt)
	UPDATE_TEXT_ANIM(dt)
	UPDATE_ACHIEVEMENT(dt)
	UPDATE_JUMPSCARE(dt)

	if gameState == "inGame" then
		UPDATE_ROOM(dt)
		UPDATE_PLAYER(dt)
		UPDATE_PLAYER2(dt)
		UPDATE_GUI(dt)
		UPDATE_CARDS2(dt)
		UPDATE_CARDS(dt)
		general:morte()
		UPDATE_ABILITA(dt)
		UPDATE_TUTORIAL(dt)
		UPDATE_MUSIC()			--🎵

	elseif gameState == "inventario" then
		UPDATE_inventario(dt)
		inventario:update_leva(dt)

	elseif gameState == "menu" then
		UPDATE_FONTS(dt)
		UPDATE_MENU(dt)
		if hamachi.bool then
			UPDATE_HAMACHI(dt)
		end
	end

	for u,camp in ipairs(campi) do
    	for i,campo in ipairs(camp) do
        	campo:update()
        end
    end 

    if cambia_turno then
		Abilita:cambiaTurno()
		cambia_turno = false
	end
end


function love.draw()							--✏️

	if gameState == "inGame" then
		DRAW_ROOM()
		DRAW_GUI()
		DRAW_PLAYER2()
		DRAW_PLAYER()
		DRAW_TUTORIAL()

	elseif gameState == "inventario" then
		DRAW_inventario()
	elseif gameState == "menu" then
		DRAW_MENU()
		if hamachi.bool then
			DRAW_HAMACHI()
		end
	end
	--DRAW_FADE()
	DRAW_GENERAL()
	DRAW_ACHIEVEMENT()
	DRAW_JUMPSCARE()

	if hoster then			--[🌐
		DRAW_HOST()
	end
	if connesso then
		DRAW_CONNECT()
	end						--🌐]
    
	DRAW_GENERAL()
	DRAW_FONTS()

	if ToolBox then 							--[🧰
		love.graphics.setColor(0, 0, 0, .9)
		DRAW_TOOLBOX(1)
		love.graphics.setColor(1,1,1,1)
		DRAW_TOOLBOX(0)
		love.graphics.setFont(Font.menu)
	end 										--🧰]
	
end


function love.keypressed(key, scancode, isRepeat)									--⌨️
	Konami.keypressed(key)
	field:keypressed(key, isRepeat)												--💬
	if key == "return" then
		if Scrivere1 then
			Testi_Easteregg(1)
			menu.player1.text = Testo[1]
			Scrivere1 = false
		elseif Scrivere2 then
			Testi_Easteregg(2)
			menu.player2.text = Testo[2]
			Scrivere2 = false
		elseif Scrivere3 then
			Testi_Easteregg(3)
			host.IP = Testo[3]
			Scrivere3 = false
		elseif Scrivere4 then
			Testi_Easteregg(4)
			connect.IP = Testo[4]
			Scrivere4 = false
		end
	end

	if key == "f1" then 			--[🧰
		if ToolBox then
			ToolBox = false
		else
			ToolBox = true
		end
	end 							--🧰]

	if gameState == "inventario" then
		--deck pronto
		if key == "space" or key == "return" then
			if inventario.deck.total == inventario.deck.max then
				gameState = "inGame"
				LOAD_CARDS2()
				LOAD_CARDS()
				LOAD_ABILITA()
				player:scambio_nomi()
			end
			music.menu:stop()
			if not Bad_Millie:isPlaying() then
				music.inGame:play()
			end
		elseif key == "s" then
			inventario:saveDeck()
		end
	elseif gameState == "menu" then

	elseif gameState == "inGame" then
		--cambia turno
		if key == "f2" and ToolBox then
			if hoster then
            	Abilita:cambiaTurno()
            	server:sendToAll("cambia_turno_1-2", true)
        	elseif connesso then
         	   Abilita:cambiaTurno()
        	   client:send("cambia_turno_2-1", true)
        	end
        elseif key == "f3" and ToolBox then
			player:scambio_nomi()
		end
	end
end


function love.keyreleased(key)
end


function love.textinput(text)
	field:textinput(text)											--💬
end


function love.wheelmoved(dx, dy)									--🖱️
	field:wheelmoved(dx, dy)										--💬
	if gameState == "inventario" then
		inventario:navigate(dx, dy)
	end
end


function love.mousepressed(x, y, button)						--🖱️
	field:mousepressed(x-FIELD_INNER_X, y-FIELD_INNER_Y, button, pressCount)	--💬
	if gameState == "inventario" then
		inventario:select(button) 
	elseif gameState == "menu" and not Scrivere then
		menu:mouseClick(x, y, button)
		if hamachi.bool then
			hamachi:mouseClick(x, y, button)
		end
	elseif gameState == "inGame" then
		player:mouseClick(x, y, button)
		room:mouseClick(x, y, button)
		TUTORIAL_MOUSECLICK(x, y, button)
		gui:mouseClick(x, y, button)
		Abilita:activeAbility(x, y, button)
	end

	--chiudere il gioco
	if on_EXIT then
		if (button == 1) or (button == 2) then
			love.event.quit()
		elseif button == 3 then
			ACHIEVEMENT(
[[qual'è il tuo tasto 
del mouse preferito?]],
[[non puoi usare la rotellina 
per chiudere il gioco]],1)
		end
	end
end

function love.mousereleased(x, y, button)							--🖱️
	field:mousereleased(x-FIELD_INNER_X, y-FIELD_INNER_Y, button)					--💬
	if button == 1 then --tasto sx
		player:throw()
	end
	if gameState == "inGame" then
		Abilita:mousereleased(x, y, button)
	end	
end

function love.mousemoved(x, y, dx, dy)								--🖱️
	field:mousemoved(x-FIELD_INNER_X, y-FIELD_INNER_Y)							--💬

	if gameState == "inventario" then
		inventario:move_leva(x, y, dx, dy)
	end
	if gameState == "inGame" then
		Abilita:mousemoved(x, y, dx, dy)
		if gui.ruota.bool then
			gui:move_volume(x, y, dx, dy)
		end
	end
end

function DRAW_TOOLBOX(offset)												--ToolBox	--[🧰 	--✏️
	love.graphics.setFont(Font.extraFont)
	local drawStartTime = love.timer.getTime()

	love.graphics.print("giocatore: "..giocatore, 10+offset, 90+offset)
	love.graphics.print(gameState, 90+offset, 90+offset)
	love.graphics.print("mouse x,y: "..mouse.x..","..mouse.y, 10+offset, 110+offset)			--🖱️
	love.graphics.print("danno: "..danno, 10+offset, 130+offset)

	if gameState == "inGame" or gameState == "inventario" then
		for c, card in ipairs(inCampoCards) do 													--[🃏
			if card.puoattaccare then
				love.graphics.print("puo attaccare", (card.x)+offset, card.y+offset)
			else
				love.graphics.print("NON puo attaccare", (card.x)+offset, card.y+offset)
			end
			if card.puoabilita then
				love.graphics.print("puo abilita", (card.x)+offset, card.y+30+offset)
			else
				love.graphics.print("NON puo abilita", (card.x)+offset, card.y+30+offset)
			end
			if card.abilita then
				love.graphics.print("abilita", (card.x)+offset, card.y+60+offset)
			else
				--love.graphics.setColor(love.math.colorFromBytes(200,10,10,255))
				love.graphics.print("NON abilita", (card.x)+offset, card.y+60+offset)
				--love.graphics.setColor(love.math.colorFromBytes(0,0,0,255))
			end
			if card.stato.STORDITO then
				love.graphics.print("stordito", (card.x)+offset, card.y+90+offset)
			else
				love.graphics.print("NON stordito", (card.x)+offset, card.y+90+offset)
			end
		end
	
		for c,card in ipairs(inCampoCards) do
			love.graphics.print("sul campo: ", (10)+offset, 340+offset)
			love.graphics.print(card.id, 70+(30*c)+offset, 340+offset)
		end
		for c2,card2 in ipairs(inCampoCards2) do
			love.graphics.print("altro campo: ", (8)+offset, 370+offset)
			love.graphics.print(card2.id, 70+(30*c2)+offset, 370+offset)
		end
		for i,inv in ipairs(inventario.deck) do
			love.graphics.print("inventario: ", (10)+offset, 400+offset)
			love.graphics.print(inventario.deck[i], 70+(30*i)+offset, 400+offset)
		end
		for c,cardc in ipairs(CimiteroCards) do
			love.graphics.print("cimitero: ", (10)+offset, 430+offset)
			love.graphics.print(cardc.id, 70+(30*c)+offset, 430+offset)
		end
	end 																						--🃏]

	if gameState == "InGame" then
		for p,pe in ipairs(PEPONE.PE) do
			if PEPONE.PE[p] == "PE" then
				love.graphics.print("PE", (10)+offset, 145+offset)
			else love.graphics.print("pe", (10)+offset, 145+offset)
			end
		end
		for p,po in ipairs(PEPONE.PO) do
			if PEPONE.PO[p] == "PO" then
				love.graphics.print("PO", (30)+offset, 145+offset)
			else love.graphics.print("po", (30)+offset, 145+offset)
			end
		end
		for p,ne in ipairs(PEPONE.NE) do
			if PEPONE.NE[p] == "NE" then
				love.graphics.print("NE", (50)+offset, 145+offset)
			else love.graphics.print("ne", (50)+offset, 145+offset)
			end
		end
		if PEPONE.bool then 
			love.graphics.print("PEPONE", (10)+offset, 155+offset)
		else 
			love.graphics.print("pepone", (10)+offset, 155+offset)
		end
	end
	local dati_vari = string.format(
        "Memory: %.2f MB\nDraw time: %.1f ms\nIs busy: %s",
        collectgarbage"count" / 1024,
        (love.timer.getTime()-drawStartTime) * 1000,
        tostring(field:isBusy())
    )
    love.graphics.print(dati_vari, 0, window.height-4*Font.extraFont:getHeight())
end 																							--🧰]