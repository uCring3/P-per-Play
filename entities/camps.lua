--Name = Entity
--activeTables = activeEntities
--thing = entity
--PARENT = UPDATE_PARENT(dt)


io.stdout:setvbuf("no")

campo = Entity:extend()

function campo:load()
    campo_img = love.graphics.newImage("assets/inGame/campo.png")
    campo_Width = campo_img:getWidth()
    campo_Height = campo_img:getHeight()
end


function campo:new(x, y)
    campo.super.new(self, x, y, "assets/inGame/campo.png")
end