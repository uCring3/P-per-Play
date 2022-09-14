Cursor = {}

function Cursor:load()
	self.arrow = love.mouse.getSystemCursor("arrow")

	self.TelecinesiLibero = love.mouse.newCursor("assets/cursors/TelecinesiLibero.png", 0, 0)
	self.TelecinesiPreso = love.mouse.newCursor("assets/cursors/TelecinesiPreso.png", 0, 0)
	self.Bread = love.mouse.newCursor("assets/cursors/Bread.png", 0, 0)
	self.Potenziare = love.mouse.newCursor("assets/cursors/Potenziare.png", 0, 0)
	self.DePotenziare = love.mouse.newCursor("assets/cursors/DePotenziare.png", 0, 0)
	self.Evocare = love.mouse.newCursor("assets/cursors/Evocare.png", 0, 0)
	self.INGEGNERE_DEI_MEMES = love.mouse.newCursor("assets/cursors/INGEGNERE_DEI_MEMES.png", 0, 0)
	self.Explosion = love.mouse.newCursor("assets/cursors/Explosion.png", 0, 0)
	self.Stella = love.mouse.newCursor("assets/cursors/Stella.png", 0, 0)
	self.Cuore = love.mouse.newCursor("assets/cursors/Cuore.png", 0, 0)
	self.Aculeo = love.mouse.newCursor("assets/cursors/Aculeo.png", 0, 0)
	self.Rubare = love.mouse.newCursor("assets/cursors/Rubare.png", 0, 0)
	self.Laser = love.mouse.newCursor("assets/cursors/Laser.png", 0, 0)
	self.Urlo = love.mouse.newCursor("assets/cursors/Urlo.png", 0, 0)
	self.Smith = love.mouse.newCursor("assets/cursors/Smith.png", 0, 0)
	self.Immunizzare = love.mouse.newCursor("assets/cursors/Immunizzare.png", 0, 0)
	self.Annulla = love.mouse.newCursor("assets/cursors/Annulla.png", 0, 0)
	self.Uccidere = love.mouse.newCursor("assets/cursors/Uccidere.png", 0, 0)
end


function LOAD_CURSOR()
	Cursor:load()
end