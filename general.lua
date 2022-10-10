general = {}
danno = 0
antidanno = 0
piuATK = 0
local Danno = {}
local exit = {}

local function SHOW_DANNO(attaccato)
	table.insert(Danno, {bool = true, val = danno, x = attaccato.x+attaccato.width/4, y = attaccato.y+attaccato.height/4})
	for d,dan in ipairs(Danno) do
		if not (COMMISSIONE_NON_PAGATA or OSU) then
			Timer.after(1, function() --⏱️
				Danno[d].bool = false
			end)
		end
	end
end


function general:load() --💾
		--Dimensioni Finestra Desktop (fullscreen)
	window = {width,height} --🖼️
	window.width,window.height = love.window.getMode()
	time = love.timer.getTime()
	love.graphics.setBackgroundColor(0,0,0) --🎨
	ora_esatta = (os.date('*t'))

	mouse = {x,y,pressed,released}						--[🖱️
	mouse.pressed = {sx={x,y},dx={x,y},rot={x,y}} --per salvare una posizione del muose quando cliccato o lasciato
	mouse.released = {sx={x,y},dx={x,y},rot={x,y}}		--🖱️]

		--✖
	exit.img = love.graphics.newImage("assets/Window_Bar/EXIT.png")
	exit.imgOFF = love.graphics.newQuad( 0, 0, 50, 50, exit.img)
	exit.imgON = love.graphics.newQuad( 0, 50, 50, 50, exit.img)
	exit.width = exit.img:getWidth()
	exit.height = exit.img:getHeight()/2
	exit.scale = 0.5
	exit.x = window.width-(exit.width*exit.scale)
	exit.y = 0
end

function general:update(dt) --🔁
	mouse.x, mouse.y = love.mouse.getPosition() --🖱️
		--danno
	for d,dan in ipairs(Danno) do
		dan.y = 0.999*dan.y-dt
	end
	general:morte()
		--✖
	if general:aabb(window.width-(exit.width*exit.scale), 0, exit.width*exit.scale, exit.height*exit.scale, mouse.x, mouse.y, 1, 1) then
		exit.bool = true
	else
		exit.bool = false
	end
end

function general:draw() --✏️
	for d,dan in ipairs(Danno) do
		if dan.bool and dan.val ~= 0 then
			love.graphics.setColor(love.math.colorFromBytes(dan.val/4.5,465000/dan.val,5))
			love.graphics.print(dan.val, dan.x, dan.y,0,0.4+dan.val*0.00005,0.4+dan.val*0.00005)
		end
	end
	love.graphics.setColor(love.math.colorFromBytes(32,34,27)) --🎨 --[✖
	love.graphics.rectangle("fill",0,0,window.width,(exit.height*exit.scale))
	love.graphics.setColor(1,1,1) --🎨
	if exit.bool then
		love.graphics.draw(exit.img, exit.imgON, exit.x, exit.y, 0, exit.scale, exit.scale)
	else
		love.graphics.draw(exit.img, exit.imgOFF, exit.x, exit.y, 0, exit.scale, exit.scale)
	end --✖]
	for d,dan in ipairs(Danno) do
		if dan.bool and dan.val ~= 0 then
			love.graphics.setColor(love.math.colorFromBytes(dan.val/4.5,465000/dan.val,5))
			love.graphics.print(dan.val, dan.x, dan.y,0,0.4+dan.val*0.00005,0.4+dan.val*0.00005)
		end
	end
	if ToolBox then --🧰
		love.graphics.setFont(font.extraFont)
		love.graphics.setColor(1,1,1,1) --🎨
		local drawStartTime = love.timer.getTime()

		love.graphics.print("giocatore: "..giocatore, 10, 90)
		love.graphics.print("mouse x,y: "..mouse.x..","..mouse.y, 10, 110) --🖱️
		love.graphics.print("danno: "..danno, 10, 130)

		for c, card in ipairs(inCampoCards) do --[🃏
			if card.puoattaccare then
				love.graphics.print("puo attaccare", (card.x), card.y)
			else
				love.graphics.print("NON puo attaccare", (card.x), card.y)
			end
			if card.puoabilita then
				love.graphics.print("puo abilita", (card.x), card.y+30)
			else
				love.graphics.print("NON puo abilita", (card.x), card.y+30)
			end
			if card.abilita then
				love.graphics.print("abilita", (card.x), card.y+60)
			else
				love.graphics.print("NON abilita", (card.x), card.y+60)
			end
			if card.stordita then
				love.graphics.print("stordita", (card.x), card.y+90)
			else
				love.graphics.print("NON stordita", (card.x), card.y+90)
			end
		end
	
		for c,card in ipairs(inCampoCards) do
			love.graphics.print("sul campo: ", 10, 340)
			love.graphics.print(card.id, 70+(30*c), 340)
		end
		for c2,card2 in ipairs(inCampoCards2) do
			love.graphics.print("altro campo: ", 8, 370)
			love.graphics.print(card2.id, 70+(30*c2), 370)
		end
		for c,card in ipairs(cards.deck.mazzo) do
			love.graphics.print("inventario: ", (10), 400)
			if gamestate.current() == inGamE then
				love.graphics.print(card, 70+(30*c), 400)
			else
				love.graphics.print(card.id, 70+(30*c), 400)
			end
		end --🃏]

		if gamestate.current() == inGamE then
			for u,camp in ipairs(campi) do
				for c,campo in ipairs(camp) do
					if campo.puohotcampo then
						love.graphics.print("puoHotCampo", campo.x, campo.y+campo.height)
					else
						love.graphics.print("NON puoHotCampo", campo.x, campo.y+campo.height)
					end
				end
			end
		end

		local dati_vari = string.format(
	        "Memory: %.2f MB\nDraw time: %.1f ms\nIs busy: %s",
	        collectgarbage"count" / 1024,
	        (love.timer.getTime()-drawStartTime) * 1000,
	        tostring(field:isBusy()))
	    love.graphics.print(dati_vari, 0, window.height-4*font.extraFont:getHeight())
	end
end

function general:keypressed(key, scancode, isRepeat) --⌨️
	if ToolBox then --🧰
		if key == "1" then --f1 per cambiare turno
			if hoster then
				abilita:cambiaTurno()
				server:sendToAll("cambia_turno_1-2", true)
			elseif connesso then
				abilita:cambiaTurno()
				client:send("cambia_turno_2-1", true)
			end
		elseif key == "2" then --f2 per eliminare i nemici
			inCampoCards2 = {}
			general:ScambioDatiCarte()
		elseif key == "3" then --f3 per OP carte sul terreno
			for c,card in ipairs(inCampoCards) do
				card.ATK = 69420
				--card.hp = 69420
				card.HP = 69420
			end
			general:ScambioDatiCartePropria()
		elseif key == "4" then --f4 per +10 Mana
			player.Mana = player.Mana + 10
		end
	end
end

function general:mousepressed(x, y, button) --🖱️
	if general:aabb(exit.x,exit.y,exit.width*exit.scale,exit.height*exit.scale,mouse.x,mouse.y,1,1) then
		if button == 3 then
			achievement:sblocca("Tasto sbagliato","non puoi chiudere il gioco\n con la rotellina del mouse",1)
		else
			love.event.quit()
		end
	end
end

function general:drawDanno() --✏️

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
end

function general:cura(curato)
	for c,card in ipairs(inCampoCards) do 
		if card.id == 46 then	 -- Summer
			card.abilita = false
		elseif card.id == 48 then -- Bread
			antidanno = curato.HP*30/100
			card.abilita = false
			card.morta = true
		end
	end

	curato.HP = curato.HP + antidanno
	antidanno = 0
	
	general:ScambioDatiCarte()
end

function general:danno(attaccato,attaccante)
	if attaccante == nil then
		attaccante = nessuno
	end
	if attaccato ~= player2 then --se non attacca l'avversario
		if attaccato.immune then
			attaccato.immune = false
		else
			if attaccato.id == 38 then 			--Raiden
				RaidenRandom1 = love.math.random(1, 25) 			--per contrattaccare
				RaidenRandom2 = love.math.random(1, 15)				--per parare
				if RaidenRandom1 == 1 then				 	--per contrattaccare
					attaccante.HP = attaccante.HP - danno
					SHOW_DANNO(attaccato)
					general:ScambioDatiCartePropria()
				end
				if RaidenRandom2 ~= 1 then					--per parare
					if attaccante.id == 45 then 	--B per Basato
						BasatoRandom = love.math.random(1, 10)		--per critico Basato
						if BasatoRandom == 1 then
							attaccato.HP = attaccato.HP - danno*10
							SHOW_DANNO(attaccato)
						else
							attaccato.HP = attaccato.HP - danno
							SHOW_DANNO(attaccato)
						end
					else
						AltriRandom = love.math.random(1, 25) 		--per critico normale
						if AltriRandom == 1 then
							attaccato.HP = attaccato.HP - danno*10
							SHOW_DANNO(attaccato)
						else
							attaccato.HP = attaccato.HP - danno
							SHOW_DANNO(attaccato)
						end
					end
				end
			else 	--se l'attaccato non è raiden
				if attaccante.id == 45 then 		--B per Basato
					BasatoRandom = love.math.random(1, 10)			--per critico Basato
					if BasatoRandom == 1 then
						attaccato.HP = attaccato.HP - danno*10
						SHOW_DANNO(attaccato)
					else
						attaccato.HP = attaccato.HP - danno
						SHOW_DANNO(attaccato)
					end
				else
					AltriRandom = love.math.random(1, 25) 			--per critico normale
					if AltriRandom == 1 then
						attaccato.HP = attaccato.HP - danno*10
						SHOW_DANNO(attaccato)
					else
						attaccato.HP = attaccato.HP - danno
						SHOW_DANNO(attaccato)
					end
				end
			end
		end
	elseif attaccato == player2 then --se attacca l'avversario
		attaccato.HP = attaccato.HP - danno
		SHOW_DANNO(attaccato)
	end

	if attaccato.HP <= 0 then
		attaccato.morta = true --muorte
	end

	if not (COMMISSIONE_NON_PAGATA or OSU) then --il danno non si azzera se questi poteri sono attivi
		danno = 0
	end

	general:ScambioDatiCarte()
	general:scambioDatiPlayers()
end

function general:aumentaATK(aumentato)
	aumentato.ATK = aumentato.ATK + piuATK
	piuATK = 0
	general:ScambioDatiCarte()
end


function general:togliEffeto()
	if love.math.random(1,6) == 1 then
		return true
	else
		return false
	end
	general:ScambioDatiCarte()
end

function general:morte()
	for c,card in ipairs(inCampoCards) do
		if card.morta then 		--se una carta è morta...
				--campo agibile per altre carte
			for u,camp in ipairs(campi) do
    			for i,campo in ipairs(camp) do
    				if general:aabb(campo.x, campo.y, campo.width, campo.height, card.x+card.width/2, card.y+card.height/2, 1, 1) then
						campo.puohotcampo = true
					end
				end
			end

			if card.id == 5 then -- Trill
				card.abilita = false
			end
				--sposta carta nel cimitero dopo 0.5 sec
			Timer.after(0.5, function() --⏱️
				card.x = cimitero.x
				card.y = cimitero.y
			end)

			if card.id == 1 then -- Sciagghi
	  			table.remove(PEPONE.PE, 1)
			elseif card.id == 2 then -- Lucy
	  			table.remove(PEPONE.PO, 1)
			elseif card.id == 3 then -- VOID
	  			table.remove(PEPONE.NE, 1)
    		end
		
    		table.insert(CimiteroCards, card)
			--table.remove(inCampoCards, c)
    	end
	end

	for c2,card2 in ipairs(inCampoCards2) do
		if card2.morta then
			card2.x = cimitero.x
			card2.y = cimitero.y
			table.insert(CimiteroCards, card2)
			table.remove(inCampoCards2, c2)
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

function general:union(a, b)
    local result = {}
    for k,v in pairs(a) do
        table.insert( result, v )
    end
    for k,v in pairs(b) do
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
	if ax < bx + bw and
	 ax + aw > bx and
	  ay < by + bh and
	   by < ay + ah then
		return true --se b è dentro a
	else
		return false 
	end
end

function general:ScambioDatiCarte()
	if not TELECINESI then
		if hoster then
			server:sendToAll("inCampoCard2_1-2", bitser.dumps(inCampoCards2)) 
		elseif connesso then
			client:send("inCampoCard2_2-1", bitser.dumps(inCampoCards2))
		end
	end
end

function general:ScambioDatiCartePropria()
	if not TELECINESI then
    if hoster then
		server:sendToAll("inCampoCard_1-2", bitser.dumps(inCampoCards)) 
  	elseif connesso then
    	client:send("inCampoCard_2-1", bitser.dumps(inCampoCards))
    end
  end
end

function general:scambioDatiPlayers()
    if hoster then
		server:sendToAll("playerHP2_1-2", player2.HP)
  	elseif connesso then
    	client:send("playerHP2_2-1", player2.HP)
    end
end

function general:scambioDatiPlayersPropri()
    if hoster then
		server:sendToAll("playerHP_1-2", player.HP)
  	elseif connesso then
    	client:send("playerHP_2-1", player.HP)
    end
end

function general:scambioNomiPlayers()
	if hoster then
		server:sendToAll("player_name_1-2", testo[1])
  	elseif connesso then
    	client:send("player_name_2-1", testo[2])
    end
    general:scambioDatiPlayers()
end