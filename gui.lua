gui = {}


function gui:load()
	self:loadDeck()
	self.newCardY = - 520 -- è questo che fa l'y della mano??

	--turno
	turno = {}
	turno.n = 1
	turno.x = room.cambia_turno.x+70
	turno.y = room.cambia_turno.y
	turno.r = 0
	if connesso then
		turno.r = turno.r -3.14
	end
	if connesso then
		turno.x = turno.x + 140
		turno.y = turno.y + 37
	end
end


function gui:loadDeck()
		--quadro impostazioni
	self.deck = {img = love.graphics.newImage("assets/settings/impostazioni.png")}
	self.deck.width = self.deck.img:getWidth()
	self.deck.height = self.deck.img:getHeight()
	self.deck.x = window.width - self.deck.width
	self.deck.y = window.height - self.deck.height * 1.1
	self.deck.scale = 0.75
	self.deck.defaultScale = 0.75
		--rotellina
	self.ruota = {img = love.graphics.newImage("assets/settings/ruota_dentata.png")}
	self.ruota.width = self.ruota.img:getWidth()
	self.ruota.height = self.ruota.img:getHeight()
	self.ruota.x = self.deck.x - self.deck.width*1.6
	self.ruota.y = self.deck.y - self.deck.height
	self.ruota.r = 0
	self.ruota.scale = 0.15
	self.ruota.defaultScale = 0.15
	self.ruota.bool = false
end


function gui:update(dt)
	if self.ruota.bool and self.ruota.r <= math.pi then
		gui:move_ruota(dt)								--⚙️
	elseif not self.ruota.bool and self.ruota.r <= math.pi*2 and self.ruota.r >= math.pi then
		gui:move_ruota2(dt)
	end
end


function gui:move_ruota(dt)								--[⚙️
	self.ruota.r = self.ruota.r +1*dt
end

function gui:move_ruota2(dt)	
	self.ruota.r = self.ruota.r +1*dt
	if self.ruota.r >= math.pi*2 then
		self.ruota.r = 0
	end
end													--⚙️]


function gui:load_volume()															--[🔊
	self.volume = {img = love.graphics.newImage("assets/settings/volume.png")}
	self.volume.width = self.volume.img:getWidth()
	self.volume.height = self.volume.img:getHeight()
	self.volume.x = self.deck.x + 10
	self.volume.y = self.deck.y
	self.volume.r = 0
	self.volume.scalex = 0.20
	self.volume.scaley = 0.30

	self.rectangle = {}
	self.rectangle.x = self.volume.x
	self.rectangle.y = self.volume.y
	self.rectangle.width = self.volume.width*self.volume.scalex
	self.rectangle.height = self.volume.height*self.volume.scaley
end

function gui:move_volume(x, y, dx, dy)
	if general:aabb(self.volume.x, self.volume.y, self.volume.width, self.volume.height, mouse.x, mouse.y, 1, 1)
	 and (love.mouse.isDown(1) or love.mouse.isDown(2) or love.mouse.isDown(3)) then 								--⚙️
		if self.rectangle.width > 0 then
			self.rectangle.width = self.rectangle.width +dx
			love.audio.setVolume(self.rectangle.width/100)
		else
			self.rectangle.width = 0 
		end
	end
end 

function gui:draw_volume()
	love.graphics.draw(self.volume.img, self.volume.x, self.volume.y, self.volume.r, self.volume.scalex, self.volume.scaley)
	love.graphics.setColor(0.5,1,1)
	love.graphics.rectangle("fill", self.rectangle.x, self.rectangle.y, self.rectangle.width, self.rectangle.height)
end																														--🔊]


function gui:draw()																			--✏️
	self:drawDeck()
	DRAW_CARDS2()
	DRAW_CARDS()
	DRAW_ABILITA()
	love.graphics.setFont(Font.cardName)
	self:drawTurno()
end

function gui:drawTurno()																	--✏️
		--turni
	love.graphics.print("Turno "..turno.n, turno.x, turno.y, turno.r, 1/2, 1/2)
end

function gui:drawDeck()																		--✏️
	
	love.graphics.draw(self.deck.img, self.deck.x + self.deck.width / 2, self.deck.y + self.deck.height / 2, 0, self.deck.scale, self.deck.scale, self.deck.width / 2, self.deck.height / 2)
	love.graphics.draw(self.ruota.img, self.ruota.x + self.ruota.width / 2, self.ruota.y + self.ruota.height / 2, self.ruota.r, self.ruota.scale, self.ruota.scale, self.ruota.width / 2, self.ruota.height / 2)
end


function gui:mouseClick(x, y, button)
	if general:aabb(self.ruota.x + self.ruota.width / 2.25, self.ruota.y + self.ruota.height / 2.25, self.ruota.width*self.ruota.scale, self.ruota.height*self.ruota.scale, mouse.x, mouse.y, 1, 1) then 				--⚙️
		if not self.ruota.bool then
			self.ruota.bool = true
			gui:load_volume() 								--🔊
		elseif self.ruota.bool then
			self.ruota.bool = false
		end
	end
end


function LOAD_GUI()
	gui:load()
end

function UPDATE_GUI(dt)
	gui:update(dt)
	if love.audio.getVolume() > 5 then
		ACHIEVEMENT("I LOVE THIS FUCKING SONG",
[[alza il volume
 ben oltre lo schermo]],6)
	end
end

function DRAW_GUI()																		--✏️
	love.graphics.setColor(1,1,1)															--🎨
		gui:draw()
	if gui.ruota.bool then 														--⚙️
		gui:draw_volume() 														--🔊
	end
	if wall ~= nil then
		for line, text in ipairs(wall) do
			love.graphics.setColor(1,1,1,1)
			love.graphics.print(text, 0, 40*line)
		end
	end
end