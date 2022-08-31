io.stdout:setvbuf("no")

menu = {}


function menu:load()
	menu.image = love.graphics.newImage("menu/Grid668x377.png")
	menu.grid = anim8.newGrid(668, 377, menu.image:getWidth(), menu.image:getHeight())
	menu.animation = anim8.newAnimation(menu.grid('1-6',1), 0.15)
	self.page = 1
	self.selection = 1

	self.textSpacing = 20
	
	self.player1 = {}
	self.player1.text = Testo[1]
	self.player1.width = Font.menu:getWidth(self.player1.text)
	self.player1.height = Font.menu:getHeight(self.player1.text)
	self.player1.x, self.player1.y = 100, 275

	self.player2 = {}
	self.player2.text = Testo[2]
	self.player2.width = Font.menu:getWidth(self.player2.text)
	self.player2.height = Font.menu:getHeight(self.player2.text)
	self.player2.x, self.player2.y = 100, 375

	self.credits = {}
	self.credits.text = "credits"
	self.credits.width = Font.menu:getWidth(self.credits.text)
	self.credits.height = Font.menu:getHeight(self.credits.text)
	self.credits.x, self.credits.y = 115, 460

	creditsY = 0

	self.quit = {}
	self.quit.text = "quit"
	self.quit.width = Font.menu:getWidth(self.quit.text)
	self.quit.height = Font.menu:getHeight(self.quit.text)
	self.quit.x, self.quit.y = 152, 535

	self.hostIP = {}
	self.hostIP.text = "hostIP"
	self.hostIP.width = Font.menu:getWidth(self.hostIP.text)
	self.hostIP.height = Font.menu:getHeight(self.hostIP.text)
	self.hostIP.x, self.hostIP.y = 1000, 275

	self.clientIP = {}
	self.clientIP.text = "clientIP"
	self.clientIP.width = Font.menu:getWidth(self.clientIP.text)
	self.clientIP.height = Font.menu:getHeight(self.clientIP.text)
	self.clientIP.x, self.clientIP.y = 1000, 375
end


function menu:update(dt)
	  menu.animation:update(dt)

	if self.page == 3 then
		self:moveCredits(dt)
	end
end

	
function menu:draw()														--✏️
	menu.animation:draw(menu.image, 0, 0, 0, 2, 2)
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))		--🎨
	if Bad_Millie_Bool then
			love.graphics.draw(Bad_Millie, 0, 30, 0, 1.0153, 1.0153)
		end
	self:drawText()
end


function menu:drawText()
	if self.page == 1 then

		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
		love.graphics.setFont(Font.menu)

		if self.selection == 1 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.player1.text, self.player1.x, self.player1.y)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))

		if self.selection == 2 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.player2.text, self.player2.x, self.player2.y)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))

		if self.selection == 3 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.credits.text, self.credits.x, self.credits.y, 0, 0.85, 0.85)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))

		if self.selection == 4 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.quit.text, self.quit.x, self.quit.y)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))

		if self.selection == 5 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.hostIP.text, self.hostIP.x, self.hostIP.y)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))

		if self.selection == 6 then
			love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		end
		love.graphics.print(self.clientIP.text, self.clientIP.x, self.clientIP.y)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))

	elseif self.page == 3 then
		self:drawCredits(0,0,0,255,2)
		self:drawCredits(255,255,255,255,0)
	end

	if self.page == 3 then
		love.graphics.setColor(love.math.colorFromBytes(52,134,157,255))
		love.graphics.setFont(Font.menu)
		love.graphics.print("Torna al Menu", screen.width / 5 - Font.menu:getWidth("Torna al Menu") / 2, 80)
	end
end



function menu:moveCredits(dt)
	creditsY = creditsY+15*dt
	if 1600 <= creditsY and creditsY <= 1625 then
		ACHIEVEMENT(
[[Non è la Marvel]],
[[Nessun finale Post credits]])
		achievementSbloccati_c = true
	end
end

function menu:drawCredits(r,g,b,a,offset)
	love.graphics.setFont(Font.credits)
	love.graphics.setColor(love.math.colorFromBytes(r,g,b,a))
	love.graphics.print("Programmer u/Cring3_Crimson Alias Ping", (screen.width / 2 - Font.menu2:getWidth("Programmer u/Cring3_Crimson Alias Ping_________________") / 2)-offset, window.height+0-offset -creditsY)
	love.graphics.print("ringrazio tutti i corsi di LÖVE engine online:", (screen.width / 2 - Font.menu2:getWidth("  ringrazio tutti i corsi di LÖVE engine online   ") / 2)-offset, window.height+50-offset -creditsY)
	love.graphics.print("Sheepolution", (screen.width / 2 - Font.menu2:getWidth("Sheepolution") / 2)-offset, window.height+100-offset -creditsY)
	love.graphics.print("AtiByte", (screen.width / 2 - Font.menu2:getWidth("AtiByte") / 2)-offset, window.height+150-offset -creditsY)
	love.graphics.print("https://love2d.org/", (screen.width / 2 - Font.menu2:getWidth("https://love2d.org/") / 2)-offset, window.height+200-offset -creditsY)
	love.graphics.print("Colui che risponde al 70%", (screen.width / 2 - Font.menu2:getWidth("Colui che risponde al 70%") / 2)-offset, window.height+250-offset -creditsY)
	love.graphics.print(" delle domande su forums e server di LÖVE:", (screen.width / 2 - Font.menu2:getWidth(" delle domande su forums e server di LÖVE:") / 2)-offset, window.height+290-offset -creditsY)
	love.graphics.print("zorg", (screen.width / 2 - Font.menu2:getWidth("zorg") / 2)-offset, window.height+340-offset -creditsY)
	love.graphics.print("Artisti:", (screen.width / 2 - Font.menu2:getWidth("Artisti:") / 2)-offset, window.height+400-offset -creditsY)
	love.graphics.print("Summer", (screen.width / 2 - Font.menu2:getWidth("Summer") / 2)-offset, window.height+450-offset -creditsY)
	love.graphics.print("twitch : lupo_azteco", (screen.width / 2 - Font.menu2:getWidth("twitch : lupo_azteco") / 2)-offset, window.height+500-offset -creditsY)
	love.graphics.print("Discord : blackdarkness.exe", (screen.width / 2 - Font.menu2:getWidth("Discord : blackdarkness.exe") / 2)-offset, window.height+550-offset -creditsY)
	love.graphics.print("intro by Pepone & Plytlas", (screen.width / 2 - Font.menu2:getWidth("intro by Pepone & Plytlas") / 2)-offset, window.height+600-offset -creditsY)
	love.graphics.print("'iscrivetevi ai canali'", (screen.width / 2 - Font.menu2:getWidth("'iscrivetevi ai canali'") / 2)-offset, window.height+650-offset -creditsY)
	love.graphics.print("Giochi di Ispirazione", (screen.width / 2 - Font.menu2:getWidth("Giochi di Ispirazione") / 2)-offset, window.height+700-offset -creditsY)
	love.graphics.print("CardCade", (screen.width / 2 - Font.menu2:getWidth("CardCade") / 2)-offset, window.height+750-offset -creditsY)
	love.graphics.print("Boss Bashing Button Brawlers", (screen.width / 2 - Font.menu2:getWidth("Boss Bashing Button Brawlers") / 2)-offset, window.height+800-offset -creditsY)
	love.graphics.print("Kingdom: New Lands", (screen.width / 2 - Font.menu2:getWidth("Kingdom: New Lands") / 2)-offset, window.height+850-offset -creditsY)
	love.graphics.print("Kingdom: Two Crowns", (screen.width / 2 - Font.menu2:getWidth("Kingdom: Two Crowns") / 2)-offset, window.height+900-offset -creditsY)
	love.graphics.print("Persone di ispirazione", (screen.width / 2 - Font.menu2:getWidth("Persone di ispirazione") / 2)-offset, window.height+950-offset -creditsY)
	love.graphics.print("Discord: I know this meme  Alias Sciagghi", (screen.width / 2 - Font.menu2:getWidth("Discord: I know this meme  Alias Sciagghi") / 2)-offset, window.height+1000-offset -creditsY)
end


globalScreen = false


function menu:mouseClick(button)
	if self.page == 1 then
		if self.selection == 1 then
			if button == 1 and not Scrivere1 then
				--crea_stanza								--[🌐
				LOAD_HOST()	
				fade.inOut(0.2, 0.1)
				chrono:after(0.2, function()
					LOAD_INGAME()
					gameState = "inventario"
				end)
				--fade.inOut(0.2, 0.1)
				--chrono:after(0.2, function()
				--	gameState = "inGame"
				--	LOAD_INGAME()
				--	
				--end)
			elseif button == 2 and not Scrivere1 then
				Scrivere1 = true
				Font:load_stats1()
			end
		elseif self.selection == 2 then --entra_stanza
			if button == 1 and not Scrivere2 then
				LOAD_CONNECT()
				fade.inOut(0.2, 0.1)
				chrono:after(0.2, function()
					LOAD_INGAME()
					gameState = "inventario"
				end)
				--fade.inOut(0.2, 0.1)
				--chrono:after(0.2, function()
				--	menu.page = 2
				--end)										--🌐]
			elseif button == 2 and not Scrivere2 then
				Scrivere2 = true
				Font:load_stats2()
			end
		elseif self.selection == 3 then
			fade.inOut(0.2, 0.1)
			chrono:after(0.2, function()
				creditsY = 0
				menu.page = 3
			end)
		elseif self.selection == 4 then
			love.event.quit()
		elseif self.selection == 5 then
			if (button == 1 or button == 2) and not Scrivere3 then
				Scrivere3 = true
				Font:load_stats3()
			end
		elseif self.selection == 6 then --entra_stanza
			if (button == 1 or button == 2) and not Scrivere4 then
				Scrivere4 = true
				Font:load_stats4()
			end
		end				

	else
		fade.inOut(0.2, 0.1)
		chrono:after(0.2, function()
			menu.page = 1
		end)
	end
end

---[[ migliorabile?
function HOVER_MENU()
	if general:aabb(76, 275, 272, 62, mouse.x, mouse.y, 1, 1) == true then
		menu.selection = 1
	elseif general:aabb(76, 371, 272, 62, mouse.x, mouse.y, 1, 1) == true then
		menu.selection = 2
	elseif general:aabb(112, 462, 198, 47, mouse.x, mouse.y, 1, 1) == true then
		menu.selection = 3
	elseif general:aabb(112, 540, 198, 47, mouse.x, mouse.y, 1, 1) == true then
		menu.selection = 4
	elseif general:aabb(1000, 275, 200, 62, mouse.x, mouse.y, 1, 1) == true then
		menu.selection = 5
	elseif general:aabb(1000, 371, 200, 62, mouse.x, mouse.y, 1, 1) == true then
		menu.selection = 6
	else
		menu.selection = 0
	end
end
--]]


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