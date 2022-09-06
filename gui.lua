gui = {}


function gui:load()
	self:loadDeck()
	self.newCardY = - 500

	--turno
	turno = {}
	turno.n = 1
	turno.x = room.cambia_turno.x+60
	turno.y = room.cambia_turno.y
	turno.r = 0
	if connesso then
		turno.r = turno.r -3.14
	end
	turno.font       = love.graphics.getFont()
	turno.text ="Tu r n o  "..turno.n
	turno.textWidth  = turno.font:getWidth(turno.text) - 80
	turno.textHeight = turno.font:getHeight()

	turno.X = turno.x
	if connesso then
		turno.X = turno.x + turno.textWidth
	end
	turno.Y = turno.y
	if connesso then
		turno.Y = turno.y + turno.textHeight
	end
end


function gui:loadDeck()
	self.deck = {img = love.graphics.newImage("assets/cardbacks/"..math.random(1,4)..".png")}
	self.deck.width = self.deck.img:getWidth()
	self.deck.height = self.deck.img:getHeight()
	self.deck.x = screen.width - self.deck.width
	self.deck.y = screen.height - self.deck.height * 1.1
	self.deck.scale = 0.75
	self.deck.defaultScale = 0.75
end


function gui:update(dt)
end

function gui:draw()																			--✏️
	self:drawDeck()
	DRAW_CARDS2()
	DRAW_CARDS()
	DRAW_ABILITA()
	self:drawNewCard()
	self:drawTurno()
end

function gui:drawTurno()																	--✏️
--turni
	love.graphics.print("Tu r n o  "..turno.n, turno.X, turno.Y, turno.r, 1/2, 1/2)
end

function gui:drawDeck()																		--✏️
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))						--🎨
	love.graphics.draw(self.deck.img, self.deck.x + self.deck.width / 2, self.deck.y + self.deck.height / 2, 0, self.deck.scale, self.deck.scale, self.deck.width / 2, self.deck.height / 2)
end

function gui:drawNewCard()																	--✏️
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))						--🎨
	love.graphics.setFont(Font.combatTextFont)
	love.graphics.print("NEW CARD", screen.width / 2 - 150, self.newCardY - 260)
	love.graphics.draw(inventario.card[inventario.card.max], screen.width / 2, self.newCardY, 0, 2, 2, self.deck.width / 2, self.deck.height / 2)
	love.graphics.print("PRESS  i", screen.width / 2 - 150, self.newCardY + 260)
end

function gui:activateNewCard()
	self.newCardY = -100
	flux.to(self, 12, {newCardY = screen.height * 2})
end


function LOAD_GUI()
	gui:load()
end

function UPDATE_GUI(dt)
	gui:update(dt)
	--gui:updateIntro(dt)
end

function DRAW_GUI()																			--✏️
	--if introStage == 0 then
		gui:draw()
	--end
end