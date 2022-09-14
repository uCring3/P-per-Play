menu = {}


function menu:load()
	self.background = love.graphics.newImage("assets/menu/Grid682x385.png")
	self.grid = anim8.newGrid(682, 385, self.background:getWidth(), self.background:getHeight())
	self.animation = anim8.newAnimation(self.grid('1-6',1), 0.15)
	self.titolo = love.graphics.newImage("assets/menu/Titolo.png")
	self.fields1 = love.graphics.newImage("assets/menu/fields1.png")
	self.fields2 = love.graphics.newImage("assets/menu/fields2.png")
	self.page = 1
	self.selection = 1

	self.textSpacing = 20
	
	self.player1 = {}
	self.player1.text = Testo[1]
	self.player1.width = Font.menu:getWidth(self.player1.text)
	self.player1.height = Font.menu:getHeight(self.player1.text)
	self.player1.x, self.player1.y = 140, 260

	self.player2 = {}
	self.player2.text = Testo[2]
	self.player2.width = Font.menu:getWidth(self.player2.text)
	self.player2.height = Font.menu:getHeight(self.player2.text)
	self.player2.x, self.player2.y = 130, 360

	self.credits = {}
	self.credits.text = "credits"
	self.credits.width = Font.menu:getWidth(self.credits.text)
	self.credits.height = Font.menu:getHeight(self.credits.text)
	self.credits.x, self.credits.y = 145, 465

	creditsY = 0

	self.quit = {}
	self.quit.text = "quit"
	self.quit.width = Font.menu:getWidth(self.quit.text)
	self.quit.height = Font.menu:getHeight(self.quit.text)
	self.quit.x, self.quit.y = 172, 540

	self.hostIP = {}
	self.hostIP.text = "host.IP"
	self.hostIP.width = Font.menu:getWidth(self.hostIP.text)
	self.hostIP.height = Font.menu:getHeight(self.hostIP.text)
	self.hostIP.x, self.hostIP.y = 1000, 150

	self.clientIP = {}
	self.clientIP.text = "client.IP"
	self.clientIP.width = Font.menu:getWidth(self.clientIP.text)
	self.clientIP.height = Font.menu:getHeight(self.clientIP.text)
	self.clientIP.x, self.clientIP.y = 990, 230

	self.tutorial = {
		img = love.graphics.newImage("assets/menu/tutorials/button.png"),
		x = window.width*0.856,
		y = window.height*0.498
	}
		self.tutorial.width = self.tutorial.img:getWidth()
		self.tutorial.height = self.tutorial.img:getHeight()

	self.hamachi = {
		img = love.graphics.newImage("assets/menu/tutorials/hamachi.png"),
		x = window.width*0.855,
		y = window.height*0.59
	}
		self.hamachi.width = self.hamachi.img:getWidth()
		self.hamachi.height = self.hamachi.img:getHeight()
end

function menu:update(dt)
	  self.animation:update(dt)

	if self.page == 3 then
		self:moveCredits(dt)
	end
end

	
function menu:draw()														--✏️
	self.animation:draw(self.background, 0, 0, 0, 2, 2)
	love.graphics.draw(self.fields1, 0, 0, 0, .71, .71)
	love.graphics.draw(self.fields2, -window.width*0.1, -window.height*0.3, 0, .71, .71)
	love.graphics.draw(self.titolo, 0, 0, 0, .71, .71)
	love.graphics.setColor(1,1,1,1)		--🎨
	if Bad_Millie_Bool then
			love.graphics.draw(Bad_Millie, 0, 30, 0, 1.0153, 1.0153)
		end
	self:drawText()
	love.graphics.draw(self.tutorial.img, self.tutorial.x, self.tutorial.y)
	love.graphics.draw(self.hamachi.img, self.hamachi.x, self.hamachi.y)
	if Senza_Titolo_bool then
		love.graphics.draw(SummerEgg, 0, 25, 0, 1.15, 1.15)
	end
end


function menu:drawText()
	if self.page == 1 then

		love.graphics.setColor(1,1,1,1)
		love.graphics.setFont(Font.menu)

		if self.selection == 1 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.player1.text, self.player1.x, self.player1.y, 0,.8,.8)
		love.graphics.setColor(1,1,1,1)

		if self.selection == 2 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.player2.text, self.player2.x, self.player2.y, 0,.8,.8)
		love.graphics.setColor(1,1,1,1)

		if self.selection == 3 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.credits.text, self.credits.x, self.credits.y, 0, 0.5, 0.5)
		love.graphics.setColor(1,1,1,1)

		if self.selection == 4 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.quit.text, self.quit.x, self.quit.y, 0,.5,.5)
		love.graphics.setColor(1,1,1,1)

		if self.selection == 5 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.hostIP.text, self.hostIP.x, self.hostIP.y, 0, 0.7, 0.7)
		love.graphics.setColor(1,1,1,1)

		if self.selection == 6 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.clientIP.text, self.clientIP.x, self.clientIP.y, 0, 0.7, 0.7)
		love.graphics.setColor(1,1,1,1)

	elseif self.page == 3 then
		self:drawCredits(0,0,0,255,2)
		self:drawCredits(255,255,255,255,0)
	end

	if self.page == 3 then
		love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		love.graphics.setFont(Font.menu)
		love.graphics.print("Torna al Menu", window.width/5 - Font.menu:getWidth("Torna al Menu") / 2, window.height*0.22)
	end
end


function menu:moveCredits(dt)
	if not Senza_Titolo_bool then
		creditsY = creditsY+15*dt
	end
	if 1800 <= creditsY and creditsY <= 1825 then
		ACHIEVEMENT(
[[Non è la Marvel]],
[[Nessun finale Post credits]],3)
	elseif creditsY >= 3000 then
		music.menu:pause()
		Senza_Titolo_bool = true
		SummerEgg:play()
		creditsY = 3900
		tick.delay(function() 	
			SummerEgg:release( )
			Senza_Titolo_bool = false
			love.load()
		end, 10)
	end
end

function menu:drawCredits(r,g,b,a,offset)
	love.graphics.setFont(Font.credits)
	love.graphics.setColor(love.math.colorFromBytes(r,g,b,a))
	love.graphics.print("Programmer u/Cring3_Crimson Alias Ping", (screen.width / 2 - Font.menu2:getWidth("Programmer u/Cring3_Crimson Alias Ping_________________") / 2)-offset, window.height 	+0-offset -creditsY)
	love.graphics.print("ringrazio tutti i corsi di LÖVE engine online:", (screen.width / 2 - Font.menu2:getWidth("  ringrazio tutti i corsi di LÖVE engine online   ") / 2)-offset, window.height 	+50-offset -creditsY)
	love.graphics.print("Sheepolution", (screen.width / 2 - Font.menu2:getWidth("Sheepolution") / 2)-offset, window.height 																			+100-offset -creditsY)
	love.graphics.print("AtiByte", (screen.width / 2 - Font.menu2:getWidth("AtiByte") / 2)-offset, window.height 																					+150-offset -creditsY)
	love.graphics.print("https://love2d.org/", (screen.width / 2 - Font.menu2:getWidth("https://love2d.org/") / 2)-offset, window.height 															+200-offset -creditsY)
	love.graphics.print("Colui che risponde al 70%", (screen.width / 2 - Font.menu2:getWidth("Colui che risponde al 70%") / 2)-offset, window.height 												+250-offset -creditsY)
	love.graphics.print(" delle domande sui forums di LÖVE:", (screen.width / 2 - Font.menu2:getWidth(" delle domande sui forums di LÖVE:") / 2)-offset, window.height 								+290-offset -creditsY)
	love.graphics.print("zorg", (screen.width / 2 - Font.menu2:getWidth("zorg") / 2)-offset, window.height 																							+340-offset -creditsY)
	love.graphics.print("Artisti:", (screen.width / 2 - Font.menu2:getWidth("Artisti:") / 2)-offset, window.height 																					+400-offset -creditsY)
	love.graphics.print("Summer", (screen.width / 2 - Font.menu2:getWidth("Summer") / 2)-offset, window.height 																						+450-offset -creditsY)
	love.graphics.print("twitch : lupo_azteco", (screen.width / 2 - Font.menu2:getWidth("twitch : lupo_azteco") / 2)-offset, window.height 															+500-offset -creditsY)
	love.graphics.print("Discord : blackdarkness.exe", (screen.width / 2 - Font.menu2:getWidth("Discord : blackdarkness.exe") / 2)-offset, window.height 											+550-offset -creditsY)
	love.graphics.print("Tecnici sonori:", (screen.width / 2 - Font.menu2:getWidth("Tecnici sonori:") / 2)-offset, window.height 																	+600-offset -creditsY)
	love.graphics.print("Summer", (screen.width / 2 - Font.menu2:getWidth("Summer") / 2)-offset, window.height 																						+650-offset -creditsY)
	love.graphics.print("intro by Pepone & Plytlas", (screen.width / 2 - Font.menu2:getWidth("intro by Pepone & Plytlas") / 2)-offset, window.height 												+700-offset -creditsY)
	love.graphics.print("'iscrivetevi ai canali'", (screen.width / 2 - Font.menu2:getWidth("'iscrivetevi ai canali'") / 2)-offset, window.height 													+750-offset -creditsY)
	love.graphics.print("Giochi di Ispirazione", (screen.width / 2 - Font.menu2:getWidth("Giochi di Ispirazione") / 2)-offset, window.height 														+800-offset -creditsY)
	love.graphics.print("CardCade", (screen.width / 2 - Font.menu2:getWidth("CardCade") / 2)-offset, window.height 																					+850-offset -creditsY)
	love.graphics.print("Boss Bashing Button Brawlers", (screen.width / 2 - Font.menu2:getWidth("Boss Bashing Button Brawlers") / 2)-offset, window.height 											+900-offset -creditsY)
	love.graphics.print("Kingdom: New Lands", (screen.width / 2 - Font.menu2:getWidth("Kingdom: New Lands") / 2)-offset, window.height 																+950-offset -creditsY)
	love.graphics.print("Kingdom: Two Crowns", (screen.width / 2 - Font.menu2:getWidth("Kingdom: Two Crowns") / 2)-offset, window.height 															+1000-offset -creditsY)
	love.graphics.print("Persone di ispirazione", (screen.width / 2 - Font.menu2:getWidth("Persone di ispirazione") / 2)-offset, window.height 														+1050-offset -creditsY)
	love.graphics.print("Discord: I know this meme  Alias Sciagghi", (screen.width / 2 - Font.menu2:getWidth("Discord: I know this meme  Alias Sciagghi") / 2)-offset, window.height 				+1100-offset -creditsY)
end


globalScreen = false


function menu:mouseClick(x, y, button)
	if self.page == 1 then
		if self.selection == 1 then
			if button == 1 and not (Scrivere1 or Scrivere2 or Scrivere3 or Scrivere4) and not hamachi.bool then
				--crea_stanza								--[🌐
				LOAD_HOST()	
				LOAD_INGAME()
				gameState = "inventario"
			elseif button == 2 and not Scrivere1 then
				Scrivere1 = true
				Font:load_stats1()
			end
		elseif self.selection == 2 then --entra_stanza
			if button == 1 and not (Scrivere1 or Scrivere2 or Scrivere3 or Scrivere4) and not hamachi.bool then
				--entra stanza
				LOAD_CONNECT()
				LOAD_INGAME()
				gameState = "inventario"						--🌐]
			elseif button == 2 and not Scrivere2 then
				Scrivere2 = true
				Font:load_stats2()
			end
		elseif self.selection == 3 and not hamachi.bool and not (Scrivere1 or Scrivere2 or Scrivere3 or Scrivere4) then --credits
			creditsY = 0
			menu.page = 3
		elseif self.selection == 4 then --quit
			love.event.quit()
		elseif self.selection == 5 then --inserisci IP
			if (button == 1 or button == 2) and not Scrivere3 then
				Scrivere3 = true
				Font:load_stats3()
			end
		elseif self.selection == 6 then --inserisci IP
			if (button == 1 or button == 2) and not Scrivere4 then
				Scrivere4 = true
				Font:load_stats4()
			end
		elseif general:aabb(self.tutorial.x, self.tutorial.y, self.tutorial.width, self.tutorial.height, mouse.x, mouse.y, 1, 1) and (button == 1 or button == 2) and not hamachi.bool and not (Scrivere1 or Scrivere2 or Scrivere3 or Scrivere4) then
			LOAD_TUTORIAL()
			if not Bad_Millie:isPlaying() then
				music.inGame:play()
			end
			music.menu:stop()
		elseif general:aabb(self.hamachi.x, self.hamachi.y, self.hamachi.width, self.hamachi.height, mouse.x, mouse.y, 1, 1) and (button == 1 or button == 2) and not hamachi.bool and not (Scrivere1 or Scrivere2 or Scrivere3 or Scrivere4) then
			LOAD_HAMACHI()
		end				
	else
		menu.page = 1
	end
end

---[[ migliorabile?
function HOVER_MENU()
	if general:aabb(menu.player1.x-60, menu.player1.y+15, 272, 70, mouse.x, mouse.y, 1, 1) then
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
end --]]


function LOAD_MENU()
	menu:load()
end

function UPDATE_MENU(dt)
	HOVER_MENU()
	menu:update(dt)
end

function DRAW_MENU()
	menu:draw()
end