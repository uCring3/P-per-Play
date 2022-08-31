room = {}


function room:load()
	self:loadAssets()
end


function room:loadAssets()
	self.background = love.graphics.newImage("assets/background.png")
end


function room:update(dt)
end


function room:draw()
	love.graphics.setColor(love.math.colorFromBytes(240,240,240,185))
		--Background
	love.graphics.draw(self.background, 0, 0, 0, 4, 4)
end


function LOAD_ROOM()
	room:load()
end


function UPDATE_ROOM(dt)
	room:update(dt)
end 


function DRAW_ROOM()
	room:draw()
end

