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
	attaccato.HP = attaccato.HP - danno
	if attaccato.HP <= 0 then
		attaccato.morta = true
	end

	if not (COMMISSIONE_NON_PAGATA or OSU) then
		danno = 0
  end

	--attaccante.puoattaccare = false
	for c,card in ipairs(inCampoCards) do
		if draw_area and (card.id == 3) then -- Cosmi
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

function general:stordisci(stordito)
	stordito.stato.STORDITO = true
	general:scambio_dati_carta()
	for c,card in ipairs(inCampoCards) do
		if draw_cono and (card.id == 7) then
			card.abilita = false
		end
	end
	general:scambio_dati_carta()
end

function general:avvelena(avvelenato)
	avvelenato.stato.AVVELENATO = true
	for c,card in ipairs(inCampoCards) do
		if draw_smith and (card.id == 8) then
			card.abilita = false
		end
	end
	general:scambio_dati_carta()
end

function general:togliEffeto()
	togliEffeto = {}
	togliEffeto.Max = 6
	togliEffeto.numero = love.math.random(1, togliEffeto.Max)
	if togliEffeto.numero == 1 then
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
			card.x = cimitero.x
			card.y = cimitero.y
			card.posizionato = false

			if card.id == 1 then -- Sciagghi
	  			table.remove(PEPONE.PE, 1)
			elseif card.id == 21 then -- Carly
	  			table.remove(PEPONE.PO, 1)
			elseif card.id == 22 then -- VOID
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

	--for c2,card2 in ipairs(activeCards2) do
	--	if card2.morta then
	--		card2.x = cimitero.x-card2.width/4
	--		card2.y = cimitero.y-card2.height/4
	--		card2.posizionato = false
	--	end
	--end
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

function general:cambiaTurno()
	for u,camp in ipairs(campi) do --spegnere i campi
		for i,campo in ipairs(camp) do
			if campo.hotcampo == true then
				campo.hotcampo = false
			end
		end
	end
		--cambio turno
		draw_area = false
		draw_cono = false
		draw_smith = false
		draw_stelle = false
		draw_laser = false
		draw_bean = false
		draw_aculei = false
		ferma_aculei = false
		curare = false
		potenziare = false
		ruba = false
		uccidere = false
		annullare = false
		OSU = false
		COMMISSIONE_NON_PAGATA = false
		attaccante = nessuno
		for c,card in ipairs(inCampoCards) do --cambio turno da stordito
			if card.stato.STORDITO then
				card.puoattaccare = false
				if giocatore == 1 then
					card.stato.STORDITO = false
				end
			else 
				card.puoattaccare = true
			end

			card.puoabilita = true

			if card.stato.AVVELENATO == true then
				danno = 100
				attaccante = nessuno
				general:danno(card,attaccante)
				if general:togliEffeto() then
					card.stato.AVVELENATO = false
				end
			end
		end
		if giocatore == 1 then
			giocatore = 2
			turno.X = turno.x + turno.textWidth
			turno.Y = turno.y + turno.textHeight
			turno.r = 3.14
			if connesso then
				turno.n = turno.n +1
			end
			danno = 0
		elseif giocatore == 2 then
			giocatore = 1
			turno.X = turno.x
			turno.Y = turno.y
			turno.r = 0
			if hoster then
				turno.n = turno.n +1
			end
			danno = 0
			SPAWN_CARD(screen.width / 2, screen.height - 90, numeroCarteInMano, true)
		end
		general:fineBattaglia()	
end

function general:update(dt)
	ora_esatta = (os.date('*t'))
	self:getMousePosition()
end

function general:getMousePosition()
	mouse.x, mouse.y = love.mouse.getPosition()
end


function general:draw(offset)									--ToolBox	--[🧰 	--✏️
	love.graphics.setFont(Font.extraFont)
	local drawStartTime = love.timer.getTime()

	love.graphics.print("giocatore: "..giocatore, 10+offset, 90+offset)
	love.graphics.print(gameState, 90+offset, 90+offset)
	love.graphics.print("mouse x,y: "..mouse.x..","..mouse.y, 10+offset, 110+offset)			--🖱️
	love.graphics.print("danno: "..danno, 10+offset, 130+offset)	

	if gameState == "inGame" or gameState == "inventario" then
		for c, card in ipairs(inCampoCards) do 													--[🃏
			if card.puoattaccare then
				love.graphics.print("puo attaccare", (card.x)+offset, card.y+offset)
			else
				love.graphics.print("NON puo attaccare", (card.x)+offset, card.y+offset)
			end
			if card.puoabilita then
				love.graphics.print("puo abilita", (card.x)+offset, card.y+30+offset)
			else
				love.graphics.print("NON puo abilita", (card.x)+offset, card.y+30+offset)
			end
			if card.abilita then
				love.graphics.print("abilita", (card.x)+offset, card.y+60+offset)
			else
				--love.graphics.setColor(love.math.colorFromBytes(200,10,10,255))
				love.graphics.print("NON abilita", (card.x)+offset, card.y+60+offset)
				--love.graphics.setColor(love.math.colorFromBytes(0,0,0,255))
			end
			if card.stato.STORDITO then
				love.graphics.print("stordito", (card.x)+offset, card.y+90+offset)
			else
				love.graphics.print("NON stordito", (card.x)+offset, card.y+90+offset)
			end
		end
	
		for c,card in ipairs(inCampoCards) do
			love.graphics.print("sul campo: ", (10)+offset, 340+offset)
			love.graphics.print(card.id, 70+(30*c)+offset, 340+offset)
		end
		for c2,card2 in ipairs(inCampoCards2) do
			love.graphics.print("altro campo: ", (8)+offset, 370+offset)
			love.graphics.print(card2.id, 70+(30*c2)+offset, 370+offset)
		end
		for i,inv in ipairs(inventario.deck) do
			love.graphics.print("inventario: ", (10)+offset, 400+offset)
			love.graphics.print(inventario.deck[i], 70+(30*i)+offset, 400+offset)
		end
		for c,cardc in ipairs(CimiteroCards) do
			love.graphics.print("cimitero: ", (10)+offset, 430+offset)
			love.graphics.print(cardc.id, 70+(30*c)+offset, 430+offset)
		end
	end 																						--🃏]

	if gameState == "inGame" then
		for p,pe in ipairs(PEPONE.PE) do
			if PEPONE.PE[p] == "PE" then
				love.graphics.print("PE", (10)+offset, 145+offset)
			else love.graphics.print("pe", (10)+offset, 145+offset)
			end
		end
		for p,po in ipairs(PEPONE.PO) do
			if PEPONE.PO[p] == "PO" then
				love.graphics.print("PO", (30)+offset, 145+offset)
			else love.graphics.print("po", (30)+offset, 145+offset)
			end
		end
		for p,ne in ipairs(PEPONE.NE) do
			if PEPONE.NE[p] == "NE" then
				love.graphics.print("NE", (50)+offset, 145+offset)
			else love.graphics.print("ne", (50)+offset, 145+offset)
			end
		end
		if PEPONE.bool then 
			love.graphics.print("PEPONE", (10)+offset, 155+offset)
		else 
			love.graphics.print("pepone", (10)+offset, 155+offset)
		end
	end

	local dati_vari = string.format(
        "Memory: %.2f MB\nDraw time: %.1f ms\nIs busy: %s",
        collectgarbage"count" / 1024,
        (love.timer.getTime()-drawStartTime) * 1000,
        tostring(field:isBusy())
    )
    love.graphics.print(dati_vari, 0, window.height-4*Font.extraFont:getHeight())
end 																							--🧰]

function LOAD_EXIT()
	EXIT_ONimg = love.graphics.newImage("assets/Window_Bar/EXIT_ON.png")
	EXIT_OFFimg = love.graphics.newImage("assets/Window_Bar/EXIT_OFF.png")
	EXIT_width = EXIT_ONimg:getWidth()
	EXIT_height = EXIT_ONimg:getHeight()
end

function DRAW_WINDOW_BAR()																							--✏️
	love.graphics.setColor(love.math.colorFromBytes(32,34,27,255))													--🎨
	love.graphics.rectangle("fill",0,0,window.width,30)
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))												--🎨
	if on_EXIT then
		love.graphics.draw(EXIT_ONimg,window.width-25 , 5, 0, 25/EXIT_width, 25/EXIT_height)
	else
		love.graphics.draw(EXIT_OFFimg,window.width-25 , 5, 0, 25/EXIT_width, 25/EXIT_height)
	end
end

function DRAW_VITTORIA_SCONFITTA()
	if dead then
		love.graphics.draw(HAI_PERSO, 0, -30)
	elseif dead2 then
		love.graphics.draw(HAI_VINTO, 0, -30)
	end
end


function general:scambio_dati_carta()
	if not Telecinesi then
    if hoster then
		server:sendToAll("inCampoCard2_1-2", bitser.dumps(inCampoCards2)) 
  	elseif connesso then
    	client:send("inCampoCard2_2-1", bitser.dumps(inCampoCards2))
    end
  end
end

function general:scambio_dati_carta_propria()
	if not Telecinesi then
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

function DRAW_GENERAL()																																		--✏️
	--love.graphics.setFont(Font.cardInfo)
	if ToolBox then 							--🧰
		love.graphics.setColor(0, 0, 0, .9)
		general:draw(1)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
		general:draw(0)
	end
	love.graphics.setFont(Font.menu)
end