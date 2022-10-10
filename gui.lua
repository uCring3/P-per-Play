gui = {}

function gui:load() --💾
	gui.newCardY = - 520 -- è questo che fa l'y della mano??

	--turno
	turno = {}
	turno.n = 1
	turno.x = stanza.cambia_turno.x+70
	turno.y = stanza.cambia_turno.y
	turno.r = 0
	if connesso then
		turno.r = turno.r -3.14
	end
	if connesso then
		turno.x = turno.x + 140
		turno.y = turno.y + 37
	end

		--quadro impostazioni
	gui.deck = {img = love.graphics.newImage("assets/settings/impostazioni.png")}
	gui.deck.width = gui.deck.img:getWidth()
	gui.deck.height = gui.deck.img:getHeight()
	gui.deck.x = window.width - gui.deck.width
	gui.deck.y = window.height - gui.deck.height * 1.1
	gui.deck.scale = 0.75
	gui.deck.defaultScale = 0.75
		--rotellina
	gui.ruota = {img = love.graphics.newImage("assets/settings/ruota_dentata.png")}
	gui.ruota.width = gui.ruota.img:getWidth()
	gui.ruota.height = gui.ruota.img:getHeight()
	gui.ruota.x = gui.deck.x - gui.deck.width*1.6
	gui.ruota.y = gui.deck.y - gui.deck.height
	gui.ruota.r = 0
	gui.ruota.scale = 0.15
	gui.ruota.defaultScale = 0.15
	gui.ruota.bool = false

	gui.volume = {img = love.graphics.newImage("assets/settings/volume.png")} --[🔊
	gui.volume.width = gui.volume.img:getWidth()
	gui.volume.height = gui.volume.img:getHeight()
	gui.volume.x = gui.deck.x + 10
	gui.volume.y = gui.deck.y
	gui.volume.r = 0
	gui.volume.scalex = 0.20
	gui.volume.scaley = 0.30

	gui.rectangle = {}
	gui.rectangle.x = gui.volume.x
	gui.rectangle.y = gui.volume.y
	gui.rectangle.width = gui.volume.width*gui.volume.scalex
	gui.rectangle.height = gui.volume.height*gui.volume.scaley --🔊]
end


function gui:update(dt) --🔁 --⚙️
	if gui.ruota.bool and gui.ruota.r <= math.pi then
		gui.ruota.r = gui.ruota.r +1*dt
	elseif not gui.ruota.bool and gui.ruota.r <= math.pi*2 and gui.ruota.r >= math.pi then
		gui.ruota.r = gui.ruota.r +1*dt
		if gui.ruota.r >= math.pi*2 then
			gui.ruota.r = 0
		end
	end
end

function gui:draw() --✏️
	love.graphics.draw(gui.deck.img, gui.deck.x + gui.deck.width / 2, gui.deck.y + gui.deck.height / 2, 0, gui.deck.scale, gui.deck.scale, gui.deck.width / 2, gui.deck.height / 2)
	love.graphics.draw(gui.ruota.img, gui.ruota.x + gui.ruota.width / 2, gui.ruota.y + gui.ruota.height / 2, gui.ruota.r, gui.ruota.scale, gui.ruota.scale, gui.ruota.width / 2, gui.ruota.height / 2)
	love.graphics.setFont(font.cardName)
		--turni
	love.graphics.setColor(1,1,1) --🎨
	love.graphics.print("Turno "..turno.n, turno.x, turno.y, turno.r, 1/2, 1/2)
	if gui.ruota.bool then
		love.graphics.draw(gui.volume.img, gui.volume.x, gui.volume.y, gui.volume.r, gui.volume.scalex, gui.volume.scaley)
		love.graphics.setColor(0.5,1,1) --🎨
		love.graphics.rectangle("fill", gui.rectangle.x, gui.rectangle.y, gui.rectangle.width, gui.rectangle.height)
	end
end

function gui:mousepressed(x, y, button) --🖱️
	if general:aabb(gui.ruota.x + gui.ruota.width / 2.25, gui.ruota.y + gui.ruota.height / 2.25, gui.ruota.width*gui.ruota.scale, gui.ruota.height*gui.ruota.scale, mouse.x, mouse.y, 1, 1) then 				--⚙️
		if not gui.ruota.bool then
			gui.ruota.bool = true
		elseif gui.ruota.bool then
			gui.ruota.bool = false
		end
	end
end

function gui:mousemoved(x, y, dx, dy) --🖱️
	if general:aabb(gui.volume.x, gui.volume.y, gui.volume.width, gui.volume.height, mouse.x, mouse.y, 1, 1)
	 and (love.mouse.isDown(1) or love.mouse.isDown(2) or love.mouse.isDown(3)) then 								--⚙️
		if gui.rectangle.width >= 0 then
			gui.rectangle.width = gui.rectangle.width + dx
			love.audio.setVolume(gui.rectangle.width/100)
		else
			gui.rectangle.width = 0 
		end
	end
end