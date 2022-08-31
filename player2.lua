player2 = {}


function player2:load()
	self.img = love.graphics.newImage("assets/ehp/frame.png")
	self.width = self.img:getWidth()
	self.height = self.img:getHeight()
	self.x = (window.width)/2 + 450
	self.y = ((window.height/2)-100) - 100
	self.attacco = false	--inutile
	self.attaccata = false
	self.delgiocatore = 2

	self.previousCard = 18
	self.aiming = false
	self.nextCardFree = false

	self.maxHP = 10000
	self.HP = self.maxHP

	HAI_VINTO = love.graphics.newImage("assets/HAI_PERSO-VINTO/HAI_VINTO"..love.math.random(1,4)..".png")
	
	self.scale = 2
	
end


function player2:update(dt)
	if (player2.HP <= 0) and not ((connesso and Testo[1] == "ping") or (hoster and Testo[2] == "ping")) then
		dead2 = true 
	end
end

function player2:seleziona()
	if general:aabb(self.x, self.y, self.width, self.height, mouse.x, mouse.y, 1, 1) then
		if giocatore == 1 then
			general:danno(self)
			attaccante.puoattaccare = false
		end
	end
end


function player2:draw()
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
	love.graphics.draw(self.img,self.x,self.y)
	if hoster then
		love.graphics.print(Testo[2],self.x,self.y-35, 0, 0.5, 0.5)
	elseif connesso then
		love.graphics.print(Testo[1],self.x,self.y-35, 0, 0.5, 0.5)
	end
	love.graphics.print(self.HP ..  "I"  .. self.maxHP,self.x,self.y+25, 0, 0.3, 0.3)
	love.graphics.setColor(love.math.colorFromBytes(150/(self.HP/self.maxHP),155*(3*self.HP/self.maxHP),5,255))
	love.graphics.rectangle("fill",self.x , self.y,self.width*self.HP/self.maxHP,self.height)
end


function LOAD_PLAYER2()
	player2:load()
end

function UPDATE_PLAYER2(dt)
	player2:update(dt)
end