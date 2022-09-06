Cursor = {}


function Cursor:load()
	self.arrow = love.mouse.getSystemCursor("arrow")

	self.TelecinesiLibero = love.mouse.newCursor("cursors/TelecinesiLibero.png", 0, 0)
	self.TelecinesiPreso = love.mouse.newCursor("cursors/TelecinesiPreso.png", 0, 0)
	self.Bread = love.mouse.newCursor("cursors/Bread.png", 0, 0)
	self.Potenziare = love.mouse.newCursor("cursors/Potenziare.png", 0, 0)
	self.DePotenziare = love.mouse.newCursor("cursors/Potenziare.png", 0, 0)
	self.Evocare = love.mouse.newCursor("cursors/Evocare.png", 0, 0)
	self.INGEGNERE_DEI_MEMES = love.mouse.newCursor("cursors/INGEGNERE_DEI_MEMES.png", 0, 0)
	self.Explosion = love.mouse.newCursor("cursors/Explosion.png", 0, 0)
	self.Stella = love.mouse.newCursor("cursors/Stella.png", 0, 0)
	self.Cuore = love.mouse.newCursor("cursors/Cuore.png", 0, 0)
	self.Aculeo = love.mouse.newCursor("cursors/Aculeo.png", 0, 0)
	self.Laser = love.mouse.newCursor("cursors/Laser.png", 0, 0)
	self.Urlo = love.mouse.newCursor("cursors/Urlo.png", 0, 0)
	self.Smith = love.mouse.newCursor("cursors/Smith.png", 0, 0)
end


function LOAD_CURSOR()
	Cursor:load()
end