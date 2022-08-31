Cursor = {}


function Cursor:load()
	self.arrow = love.mouse.getSystemCursor("arrow")

	self.TelecinesiLibero = love.mouse.newCursor("cursors/TelecinesiLibero.png", 0, 0)
	self.TelecinesiPreso = love.mouse.newCursor("cursors/TelecinesiPreso.png", 0, 0)
	self.Bread = love.mouse.newCursor("cursors/Bread.png", 0, 0)
	self.Potenziare = love.mouse.newCursor("cursors/Potenziare.png", 0, 0)
	self.DePotenziare = love.mouse.newCursor("cursors/Potenziare.png", 0, 0)
	self.Evocare = love.mouse.newCursor("cursors/Evocare.png", 0, 0)
end


function LOAD_CURSOR()
	Cursor:load()
end