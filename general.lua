general = {}
danno = 0
antidanno = 0
piuATK = 0

function general:load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	screen = {width = window.width, height = window.height}
	time = love.timer.getTime()
	love.graphics.setBackgroundColor(0,0,0)																	--🎨
	mouse = {x = 0, y = 0}
	self.shadow = 80

	world = love.physics.newWorld(0, 0, true)
	love.physics.setMeter(64)
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	ora_esatta = (os.date('*t'))

	mouse = {x,y,pressed,released}			--[🖱️
	mouse.pressed = {sx,dx,rot}							--per salvare una posizione del muose quando cliccato o lasciato
	mouse.pressed.sx = {x,y}
	mouse.pressed.dx = {x,y}
	mouse.pressed.rot = {x,y}
	mouse.released = {sx,dx,rot}
	mouse.released.sx = {x,y}
	mouse.released.dx = {x,y}
	mouse.released.rot = {x,y}						--🖱️]
end

function general:fineBattaglia()
	for c,card in ipairs(inCampoCards) do
		if card.attacco then
			if card.id == 11 and not COMMISSIONE_NON_PAGATA then	--Aria
				card.attacco = false
				card.puoattaccare = false
			end
		end
	end
	for c,card in ipairs(inCampoCards) do
		if card.attaccata then
			card.attaccata = false
		end
	end
end

function general:cura(curato)
	curato.HP = curato.HP + antidanno
	if curato.HP >= curato.hp then
		curato.HP = curato.hp
	end
	antidanno = 0
	for c,card in ipairs(inCampoCards) do 
		if card.id == 4 then	 -- Hardcore Jack
			card.abilita = false
		end
	end
	general:scambio_dati_carta()
end

function general:danno(attaccato,attaccante)
	if attaccato.immune then
		attaccato.immune = false
	else
		if attaccato.id == 38 then 			--Raiden
			RaidenRandom1 = love.math.random(1, 25) 			--per contrattaccare
			RaidenRandom2 = love.math.random(1, 15)				--per parare
			if RaidenRandom1 == 1 then				 	--per contrattaccare
				attaccante.HP = attaccante.HP - danno
				general:scambio_dati_carta_propria()
			end
			if RaidenRandom2 ~= 1 then					--per parare
				if attaccante.id == 45 then 	--B per Basato
					BasatoRandom = love.math.random(1, 10)		--per critico Basato
					if BasatoRandom == 1 then
						attaccato.HP = attaccato.HP - danno*10
					else
						attaccato.HP = attaccato.HP - danno
					end
				else
					AltriRandom = love.math.random(1, 25) 		--per critico normale
					if AltriRandom == 1 then
						attaccato.HP = attaccato.HP - danno*10
					else
						attaccato.HP = attaccato.HP - danno
					end
				end
			end
		else 	--se l'attaccato non è raiden
			if attaccante.id == 45 then 		--B per Basato
				BasatoRandom = love.math.random(1, 10)			--per critico Basato
				if BasatoRandom == 1 then
					attaccato.HP = attaccato.HP - danno*10
				else
					attaccato.HP = attaccato.HP - danno
				end
			else
				AltriRandom = love.math.random(1, 25) 			--per critico normale
				if AltriRandom == 1 then
					attaccato.HP = attaccato.HP - danno*10
				else
					attaccato.HP = attaccato.HP - danno
				end
			end
		end
	end

	if attaccato.HP <= 0 then
		attaccato.morta = true
	end

	if not (COMMISSIONE_NON_PAGATA or OSU) then
		danno = 0
  end

	for c,card in ipairs(inCampoCards) do
		if (card.id == 22) then -- Cosmi
			card.abilita = false
		end
	end

	general:scambio_dati_carta()
	general:scambio_dati_player()
end

function general:aumentaATK(aumentato)
	aumentato.ATK = aumentato.ATK + piuATK
	piuATK = 0
	general:scambio_dati_carta()
end


function general:togliEffeto()
	if love.math.random(1,6) == 1 then
		return true
	else
		return false
	end
	general:scambio_dati_carta()
end

	--cimitero?
function general:morte()
	for c,card in ipairs(inCampoCards) do
		if card.morta then
			for u,camp in ipairs(campi) do
    			for l,campo in ipairs(camp) do
    				if general:aabb(campo.x, campo.y, campo.width, campo.height, card.x+card.width/4, card.y+card.height/4, 1, 1) then
						campo.puohotcampo = true
					end
				end
			end
			card.x = cimitero.x
			card.y = cimitero.y
			card.posizionato = false

			if card.id == 1 then -- Sciagghi
	  			table.remove(PEPONE.PE, 1)
			elseif card.id == 2 then -- Lucy
	  			table.remove(PEPONE.PO, 1)
			elseif card.id == 3 then -- VOID
	  			table.remove(PEPONE.NE, 1)
    		end
		
    		table.insert(CimiteroCards, card)
			table.remove(inCampoCards, c)
    	end
	end

	for c2,card2 in ipairs(inCampoCards2) do
		if card2.morta then
			card2.x = cimitero.x
			card2.y = cimitero.y
			card2.posizionato = false
			table.insert(CimiteroCards, card2)
      table.remove(inCampoCards2, c2)
    end

    if card2.id == 5 then -- Trill
			card2.abilita = false
		end
	end
end

function general:calculateDistance(x1,y1,x2,y2)
	local dx = x1 - x2
  	local dy = y1 - y2
  	return math.sqrt ( (dx * dx) + (dy * dy) )
end


function general:calculateDistanceToLine(px,py,x1,y1,x2,y2)
  local dx,dy = x1-x2,y1-y2
  local length = math.sqrt(dx*dx+dy*dy)
  dx,dy = dx/length,dy/length
  return math.abs( dy*(px-x1) - dx*(py-y1))
end


function general:getAngle(x1, y1, x2, y2)
	local angle = math.atan2(y2 - y1, x2 - x1)
	return angle 
end


function general:drawRotatedTriangle(mode, x, y, width, height, angle)
	local cosa, sina = math.cos(angle), math.sin(angle)

	local dx1, dy1 = (width/2)*cosa,   (width/2)*sina
	local dx2, dy2 = -height*sina, height*cosa

	local px1, py1 = x+dx1,     y+dy1
	local px2, py2 = x-dx1,     y-dy1
	local px3, py3 = x+dx2,						y+dy2
	
	love.graphics.polygon(mode, px1,py1, px2,py2, px3,py3)
end


function general:greaterNumber(a, b)
	if a > b then
		return a 
	else
		return b
	end
end

function general:greaterNumber5(a, b, c, d, e)
	if (a >= b) and (a >= c) and (a >= d) and (a >= e) then
		return a 
	elseif (b > a) and (b >= c) and (b >= d) and (b >= e) then
		return b
	elseif (c > a) and (c > b) and (c >= d) and (c >= e) then
		return c
	elseif (d > a) and (d > b) and (d > c) and (d >= e) then
		return d
	elseif (e > a) and (e > b) and (e > c) and (e > d) then
		return e
	end
end

function general:smallerNumber(a, b)
	if a < b then
		return a 
	else
		return b
	end
end

function union ( a, b )
    local result = {}
    for k,v in pairs ( a ) do
        table.insert( result, v )
    end
    for k,v in pairs ( b ) do
         table.insert( result, v )
    end
    return result
end

function general:tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function general:aabb(ax, ay, aw, ah, bx, by, bw, bh)
	if ax < bx + bw and ax + aw > bx and ay < by + bh and by < ay + ah then
		return true --se b è dentro a
	else
		return false 
	end
end



function general:update(dt)
	ora_esatta = (os.date('*t'))
	self:getMousePosition()
end

function general:getMousePosition()
	mouse.x, mouse.y = love.mouse.getPosition()
end


function general:draw()
end 																							--🧰]

function LOAD_EXIT()
	EXIT_ONimg = love.graphics.newImage("assets/Window_Bar/EXIT_ON.png")
	EXIT_OFFimg = love.graphics.newImage("assets/Window_Bar/EXIT_OFF.png")
	EXIT_width = EXIT_ONimg:getWidth()
	EXIT_height = EXIT_ONimg:getHeight()
end

function DRAW_WINDOW_BAR()																							--✏️
	love.graphics.setColor(love.math.colorFromBytes(32,34,27))													--🎨
	love.graphics.rectangle("fill",0,0,window.width,30)
	love.graphics.setColor(1,1,1)															--🎨
	if on_EXIT then
		love.graphics.draw(EXIT_ONimg,window.width-25 , 5, 0, 25/EXIT_width, 25/EXIT_height)
	else
		love.graphics.draw(EXIT_OFFimg,window.width-25 , 5, 0, 25/EXIT_width, 25/EXIT_height)
	end
end


function general:scambio_dati_carta()
	if not TELECINESI then
		if hoster then
			server:sendToAll("inCampoCard2_1-2", bitser.dumps(inCampoCards2)) 
		elseif connesso then
			client:send("inCampoCard2_2-1", bitser.dumps(inCampoCards2))
		end
	end
end

function general:scambio_dati_carta_propria()
	if not TELECINESI then
    if hoster then
		server:sendToAll("inCampoCard_1-2", bitser.dumps(inCampoCards)) 
  	elseif connesso then
    	client:send("inCampoCard_2-1", bitser.dumps(inCampoCards))
    end
  end
end

function general:scambio_dati_player()
    if hoster then
		server:sendToAll("playerHP2_1-2", player2.HP)
  	elseif connesso then
    	client:send("playerHP2_2-1", player2.HP)
    end
end

function general:scambio_dati_player_propria()
    if hoster then
		server:sendToAll("playerHP_1-2", player.HP)
  	elseif connesso then
    	client:send("playerHP_2-1", player.HP)
    end
end


function LOAD_GENERAL()
	general:load()
	LOAD_EXIT()
end

function UPDATE_GENERAL(dt)
	general:update(dt)

	--tasto exit
	if general:aabb(window.width-25, 5, 25, 25, mouse.x, mouse.y, 1, 1) then
		on_EXIT = true
	else
		on_EXIT = false
	end	
end

function DRAW_GENERAL()					--✏️
	DRAW_WINDOW_BAR()
end