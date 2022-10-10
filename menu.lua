menu = {}
menu.background = {img,speed}
menu.background.speed = 0.15

function menu:load() --💾
	menu.background.img = love.graphics.newImage("assets/menu/Grid682x385.png")
	menu.grid = anim8.newGrid(682, 385, menu.background.img:getWidth(), menu.background.img:getHeight())
	menu.animation = anim8.newAnimation(menu.grid('1-6',1), menu.background.speed)
	menu.titolo = love.graphics.newImage("assets/menu/Titolo.png")
	menu.fields1 = love.graphics.newImage("assets/menu/fields1.png")
	menu.fields2 = love.graphics.newImage("assets/menu/fields2.png")
	menu.page = 1
	menu.selection = 1

	menu.textSpacing = 20
	
	menu.player = {}
	menu.player.text = testo[1]
	menu.player.width = font.RamonaBold:getWidth(menu.player.text)
	menu.player.height = font.RamonaBold:getHeight(menu.player.text)
	menu.player.x, menu.player.y = window.width*0.07, window.height*0.345

	menu.player2 = {}
	menu.player2.text = testo[2]
	menu.player2.width = font.RamonaBold:getWidth(menu.player2.text)
	menu.player2.height = font.RamonaBold:getHeight(menu.player2.text)
	menu.player2.x, menu.player2.y = window.width*0.07, window.height*0.48

	menu.credits = {}
	menu.credits.text = "credits"
	menu.credits.width = font.RamonaBold:getWidth(menu.credits.text)
	menu.credits.height = font.RamonaBold:getHeight(menu.credits.text)
	menu.credits.x, menu.credits.y = window.width*0.09, window.height*0.59
	menu.credits.texts = {
		"Programmato da:","u/Cring3_Crimson   alias Ping",
		"ringrazio tutti i corsi      ","      di LÖVE engine online:","Sheepolution","AtiByte","https://love2d.org/","(Colui che risponde al 70% delle      ","      domande sui forums di LÖVE) zorg",
		"Artisti:","Summer","twitch : lupo_azteco","Discord : blackdarkness.exe",
		"Tecnici sonori:","Summer",
		"intro by Pepone & Plytlas","'iscrivetevi ai canali'",
		"Giochi di Ispirazione","CardCade","Boss Bashing Button Brawlers","Kingdom: New Lands","Kingdom: Two Crowns",
		"Persone di ispirazione","Discord: I know this meme      ","      Alias Sciagghi","Pepone e tutti i protagonisti del gioco",
		"Le canzoni utilizzate per il potere    ","    di Gin sono Copyright free:",
		"(inutilizzata) Begin Your Journey - Pix",
		"Alien wolves - Pix",
		"(inutilizzata) Digestive biscuit - Kubbi"
	}
	menu.credits.Y = 0

	menu.quit = {}
	menu.quit.text = "quit"
	menu.quit.width = font.RamonaBold:getWidth(menu.quit.text)
	menu.quit.height = font.RamonaBold:getHeight(menu.quit.text)
	menu.quit.x, menu.quit.y = window.width*0.09, window.height*0.685

	menu.hostIP = {}
	menu.hostIP.text = "host.IP"
	menu.hostIP.width = font.RamonaBold:getWidth(menu.hostIP.text)
	menu.hostIP.height = font.RamonaBold:getHeight(menu.hostIP.text)
	menu.hostIP.x, menu.hostIP.y = window.width*0.84, window.height*0.544

	menu.clientIP = {}
	menu.clientIP.text = "client.IP"
	menu.clientIP.width = font.RamonaBold:getWidth(menu.clientIP.text)
	menu.clientIP.height = font.RamonaBold:getHeight(menu.clientIP.text)
	menu.clientIP.x, menu.clientIP.y = window.width*0.83, window.height*0.65

	menu.tutorial = { --📔
		img = love.graphics.newImage("assets/menu/tutorials/ButtonGrid274^2.png"),
		x = window.width*0.856,
		y = window.height*0.25,
		scale = {x,y},
		speed = 0.025
	}
		menu.tutorial.width = menu.tutorial.img:getWidth()/7
		menu.tutorial.height = menu.tutorial.img:getHeight()
		menu.tutorial.scale.x = .25
		menu.tutorial.scale.y = .25
		menu.tutorial.grid = anim8.newGrid(math.floor(menu.tutorial.img:getWidth()/7), menu.tutorial.img:getHeight(), menu.tutorial.img:getWidth(), menu.tutorial.img:getHeight())
		menu.tutorial.animation = anim8.newAnimation(menu.tutorial.grid('1-7',1), menu.tutorial.speed)

	menu.hamachi = { --📔🌐
		img = love.graphics.newImage("assets/menu/tutorials/hamachi.png"),
		x = window.width*0.855,
		y = window.height*0.35
	}
		menu.hamachi.width = menu.hamachi.img:getWidth()
		menu.hamachi.height = menu.hamachi.img:getHeight()

	scrivere = {false,false,false,false}
end

local avviso = {}
avviso[1] = 1 
avviso[2] = 0.5 
avviso[3] = 0
local colora = {}
colora[1] = false
colora[2] = true
colora[3] = false
function menu:update(dt) --🔁
	menu.animation:update(dt) --🔁
	if general:calculateDistance(mouse.x, mouse.y, menu.tutorial.x+(menu.tutorial.width*menu.tutorial.scale.x)/2, menu.tutorial.y+(menu.tutorial.height*menu.tutorial.scale.y)/2) < 50 then
		menu.tutorial.animation:update(dt)
	elseif general:calculateDistance(mouse.x, mouse.y, menu.tutorial.x+(menu.tutorial.width*menu.tutorial.scale.x)/2, menu.tutorial.y+(menu.tutorial.height*menu.tutorial.scale.y)/2) < 300 then
		menu.tutorial.animation:update(dt/(general:calculateDistance(mouse.x, mouse.y, menu.tutorial.x+(menu.tutorial.width*menu.tutorial.scale.x)/2, menu.tutorial.y+(menu.tutorial.height*menu.tutorial.scale.y)/2)/50)) --🔁
	end
	if general:aabb(menu.player.x-60, menu.player.y+15, 272, 70, mouse.x, mouse.y, 1, 1) then
		menu.selection = 1
	elseif general:aabb(menu.player2.x-50, menu.player2.y+15, 272, 70, mouse.x, mouse.y, 1, 1) then
		menu.selection = 2
	elseif general:aabb(menu.credits.x-30, menu.credits.y+5, 198, 50, mouse.x, mouse.y, 1, 1) then
		menu.selection = 3
	elseif general:aabb(menu.quit.x-55, menu.quit.y+5, 198, 50, mouse.x, mouse.y, 1, 1) then
		menu.selection = 4
	elseif general:aabb(menu.hostIP.x-20, menu.hostIP.y+20, 200, 50, mouse.x, mouse.y, 1, 1) then
		menu.selection = 5
	elseif general:aabb(menu.clientIP.x-2, menu.clientIP.y+20, 202, 48, mouse.x, mouse.y, 1, 1) then
		menu.selection = 6
	else
		menu.selection = 0
	end
	if menu.selection > 6 then 
		menu.selection = 1
	elseif menu.selection < 0 then
		menu.selection = 6
	end
	if menu.page == 3 then
		menu.credits.Y = menu.credits.Y-20*dt
		if menu.credits.Y < -5000 then
			Senza_Titolo_bool = true
			SummerEgg:play()
			love.audio.stop(
			sfx.megalovenia_short,
			music.kazotsky_kick,
			music.Red_Sun,
			music.menu)
		Bad_Millie:pause()
		Bad_Millie_Bool = false
		Timer.after(10, function() --⏱️
			SummerEgg:release( )
			Senza_Titolo_bool = false
			love.load()
		end)
		elseif menu.credits.Y < -3600 then
			achievement:sblocca("NOT A MARVEL MOVIE","nessun finale post credits",3)
		end
	end
	for c=1,3 do
		if avviso[c] > 1 then
			colora[c] = false
		elseif avviso[c] < 0 then
			colora[c] = true
		end
		if colora[c] then
			avviso[c] = avviso[c]+0.1*dt
		else avviso[c] = avviso[c]-0.1*dt
		end
	end
	if menu.background.speed < 0.01 then
		achievement:sblocca("PEPONE IN HEAVEN","more, more, more",7)
	end
end

function menu:draw() --✏️
	menu.animation:draw(self.background.img, 0, 0, 0, window.width/(menu.background.img:getWidth()/6), window.height/menu.background.img:getHeight())
	love.graphics.draw(self.titolo, 0, 0, 0, .71, .71)
	love.graphics.setColor(1,1,1,1)		--🎨
	if Bad_Millie_Bool then
		love.graphics.draw(Bad_Millie, 0, 25, 0, window.width/(Bad_Millie:getWidth()), window.height/Bad_Millie:getHeight())
	end
	love.graphics.setFont(font.RamonaBold)
	if menu.selection == 1 then
		love.graphics.setColor(.1,.1,1) --🎨
	end
	love.graphics.print(menu.player.text,menu.player.x,menu.player.y)
	love.graphics.setColor(1,1,1) --🎨
	if menu.selection == 2 then
		love.graphics.setColor(.1,.1,1) --🎨
	end
	love.graphics.print(menu.player2.text,menu.player2.x,menu.player2.y)
	love.graphics.setColor(1,1,1) --🎨
	if menu.selection == 3 then
		love.graphics.setColor(.1,.1,1) --🎨
	end
	love.graphics.print(menu.credits.text,menu.credits.x,menu.credits.y,0,0.8,0.8)
	love.graphics.setColor(1,1,1) --🎨
	if menu.selection == 4 then
		love.graphics.setColor(.1,.1,1) --🎨
	end
	love.graphics.print(menu.quit.text,menu.quit.x,menu.quit.y)
	love.graphics.setColor(1,1,1) --🎨
	if menu.selection == 5 then
		love.graphics.setColor(.1,.1,1) --🎨
	end
	love.graphics.print(menu.hostIP.text,menu.hostIP.x,menu.hostIP.y,0,0.75,0.75)
	love.graphics.setColor(1,1,1) --🎨
	if menu.selection == 6 then
		love.graphics.setColor(.1,.1,1) --🎨
	end
	love.graphics.print(menu.clientIP.text,menu.clientIP.x,menu.clientIP.y,0,0.75,0.75)
	love.graphics.setColor(1,1,1) --🎨
	if menu.page == 3 then
		love.graphics.setColor(0,0,0,0.5) --🎨
		love.graphics.rectangle("fill",0,0,window.width,window.height)
		love.graphics.setColor(1,1,1,1) --🎨
		for t,text in ipairs(menu.credits.texts) do
			love.graphics.print(text,window.width/2-font.RamonaBold:getWidth(text)/2,menu.credits.Y+100*(t-1))
		end
	end
	menu.tutorial.animation:draw(menu.tutorial.img, menu.tutorial.x, menu.tutorial.y,0,menu.tutorial.scale.x,menu.tutorial.scale.y)
	love.graphics.draw(menu.hamachi.img, menu.hamachi.x, menu.hamachi.y)
	if Senza_Titolo_bool then
		love.graphics.draw(SummerEgg,  (window.width/2)-(SummerEgg:getWidth()/1.2), 25, 0, (window.width/SummerEgg:getWidth())/1.25, window.height/SummerEgg:getHeight())
	end
end

function menu:mousepressed(x, y, button) --🖱️
	if menu.page == 1 then
		if menu.selection == 1 then --crea_stanza/cambia nome
			if button == 1 and not (scrivere[1] or scrivere[2] or scrivere[3] or scrivere[4]) and not hamachi.bool then
				host:load() --[🌐
				--LOAD_INGAME()
				gamestate.switch(inventariO)
			elseif button == 2 and not scrivere[1] then
				scrivere[1] = true
				font:loadField(40,menu.player.x,menu.player.y,menu.player.width,menu.player.height,2.5,testo[1])
			end
		elseif menu.selection == 2 then --entra_stanza/cambia nome
			if button == 1 and not (scrivere[1] or scrivere[2] or scrivere[3] or scrivere[4]) and not hamachi.bool then
				connect:load() --🌐]
				--LOAD_INGAME()
				gamestate.switch(inventariO)
			elseif button == 2 and not scrivere[2] then
				scrivere[2] = true
				font:loadField(40,menu.player2.x,menu.player2.y,menu.player2.width,menu.player2.height,2.5,testo[2])
			end
		elseif menu.selection == 3 and not hamachi.bool and not (scrivere[1] or scrivere[2] or scrivere[3] or scrivere[4]) then --credits
			menu.credits.Y = window.height
			menu.page = 3
		elseif menu.selection == 4 then --quit
			if button == 3 then
				achievement:sblocca("Tasto sbagliato","non puoi chiudere il gioco\n con la rotellina del mouse",1)
			else
				love.event.quit()
			end
		elseif menu.selection == 5 then --inserisci IP
			if (button == 1 or button == 2) and not scrivere[3] then
				font:loadField(30,menu.hostIP.x,menu.hostIP.y,menu.hostIP.width,menu.hostIP.height,2.5,testo[3])
				scrivere[3] = true
			end
		elseif menu.selection == 6 then --inserisci IP
			if (button == 1 or button == 2) and not scrivere[4] then
				font:loadField(30,menu.clientIP.x,menu.clientIP.y,menu.clientIP.width,menu.clientIP.height,2.5,testo[4])
				scrivere[4] = true
			end
		elseif general:aabb(menu.tutorial.x, menu.tutorial.y, menu.tutorial.width*menu.tutorial.scale.x, menu.tutorial.height*menu.tutorial.scale.y, mouse.x, mouse.y, 1, 1) and (button == 1 or button == 2) and not hamachi.bool and not (Scrivere1 or Scrivere2 or Scrivere3 or Scrivere4) then
			tutorial.load() --📔
			if not Bad_Millie:isPlaying() then
				music.inGame:play()
			end
			music.menu:stop()
		elseif general:aabb(menu.hamachi.x, menu.hamachi.y, menu.hamachi.width, menu.hamachi.height, mouse.x, mouse.y, 1, 1) and (button == 1 or button == 2) and not hamachi.bool and not (Scrivere1 or Scrivere2 or Scrivere3 or Scrivere4) then
			hamachi.load() --📔🌐
		end				
	else
		menu.page = 1
	end
end

function menu:keypressed(key, scancode, isRepeat) --⌨️
	if key == "return" then
		if scrivere[1] then
			Testi_Easteregg(1)
			menu.player.text = testo[1]
			scrivere[1] = false
		elseif scrivere[2] then
			Testi_Easteregg(2)
			menu.player2.text = testo[2]
			scrivere[2] = false
		elseif scrivere[3] then
			Testi_Easteregg(3)
			host.IP = testo[3]
			scrivere[3] = false
		elseif scrivere[4] then
			Testi_Easteregg(4)
			connect.IP = testo[4]
			scrivere[4] = false
		end
	end
end