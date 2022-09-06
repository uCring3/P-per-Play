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
require("libs/chrono")
Konami = require "libs/konami"
Konami.setWaitTime(1.5)
flux = require("libs/flux")
chrono = Chrono()

require("sound/music")						--[🎵
require("sound/sfx")						--🎵]

require("entity")
require("entities/camps")
require("draw_order")
require("menu/menu")
require("menu/tutorials/tutorial")
require("menu/tutorials/hamachi")
require("inventario")
require("player")
require("player2")
require("entities/cards")
require("entities/cards2")
require("abilita")

require("room")

require("fonts/font")
require("text_anim")
require("cursors/cursor")

require("fade")



function love.load()
	--window 															--[🔲
    window = {} 
    window.width, window.height, window.flags = love.window.getMode( )	--🔲]

    love.audio.setVolume(0.5)										--🎵

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
	LOAD_FADE()
	LOAD_ROOM()
	campo:load()
	LOAD_MENU()
	LOAD_SFX()			--[🎵
	LOAD_MUSIC()		--🎵]
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
    
	chrono:update(dt)
	flux.update(dt)
	UPDATE_GENERAL(dt)
	UPDATE_TEXT_ANIM(dt)
	UPDATE_ACHIEVEMENT(dt)
	UPDATE_JUMPSCARE(dt)

	UPDATE_FADE(dt)
	if gameState == "inGame" then
		UPDATE_ROOM(dt)
		UPDATE_PLAYER(dt)
		UPDATE_PLAYER2(dt)
		UPDATE_GUI(dt)
		UPDATE_CARDS2(dt)
		UPDATE_CARDS(dt)
		general:morte()
		UPDATE_ABILITA(dt)
		if tutorial.bool then
			UPDATE_TUTORIAL(dt)
		end

	elseif gameState == "inventario" then
		UPDATE_inventario(dt)
		if leva_back then
			inventario:update_leva(dt)
		end
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
		general:cambiaTurno()
		cambia_turno = false
	end
end


function love.draw()							--✏️

	if gameState == "inGame" then
		DRAW_ROOM()
		DRAW_PLAYER()
		DRAW_PLAYER2()
		DRAW_GUI()

		if tutorial.bool then
			DRAW_TUTORIAL()
		end

	elseif gameState == "inventario" then
		DRAW_inventario()
	elseif gameState == "menu" then
		DRAW_MENU()
		if hamachi.bool then
			DRAW_HAMACHI()
		end
	end
	DRAW_FADE()
	DRAW_GENERAL()
	DRAW_ACHIEVEMENT()
	DRAW_JUMPSCARE()

	if hoster then			--[🌐
		DRAW_HOST()
	end
	if connesso then
		DRAW_CONNECT()
	end						--🌐]
    
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
	DRAW_WINDOW_BAR()
	DRAW_VITTORIA_SCONFITTA()
	DRAW_FONTS()
	
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
		elseif key == "s" then
			inventario:saveDeck()
			print("salvato")
		end
	elseif gameState == "menu" then

	elseif gameState == "inGame" then
		--cambia turno
		if key == "f2" and ToolBox then
			if hoster then
            	general:cambiaTurno()
            	server:sendToAll("cambia_turno_1-2", true)
        	elseif connesso then
         	   general:cambiaTurno()
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
	elseif gameState == "inGame" then --print("A")
		player:mouseClick(x, y, button)
		room:mouseClick(x, y, button)
		if tutorial.bool then
			tutorial:mouseClick(x, y, button)
		end
	end

	--chiudere il gioco
	if on_EXIT then
		if (button == 1) or (button == 2) then
			love.event.quit()
		elseif button == 3 and not achievementSbloccati_a then
			ACHIEVEMENT(
[[qual'è il tuo tasto 
del mouse preferito?]],
[[non puoi usare la rotellina 
per chiudere il gioco]])
			achievementSbloccati_a = true
		end
	end
end

function love.mousereleased(x, y, button)							--🖱️
	field:mousereleased(x-FIELD_INNER_X, y-FIELD_INNER_Y, button)					--💬
	if button == 1 then --tasto sx
		player:throw()
	elseif button == 2 then --tasto dx
		if draw_laser then
			ANIMATE_LASER(x, y, button)
		elseif Telecinesi then
			love.mouse.setCursor(Cursor.TelecinesiLibero)
		end
	end
end

function love.mousemoved(x, y, dx, dy)								--🖱️
	field:mousemoved(x-FIELD_INNER_X, y-FIELD_INNER_Y)							--💬
	if Telecinesi then	
		ANIMATE_TELECINESI(x, y, dx, dy)
	end
	if gameState == "inventario" then
		inventario:move_leva(x, y, dx, dy)
	end
end
