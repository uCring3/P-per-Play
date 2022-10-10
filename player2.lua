player2 = {}
local HAI_VINTO = love.graphics.newImage("assets/HAI_PERSO-VINTO/HAI_VINTO"..love.math.random(1,4)..".png")
local dead2

function player2:load() --💾
	player2.width = playerimg:getWidth()
	player2.height = playerimg:getHeight()
	player2.x = (window.width)/2 + 450
	player2.y = ((window.height/2)-100) - 100
	player2.attaccata = false

	player2.previousCard = 18
	player2.aiming = false
	player2.nextCardFree = false

	player2.maxHP = 200000
	player2.HP = player2.maxHP
	
	player2.scale = 2
	
end

function player2:update(dt) --🔁
	if (player2.HP <= 0) and not ((connesso and testo[1] == "ping") or (hoster and testo[2] == "ping")) then
		dead2 = true 
	end
end

function player2:draw() --✏️
	love.graphics.draw(playerimg,player2.x,player2.y)
	love.graphics.setColor(1,1,1,1) --🎨
	love.graphics.setFont(font.RamonaBold)
	if hoster then
		love.graphics.print(testo[2],player2.x,player2.y-37, 0, 0.5, 0.5)
	elseif connesso then
		love.graphics.print(testo[1],player2.x,player2.y-37, 0, 0.5, 0.5)
	end
	love.graphics.print(player2.HP ..  " / "  .. player2.maxHP,player2.x,player2.y+25, 0, 0.3, 0.3)
	love.graphics.setColor(love.math.colorFromBytes(150/(player2.HP/player2.maxHP),155*(3*player2.HP/player2.maxHP),5))
	love.graphics.rectangle("fill",player2.x , player2.y,player2.width*player2.HP/player2.maxHP,player2.height)

	if dead2 then
		love.graphics.setColor(1,1,1)
		love.graphics.draw(HAI_VINTO, 0, -30,0, window.width/(HAI_VINTO:getWidth()),1.03*window.height/(HAI_VINTO:getHeight()))
	end
end