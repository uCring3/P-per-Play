Abilita = {}
Abilita.__index = Abilita

function Abilita:activeAbility()
	for c,card in ipairs(inCampoCards) do
		if card.puoabilita2 and giocatore == 1 and card.hoverposizionato and card.Mana <= player.Mana then
			if not card.abilita then
				if card.puoabilita then
					card.abilita = true
					player.Mana = player.Mana - card.Mana
					if card.id == 1 then -- Sciagghi
						piuATK = card.ATK/2
						potenziare = true
						love.mouse.setCursor(Cursor.Potenziare)
						card.puoabilita = false
					elseif card.id == 2 then -- Lucy
						switch = true
						card.puoabilita = false
					elseif card.id == 3 then -- VOID
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 4 then -- Hardcore Jack
						love.mouse.setCursor(Cursor.Bread)
						antidanno = card.ATK
						curare = true
						card.puoabilita = false
					elseif card.id == 5 then -- Trill
						uccidere = true
						card.puoabilita = false
					elseif card.id == 6 then -- Gin Fotonic
						LOAD_OSU()
						attaccante = card
						card.puoabilita = false
						tick.delay(function () card.abilita = false end , 6)
					elseif card.id == 7 then -- Shadow Grimm
						LOAD_CONO()
						cono.sxb = card.x
						cono.syb = card.y + card.height/4
						cono.dxb = card.x + card.width/2
						cono.dyb = card.y + card.height/4
						cono.cxb = card.x + card.height/8
						cono.cyb = card.y + card.height/4
						card.puoabilita = false
					elseif card.id == 8 then -- Ceo of Sex inc
						LOAD_SMITH()
						attaccante = card
						smith.x = card.x + card.width/4
						smith.y = card.y + card.height/4
						card.puoabilita = false
					elseif card.id == 9 then -- lolfun
						piuATK = card.ATK
						potenziare = true
						love.mouse.setCursor(Cursor.Potenziare)
						card.puoabilita = false
					elseif card.id == 10 then	-- Padanian Shitposter
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 11 then -- Aria
						card.attacco = true
						LOAD_COMMISSIONE_NON_PAGATA()
						attaccante = card
						for c,card in ipairs(inCampoCards) do
							if card.id == 11 then -- Aria
								card.puoabilita = false
							end
						end
					elseif card.id == 12 then -- Charlie Ebony
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 13 then -- Juj
					ruba = true
					card.puoabilita = false
					elseif card.id == 14 then -- Sakura
						LOAD_STELLE()
						attaccante = card
						tick.delay(function() card.abilita = false end, 10.5)
						card.puoabilita = false
					elseif card.id == 15 then -- Mostro di Firenze
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 16 then -- La Morte Oscura
						LOAD_LASER()
						attaccante = card
						card.puoabilita = false
					elseif card.id == 17 then -- Plytlas
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 18 then -- Inazuma sensei
						LOAD_TELECINESI()
						attaccante = card
						card.puoabilita = false
					elseif card.id == 19 then -- Alex
						LOAD_ACULEI()
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 20 then -- Doppialex
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 21 then -- Ping
						elimina_cloni()
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 22 then -- Cosmi
						love.mouse.setCursor(Cursor.Explosion)
						draw_area = true
						attaccante = card
						card.puoabilita = false
					elseif card.id == 23 then -- Cring3_Crimson
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 24 then -- Fat Chad Yoshi
						annullare = true
						card.puoabilita = false
					elseif card.id == 25 then -- Mortius
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 26 then -- Verelo
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 27 then -- Il sam
						cambia_classe_INGEGNERE_DEI_MEMES = true
						love.mouse.setCursor(Cursor.INGEGNERE_DEI_MEMES)
						card.puoabilita = false
					elseif card.id == 28 then -- Esagono
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 29 then -- Disegni e Fan Art
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 30 then -- BAN
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 31 then -- Demon Core
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 32 then -- #memes
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 33 then -- Made in Haven
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 34 then -- Moyai
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 35 then -- Kronk Drip
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 36 then -- Jenny
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 37 then -- Carly
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 38 then -- Raiden
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 39 then -- Edd
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 40 then -- Fizz
						LOAD_CUORI()
						tick.delay(function() card.abilita = false end, 10.5)
						card.puoabilita = false
					elseif card.id == 41 then -- Uomo Piccione
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 42 then -- Schrödinger
						-- Ha una Abilità in Abilita:activeAbilitySummon(card)
						player.Mana = player.Mana + card.Mana
						card.abilita = false
						card.puoabilita = false
					elseif card.id == 43 then -- Doom Slayer
						card.HP = card.HP + 500
						card.abilita = false
						card.puoabilita = false
					end
				end
			else	 
				card.abilita = false
				card.puoabilita = true
				player.Mana = player.Mana + card.Mana
			end
		end
	end
end

function Abilita:activeAbilitySummon(card)
	if card.id == 100 then	-- Pepone
		tick.delay(function() 
			player2.HP = 0
			general:scambio_dati_player()
		end, 3)
	elseif card.id == 1 then -- Sciagghi
	  	table.insert(PEPONE.PE, "PE")
	elseif card.id == 2 then -- Lucy
	  	table.insert(PEPONE.PO, "PO")
	elseif card.id == 3 then -- VOID
	  	table.insert(PEPONE.NE, "NE")
	elseif card.id == 10 then	-- Padanian Shitposter
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			LOAD_DIMEZZA_HP()
		end
	elseif card.id == 12 then -- Charlie Ebony
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			LOAD_RADDOPPIA_HP()
		end
	elseif card.id == 15 then	-- Mostro di Firenze
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			LOAD_KYS()
		end
	elseif card.id == 17 then	--Plytlas
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			LOAD_PLYTLAS()
		end
	elseif card.id == 23 then	--Cring3_Crimson
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			if hoster then
            	general:cambiaTurno()
            	server:sendToAll("cambia_turno_1-2", true)
        	elseif connesso then
         	   general:cambiaTurno()
        	   client:send("cambia_turno_2-1", true)
        	end
        	tick.delay(function() 
        	if hoster then
            	general:cambiaTurno()
            	server:sendToAll("cambia_turno_1-2", true)
        	elseif connesso then
         	   general:cambiaTurno()
        	   client:send("cambia_turno_2-1", true)
        	end
        	 end, .5)

		end
	elseif card.id == 25 then -- Mortius
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			card.abilita = true
			evocare = true
			love.mouse.setCursor(Cursor.Evocare)
		end
	elseif card.id == 26 then -- Verel
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			LOAD_CHIUDI()
		end
		for c,card1 in ipairs(inCampoCards) do
			if card1.id == 42 then
				card1.ATK = card1.ATK + 500
				card1.HP = card1.HP + 300
			end
		end
	elseif card.id == 28 then -- Esagono
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			for c,card1 in ipairs(inCampoCards) do
				card1.Mana = card.Mana-1
			end
		end
	elseif card.id == 29 then -- Disegni e Fan Art
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			for c,card1 in ipairs(inCampoCards) do 
				if card1.INFO.classe == "ARTISTA" then
					card1.ATK = card1.ATK + 800
					card1.HP = card1.HP + 800
				end
			end
		else player.Mana = player.Mana+1
		end
		card.morta = true
	elseif card.id == 30 then -- BAN
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			card.abilita = true
			uccidere = true
		else player.Mana = player.Mana+1
		end
	elseif card.id == 31 then -- Demon Core
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			LOAD_KYS_ALL()
		else player.Mana = player.Mana+1
		end
		card.morta = true
	elseif card.id == 32 then -- #memes
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			for c,card1 in ipairs(inCampoCards) do 
				if card1.INFO.classe == "INGEGNERE DEI MEMES" then
					card1.ATK = card1.ATK + 800
					card1.HP = card1.HP + 800
				end
			end
		else player.Mana = player.Mana+1
		end
		card.morta = true
	elseif card.id == 33 then -- Made in Heaven
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			LOAD_MADE_IN_HEAVEN()
			if hoster then
				server:sendToAll("MADE_IN_HAEVEN_1-2", true)
  			elseif connesso then
    			client:send("MADE_IN_HAEVEN_2-1", true)
    		end
		else player.Mana = player.Mana+1
		end
		card.morta = true
	elseif card.id == 34 then -- moyai
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			card.abilita = true
			piuATK = -1500
			potenziare = true
			love.mouse.setCursor(Cursor.DePotenziare)
		else player.Mana = player.Mana+1
		end
	elseif card.id == 35 then -- Kronk Drip
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			for c,card1 in ipairs(inCampoCards) do 
				card1.HP = card1.HP + 1000
			end
			for c,card2 in ipairs(inCampoCards2) do 
				card2.ATK = card2.ATK - 100
			end
		else player.Mana = player.Mana+1
		end
		card.morta = true
	elseif card.id == 42 then -- Schrödinger
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			card.immune = true
		end
		for c,card1 in ipairs(inCampoCards) do
			if card1.id == 26 then
				card.ATK = card.ATK + 500
				card.HP = card.HP + 300
			end
		end
	end
end


function Abilita:useAbility()
	if draw_area then
		for c2,card2 in ipairs(inCampoCards2) do
			if (general:calculateDistance(card2.x+card2.width/4,card2.y+card2.height/4,mouse.x,mouse.y)) < 200 then
				danno = math.floor(2500-(general:calculateDistance(card2.x+card2.width/4,card2.y+card2.height/4,mouse.x,mouse.y)))
				general:danno(card2,attaccante)
				draw_area = false
				love.mouse.setCursor(Cursor.arrow)
			end
		end
	elseif draw_cono then
		for c,card2 in ipairs(inCampoCards2) do
			if ((giocatore == 1) and ((general:getAngle(cono.cxa,cono.cya, cono.cxb,cono.cyb)) > 0)) or ((giocatore == 2) and ((general:getAngle(cono.cxa,cono.cya, cono.cxb,cono.cyb)) < 0)) then
				if ((general:getAngle(card2.x+card2.width/4,card2.y+card2.height/4, cono.cxb,cono.cyb))-0.4 < (general:getAngle(cono.cxa,cono.cya, cono.cxb,cono.cyb))) and 
					((general:getAngle(card2.x+card2.width/4,card2.y+card2.height/4, cono.cxb,cono.cyb))+0.4 > (general:getAngle(cono.cxa,cono.cya, cono.cxb,cono.cyb)))
				 then
					general:stordisci(card2)
					draw_cono = false
					love.mouse.setCursor(Cursor.arrow)
				end
			end
		end
	elseif draw_smith then
		for c,card2 in ipairs(inCampoCards2) do
			if card2.hoverposizionato2 then
				smith.X = mouse.x 
				smith.Y = mouse.y
				smith.R = smith.r
				ruota_smith = false
				UPDATE_SMITH()
				love.mouse.setCursor(Cursor.arrow)
			end
		end
	elseif usa_laser then
		laser.x = mouse.x 
		laser.y = mouse.y
		draw_laser = true
		love.mouse.setCursor(Cursor.arrow)
	elseif draw_aculei then
		ferma_aculei = true
		for a,aculeo in ipairs(aculei) do
			flux.to(aculeo, 3, {x = (mouse.pressed.dx.x+(2*(mouse.pressed.dx.x-aculeo.x))), y = (mouse.pressed.dx.y+(2*(mouse.pressed.dx.y-aculeo.y))),})
		end
		tick.delay(function() draw_aculei = false end, 3)
			:after(function() love.mouse.setCursor(Cursor.arrow) end, 3)
	elseif curare then
		for c,card in ipairs(inCampoCards) do
			if card.hoverposizionato then
				general:cura(card)
				curare = false
				love.mouse.setCursor(Cursor.arrow)
			end
		end
	elseif potenziare then
		for c,card in ipairs(union(inCampoCards,inCampoCards2)) do
			if  card.hoverposizionato then
				general:aumentaATK(card)
				potenziare = false
				love.mouse.setCursor(Cursor.arrow)
			end
			if card.id == 1 or card.id == 9 then	-- Sciagghi or lolfun
				card.abilita = false
			elseif card.id == 34 then				--Moyai
				card.morta = true
			end
		end
	elseif ruba then
		for c2,card2 in ipairs(inCampoCards2) do
			if card2.hoverposizionato2 then
				table.insert(inventario.deck, card2.id)
				table.remove(inCampoCards2, c2)
				general:scambio_dati_carta()
				ruba = false
			end
		end
		for c,card in ipairs(inCampoCards) do
			if card.id == 13 then -- Juj
				card.abilita = false
			end
		end
	elseif uccidere then
		for c2,card2 in ipairs(inCampoCards2) do
			if card2.hoverposizionato2 then
				card2.morta = true
				uccidere = false
				for c,card in ipairs(inCampoCards) do
					if card.id == 5 then -- Trill
						card.abilita = false
					elseif card.id == 30 then --BAN
						card.morta = true
					end
				end
			end
		end
	elseif annullare then
		for c2,card2 in ipairs(inCampoCards2) do
			if card2.hoverposizionato2 then
				card2.puoabilita2 = false
				card2.INFO.Tabilita1 = ""
				card2.INFO.tabilita1 = ""
				card2.INFO.Tabilita2 = ""
				card2.INFO.tabilita2 = ""
				for c,card in ipairs(inCampoCards) do	
					if card.id == 24 then --Fat Chad Yoshi
						card.abilita = false
					end
				end
				annullare = false
			end
		end
	elseif evocare then
		LOAD_MINION(125)
	elseif switch then
		for c,card in ipairs(union(inCampoCards,inCampoCards2)) do
			if card.hoverposizionato then
				attaccante = nessuno
				switchATK = card.ATK
				card.ATK = card.HP 
				card.HP = switchATK
				switch = false
			end
			if card.id == 2 then --Lucy
				card.abilita = false
			end
		end
	elseif Telecinesi then
		love.mouse.setCursor(Cursor.TelecinesiPreso)
	elseif OSU then
		for c,card2 in ipairs(inCampoCards2) do
			danno = 300
			for g,go in ipairs(goOSU) do
				if ((general:calculateDistance(osu['random'..g].x,osu['random'..g].y, mouse.x,mouse.y)) < 50) and goOSU[g] then goOSU[g] = false
					if (general:aabb((card2.x-50),(card2.y-50), ((card2.width/4)+100),((card2.height/4)+100), osu['random'..g].x,osu['random'..g].y, 1, 1)) then
						general:danno(card2,attaccante)
					end
				end
			end
		end
	elseif cambia_classe_INGEGNERE_DEI_MEMES then
		for c,card in ipairs(union(inCampoCards, inCampoCards2)) do
			if card.hoverposizionato or card.hoverposizionato2 then
				card.INFO.classe = "INGEGNERE DEI MEMES"
				for c,card in ipairs(inCampoCards) do	
					if card.id == 27 then -- Il sam
						card.abilita = false
					end
				end
				cambia_classe_INGEGNERE_DEI_MEMES = false
			end
		end
		love.mouse.setCursor(Cursor.arrow)
	elseif 
		PEPONE.bool then LOAD_MINION(100) 
	end
end


function Abilita:load()
	ABimg = love.graphics.newImage("assets/cards/cardfont/ABimg.png")
	Made_in_Heaven = {bool = false, time = 120}
	KYS = {bool = false,TURNO}
	KYS_ALL = {bool = false,TURNO}
	PEPONE = {
		PE={},
		PO={},
		NE={},
		bool=false}
end

function Abilita:update(dt)
	UPDATE_LA_PRIMA_REPUBBLICA()
	if draw_smith and not ruota_smith then
		UPDATE_SMITH()
	end
	if draw_bean then
		UPDATE_LASER(dt)
	end
	if draw_cono then
		UPDATE_CONO()
	end
	if ferma_aculei then
		UPDATE_ACULEI()
	end
	if draw_stelle then
		UPDATE_STELLE(dt)
	end
	if draw_cuori then
		UPDATE_CUORI(dt)
	end
	if COMMISSIONE_NON_PAGATA then
		UPDATE_COMMISSIONE_NON_PAGATA(dt)
	end
	if KYS.bool then
		UPDATE_KYS()
	end
	if KYS_ALL.bool then
		UPDATE_KYS_ALL()
	end
	if Made_in_Heaven.bool then
		UPDATE_MADE_IN_HEAVEN(dt)
	end
end

function Abilita:draw(card)
	love.graphics.setColor(love.math.colorFromBytes(255,255,255))
		--carte posizionate
	if card.posizionato then
			--se abilità attiva
		if card.abilita then
			love.graphics.draw(ABimg,card.x , card.y, card.r, 1/2, 1/2)
		end
	end
	if draw_area then
		DRAW_AREA()
	end
	if draw_cono then
		DRAW_CONO()
	end
	if draw_smith then
		DRAW_SMITH()
	end
	if draw_laser then
		DRAW_LASER()
	end
	if draw_aculei then
		DRAW_ACULEI(dt)
	end
	if draw_stelle then
		DRAW_STELLE()
	end
	if draw_cuori then
		DRAW_CUORI()
	end
	if COMMISSIONE_NON_PAGATA then
		DRAW_COMMISSIONE_NON_PAGATA()
	end
	if OSU then
		DRAW_OSU()
	end
	if Made_in_Heaven.bool then
		DRAW_MADE_IN_HEAVEN()
	end
end

function LOAD_ABILITA()
	Abilita:load()
end

function UPDATE_ABILITA(dt)
	Abilita:update(dt)
end

function DRAW_ABILITA()
    for c, card in ipairs(activeCards) do
    	if not card.hover then
        	Abilita:draw(card)
        end
    end

    for c, card in ipairs(activeCards) do
    	if card.hover then
        	Abilita:draw(card)
        end
    end
end

function DRAW_AREA()
	love.graphics.circle("line", mouse.x, mouse.y, 200 )
end


function LOAD_SMITH()
	love.mouse.setCursor(Cursor.Smith)
	ruota_smith = true
	draw_smith = true
	smith = {img,width,height,x,y,r,ox,oy}
	smith.img = love.graphics.newImage("assets/cards/cardfont/SMITHimg.png")
	smith.width = smith.img:getWidth()
	smith.height = smith.img:getHeight()
	smith.X = smith.x
	smith.Y = smith.y
	smith.ox = smith.width/2
	smith.oy = smith.height/2
end

function UPDATE_SMITH()
	flux.to(smith, 1, {x = smith.X, y = smith.Y})
	for c,card2 in ipairs(inCampoCards2) do
		if general:aabb(card2.x,card2.y, card2.width/2,card2.height/2, smith.x,smith.y, 1, 1) and not card2.abilita then
			general:avvelena(card2)
			danno = 300
			general:danno(card2,attaccante)
			draw_smith = false
		end
	end
end

function DRAW_SMITH()
	smith.r = general:getAngle(smith.x, smith.y, mouse.x, mouse.y) +((3.14/2)+0.1)
	if ruota_smith then
		smith.R = smith.r
	end
	love.graphics.draw(smith.img, smith.x,smith.y, smith.R, 1/2,1/2, smith.ox,smith.oy)
end

function LOAD_LASER()
	love.mouse.setCursor(Cursor.Laser)
	laser = {img,width,height,x,y,r,ox,oy,alfa}
	laser.img = love.graphics.newImage("assets/cards/cardfont/LASERimg.png")
	laser.width = laser.img:getWidth()
	laser.height = laser.img:getHeight()
	laser.x = mouse.x
	laser.y = mouse.y
	laser.ox = laser.width/2
	laser.oy = laser.height/2
	laser.alfa = 0
	ruota_laser = true
	usa_laser = true
	bean = {img,width,height,x,y,r,ox,oy,scale}
	bean.img = love.graphics.newImage("assets/cards/cardfont/BEANimg.png")
	bean.width = bean.img:getWidth()
	bean.height = bean.img:getHeight()
	bean.x = mouse.x
	bean.y = mouse.y
	bean.scale = {width,height}
	bean.scale.width = 0
	bean.scale.height = 1.6
	bean.ox = bean.width/2
	bean.oy = bean.height/2
end

function UPDATE_LASER(dt)
	bean.scale.width = 1.5*bean.scale.width+0.5*dt
	for c2,card2 in ipairs(inCampoCards2) do
		if general:calculateDistanceToLine(card2.x+card2.width/4,card2.y+card2.height/4, laser.x,laser.y, mouse.released.dx.x,mouse.released.dx.y) < (bean.height*bean.scale.height) then
			danno = 80
			general:danno(card2,attaccante)
		end
	end
end

function ANIMATE_LASER(x, y, button)
	laser.R = laser.r
	ruota_laser = false
	usa_laser = false
	draw_bean = true
	mouse.released.dx.x = mouse.x 
	mouse.released.dx.y = mouse.y 
	tick.delay(function() draw_laser = false end, 1.75)
		:after(function() draw_bean = false end, 0)
		:after(function() 
		for c,card in ipairs(inCampoCards) do 
			if card.id == 16 then	--Morte Oscura
				card.abilita = false
			end
		end
		 end, 0)
end

function DRAW_LASER()
	if ruota_laser then
		laser.r = general:getAngle(laser.x, laser.y, mouse.x, mouse.y) +((3.14/2)+0.5)
		laser.R = laser.r
		bean.r = laser.r -2.07
	end
	laser.alfa = (laser.alfa+0.006)*1.01
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,laser.alfa))
	love.graphics.draw(laser.img, laser.x,laser.y, laser.R, 2,2, laser.ox,laser.oy)
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
	if draw_bean then
		love.graphics.draw(bean.img, laser.x,laser.y, bean.r, bean.scale.width,bean.scale.height, (-100)/bean.scale.width,bean.oy, 0,0)
	end

	love.graphics.setColor(love.math.colorFromBytes(255,100,100,255))
end


function LOAD_ACULEI()
	love.mouse.setCursor(Cursor.Aculeo)
	ferma_aculei = false
	draw_aculei = true
	aculei = {}
	aculei[1] = {x = love.math.random(0, 140), y = love.math.random(50, 685), r = 0}
	aculei[2] = {x = love.math.random(1140, 1280), y = love.math.random(50, 685), r = 0}
	aculei[3] = {x = love.math.random(0, 140), y = love.math.random(50, 685), r = 0}
	aculei[4] = {x = love.math.random(1140, 1280), y = love.math.random(50, 685), r = 0}
	aculei[5] = {x = love.math.random(0, 140), y = love.math.random(50, 685), r = 0}
	aculei[6] = {x = love.math.random(1140, 1280), y = love.math.random(50, 685), r = 0}
	aculei[7] = {x = love.math.random(0, 140), y = love.math.random(50, 685), r = 0}
	aculei[8] = {x = love.math.random(1140, 1280), y = love.math.random(50, 685), r = 0}
end

function ANIMATE_ACULEI(dt)
end

function UPDATE_ACULEI(dt)
	for c2,card2 in ipairs(inCampoCards2) do
		for a,aculeo in ipairs(aculei) do
			if general:aabb(card2.x, card2.y, card2.width/2, card2.height/2, aculeo.x, aculeo.y, 1, 1) then
				general:avvelena(card2)
			end
		end
	end
end

function DRAW_ACULEI(dt)
	for a,aculeo in ipairs(aculei) do
		if not ferma_aculei then
			aculeo.r = general:getAngle(aculeo.x, aculeo.y, mouse.x, mouse.y) -math.pi/2
		end
		aculeo.R = aculeo.r
		general:drawRotatedTriangle("fill", aculeo.x, aculeo.y, 20, 40, aculeo.R)
	end
end


function LOAD_STELLE()
	love.mouse.setCursor(Cursor.Stella)
	stellaimg = {img, width, height}
	stellaimg.img = love.graphics.newImage("assets/cards/cardfont/STELLAimg.png")
	stellaimg.width = stellaimg.img:getWidth()
	stellaimg.height = stellaimg.img:getHeight()
	stelle = {}
	stella = {x,y,z,r}
	stelle_ruota = false
	for s, stella in ipairs(stelle) do
		stella.z = true
	end

	draw_stelle = true
	tick.delay(function() stelle[1] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 1.2)
  		:after(function() stelle[2] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[3] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[4] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[5] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[6] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[7] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[8] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[9] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[10] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[11] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[12] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[13] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[14] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() stelle[15] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
		:after(function() ANIMATE_STELLE(dt) end , 0.9)
		:after(function() stelle_ruota = true end , 0.1)
		:after(function() draw_stelle = false end, 5)
		:after(function() stelle = {} end, 0)
		:after(function() stelle_ruota = false end, 0)
end

function ANIMATE_STELLE()
	for c2, card2 in ipairs(inCampoCards2) do
		stella_X = card2.x+card2.width/4
		stella_Y = card2.y+card2.height/4
		for s, stella in ipairs(stelle) do
			if stella.z then
				flux.to(stelle[s], 5, {x = stella_X, y = stella_Y})
			end
		end
	end
end

function UPDATE_STELLE(dt)
	for c2, card2 in ipairs(inCampoCards2) do
		for s, stella in ipairs(stelle) do
			if stella.z then
				if general:aabb(card2.x,card2.y, card2.width/2,card2.height/2, stella.x,stella.y, 1,1) then
					danno = 150
					general:danno(card2,attaccante)
					stella.z = false
				end
			else
				stella.x = -10 
				stella.y = -10
			end
			if stelle_ruota then
				stella.r = 1.1*stella.r+0.9*dt
			end
		end
	end
end

function DRAW_STELLE()
	for s, stella in ipairs(stelle) do
		love.graphics.draw(stellaimg.img, stella.x,stella.y, stella.r, 0.9,0.9, stellaimg.width/2,stellaimg.height/2)
	end
end


function LOAD_CUORI()
	love.mouse.setCursor(Cursor.Cuore)
	cuoreimg = {img, width, height}
	cuoreimg.img = love.graphics.newImage("assets/cards/cardfont/CUOREimg.png")
	cuoreimg.width = cuoreimg.img:getWidth()
	cuoreimg.height = cuoreimg.img:getHeight()
	cuori = {}
	cuore = {x,y,z,r}
	cuori_ruota = false
	for s, cuore in ipairs(cuori) do
		cuore.z = true
	end

	draw_cuori = true
	tick.delay(function() cuori[1] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 1.2)
  		:after(function() cuori[2] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[3] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[4] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[5] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[6] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[7] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[8] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[9] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[10] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[11] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[12] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[13] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[14] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
  		:after(function() cuori[15] = {x = mouse.x, y = mouse.y, z = true, r = 0} end, 0.3)
		:after(function() ANIMATE_CUORI(dt) end , 0.9)
		:after(function() cuori_ruota = true end , 0.1)
		:after(function() draw_cuori = false end, 5)
		:after(function() cuori = {} end, 0)
		:after(function() cuori_ruota = false end, 0)
end

function ANIMATE_CUORI()
	for c, card in ipairs(inCampoCards) do
		cuore_X = card.x+card.width/4
		cuore_Y = card.y+card.height/4
		for cu, cuore in ipairs(cuori) do
			if cuore.z then
				flux.to(cuori[cu], 5, {x = cuore_X, y = cuore_Y})
			end
		end
	end
end

function UPDATE_CUORI(dt)
	for c, card in ipairs(inCampoCards) do
		for cu, cuore in ipairs(cuori) do
			if cuore.z then
				if general:aabb(card.x,card.y, card.width/2,card.height/2, cuore.x,cuore.y, 1,1) then
					antidanno = 100
					general:cura(card)
					cuore.z = false
				end
			else
				cuore.x = -10 
				cuore.y = -10
			end
			if cuori_ruota then
				cuore.r = 1.1*cuore.r+0.9*dt
			end
		end
	end
end

function DRAW_CUORI()
	for cu, cuore in ipairs(cuori) do
		love.graphics.draw(cuoreimg.img, cuore.x,cuore.y, cuore.r, 0.9,0.9, cuoreimg.width/2,cuoreimg.height/2)
	end
end


function LOAD_CONO()
	love.mouse.setCursor(Cursor.Urlo)
	draw_cono = true
	cono = {sxa,sya,dxa,dya,sxb,syb,dxb,dyb}
end

function UPDATE_CONO()
	cono.dxa = mouse.x +140
	cono.sxa = mouse.x -140
	cono.cxa = mouse.x
	if mouse.y < 345 then
		cono.dya = 0
		cono.sya = 0
		cono.cya = 0
	else
		cono.dya = window.height
		cono.sya = window.height
		cono.cya = window.height
	end
end

function DRAW_CONO()
	love.graphics.polygon("line", cono.dxa,cono.dya, cono.sxa,cono.sya, cono.sxb,cono.syb, cono.dxb,cono.dyb)
end

function UPDATE_LA_PRIMA_REPUBBLICA()
	for p,pe in ipairs(PEPONE.PE) do
		for p,po in ipairs(PEPONE.PO) do
			for p,ne in ipairs(PEPONE.NE) do
				PEPONE.bool = true
				love.mouse.setCursor(Cursor.Evocare)
			end
		end
	end
end

function elimina_cloni()
	for c1,card1 in ipairs(union(inCampoCards,inCampoCards2)) do
		for c2,card2 in ipairs(union(inCampoCards,inCampoCards2)) do
			if c1 ~= c2 then
				if card1.Name == card2.Name then
					card1.morta = true
					card2.morta = true
				end
			end
		end
	end
	general:scambio_dati_carta()
end

function LOAD_COMMISSIONE_NON_PAGATA()
	COMMISSIONE_NON_PAGATA = true
	COMMISSIONE_NON_PAGATA_RADIUS = 10
	COMMISSIONE_NON_PAGATA_ALPHA = 255
	for c,card in ipairs(inCampoCards) do
		tick.delay(function () COMMISSIONE_NON_PAGATA = false end , 5)
			:after(function () card.abilita = false end , 0)
			:after(function () card.attacco = false end , 0)
	end
	inCampoAria = {}
	for c,card in ipairs(inCampoCards) do
		if card.id == 11 then --Aria
			table.insert(inCampoAria,card) --Combo di Aria
			danno = card.ATK*(#inCampoAria) 	--Danno Combo di Aria
		end
	end
end

function UPDATE_COMMISSIONE_NON_PAGATA(dt)
	if COMMISSIONE_NON_PAGATA then
		COMMISSIONE_NON_PAGATA_RADIUS = (1.011*COMMISSIONE_NON_PAGATA_RADIUS+40*dt)
		COMMISSIONE_NON_PAGATA_ALPHA = (0.98*COMMISSIONE_NON_PAGATA_ALPHA-0.9999*dt)
	end
end

function DRAW_COMMISSIONE_NON_PAGATA()
	love.graphics.setColor(love.math.colorFromBytes(7, 0, 135,COMMISSIONE_NON_PAGATA_ALPHA))
	love.graphics.circle("fill", mouse.pressed.rot.x, mouse.pressed.rot.y, COMMISSIONE_NON_PAGATA_RADIUS )
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
end

function LOAD_OSU()
	OSU = true

	osu = {random1,random2,random3,random4,random5,random6,random7,random8,min,max,img}
	osu.img = {img,width,height}
	osu.img.img = love.graphics.newImage("assets/cards/cardfont/OSUimg.png")
	osu.img.width = osu.img.img:getWidth()
	osu.img.height = osu.img.img:getHeight()
	osu.min = {x,y}
	osu.max = {x,y}
	osu.random1 = {x,y}	--DA SEMPLIFICARE
	osu.random2 = {x,y}
	osu.random3 = {x,y}
	osu.random4 = {x,y}
	osu.random5 = {x,y}
	osu.random6 = {x,y}
	osu.random7 = {x,y}
	osu.random8 = {x,y}
	osu.min.x = 100
	osu.max.x = 1080
	if giocatore == 1 then
		osu.min.y = 345
		osu.max.y = 645
	elseif giocatore == 2 then
		osu.min.y = 45
		osu.max.y = 345
	end
	osu.random1.x = love.math.random(osu.min.x, osu.max.x)
	osu.random1.y = love.math.random(osu.min.y, osu.max.y)
	osu.random2.x = love.math.random(osu.min.x, osu.max.x)
	osu.random2.y = love.math.random(osu.min.y, osu.max.y)
	osu.random3.x = love.math.random(osu.min.x, osu.max.x)
	osu.random3.y = love.math.random(osu.min.y, osu.max.y)
	osu.random4.x = love.math.random(osu.min.x, osu.max.x)
	osu.random4.y = love.math.random(osu.min.y, osu.max.y)
	osu.random5.x = love.math.random(osu.min.x, osu.max.x)
	osu.random5.y = love.math.random(osu.min.y, osu.max.y)
	osu.random6.x = love.math.random(osu.min.x, osu.max.x)
	osu.random6.y = love.math.random(osu.min.y, osu.max.y)
	osu.random7.x = love.math.random(osu.min.x, osu.max.x)
	osu.random7.y = love.math.random(osu.min.y, osu.max.y)
	osu.random8.x = love.math.random(osu.min.x, osu.max.x)
	osu.random8.y = love.math.random(osu.min.y, osu.max.y)

	UPDATE_OSU()
	tick.delay(function() goOSU[1] = true end, 1)
	:after(function() goOSU[2] = true end, 0.5)
	:after(function() goOSU[3] = true end, 0.5)
	:after(function() goOSU[4] = true end, 0.45)
	:after(function() goOSU[5] = true end, 0.4)
	:after(function() goOSU[6] = true end, 0.35)
	:after(function() goOSU[7] = true end, 0.25)
	:after(function() goOSU[8] = true end, 0.2)
	tick.delay(function () OSU = false end , 6)
	
end

function UPDATE_OSU()
	goOSU = {}
	for i,go in ipairs(goOSU) do
		go = false
	end
	osu.min.x = 100
	osu.max.x = 1080
	if giocatore == 1 then
		osu.min.y = 45
		osu.max.y = 345
	elseif giocatore == 2 then
		osu.min.y = 345
		osu.max.y = 645
	end
	osu.random1.x = love.math.random(osu.min.x, osu.max.x)
	osu.random1.y = love.math.random(osu.min.y, osu.max.y)
	osu.random2.x = love.math.random(osu.min.x, osu.max.x)
	osu.random2.y = love.math.random(osu.min.y, osu.max.y)
	osu.random3.x = love.math.random(osu.min.x, osu.max.x)
	osu.random3.y = love.math.random(osu.min.y, osu.max.y)
	osu.random4.x = love.math.random(osu.min.x, osu.max.x)
	osu.random4.y = love.math.random(osu.min.y, osu.max.y)
	osu.random5.x = love.math.random(osu.min.x, osu.max.x)
	osu.random5.y = love.math.random(osu.min.y, osu.max.y)
	osu.random6.x = love.math.random(osu.min.x, osu.max.x)
	osu.random6.y = love.math.random(osu.min.y, osu.max.y)
	osu.random7.x = love.math.random(osu.min.x, osu.max.x)
	osu.random7.y = love.math.random(osu.min.y, osu.max.y)
	osu.random8.x = love.math.random(osu.min.x, osu.max.x)
	osu.random8.y = love.math.random(osu.min.y, osu.max.y)
end

function DRAW_OSU()
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
	for g,go in ipairs(goOSU) do
		if goOSU[g] then
			love.graphics.draw(osu.img.img, osu['random'..g].x, osu['random'..g].y, 0, 0.1, 0.1, osu.img.width/2, osu.img.height/2)
		end
	end
end

function LOAD_TELECINESI()
	Telecinesi = true
	love.mouse.setCursor(Cursor.TelecinesiLibero)
	for c2,card2 in ipairs(inCampoCards2) do
		card2.X = card2.x 
		card2.Y = card2.y 
		if not card2.morta then
			tick.delay(function() flux.to(card2, 1.5, {x = card2.X, y = card2.Y}) end, 7)
			:after(function() Telecinesi = false end, 0)
			:after(function() love.mouse.setCursor(Cursor.arrow) end, 0)
			:after(function() 
				for c,card in ipairs(inCampoCards) do
					if card.id == 18 then -- Inazuma sensei
						card.abilita = false
					end
				end
			 end, 0)
			:after(function() general:scambio_dati_carta() end, 1.6)
		end
	end	
end

function ANIMATE_TELECINESI(x, y, dx, dy)
	for c2,card2 in ipairs(inCampoCards2) do
		if card2.hoverposizionato2 and love.mouse.isDown(2) then
			card2.x = card2.x + dx
			card2.y = card2.y + dy
			if dx > 100 then
				card2.stato.STORDITO = true
			elseif dy > 50 and dy < 100 then
				danno = 50
				general:danno(card2,attaccante)
			elseif dy >= 100 then
				danno = 100
				general:danno(card2,attaccante)
			end
		end
	end
end

function LOAD_PLYTLAS()
	for c2,card2 in ipairs(inCampoCards2) do
		if ((card2.INFO.classe == "CONTENT CREATOR") or (card2.INFO.classe == "GOLDEN STAFF SEGRETARIO")) then
			piuATK = -500
			general:aumentaATK(card2)
		end
	end
end 


function LOAD_KYS()
	KYS.bool = true
	KYS.TURNO = turno.n
end
function UPDATE_KYS()
	if turno.n == KYS.TURNO + 2 then
		for c,card in ipairs(inCampoCards) do
			if card.id == 15 then -- Mostro di Firenze
				card.morta = true
				KYS.bool = false
			end
		end
	end
end


function LOAD_KYS_ALL()
	KYS_ALL.bool = true
	KYS_ALL.TURNO = turno.n
end
function UPDATE_KYS_ALL()
	if turno.n == KYS_ALL.TURNO + 3 then
		inCampoCards = {}
		inCampoCards2 = {}
		general:scambio_dati_carta()
		general:scambio_dati_carta_propria()
		KYS_ALL.bool = false
	end
end


function LOAD_DIMEZZA_HP()
	for c2,card2 in ipairs(inCampoCards2) do
		card2.HP = card2.HP/2
	end
	general:scambio_dati_carta()
end 

function LOAD_RADDOPPIA_HP()
	for c,card in ipairs(inCampoCards) do
		card.hp = card.hp*2
		card.HP = card.HP*2
	end
	general:scambio_dati_carta()
end 


function LOAD_MADE_IN_HEAVEN()
	Made_in_Heaven.bool = true
	Made_in_Heaven.time = 120
end

function UPDATE_MADE_IN_HEAVEN(dt)
	if Made_in_Heaven.time >= 90 then
		Made_in_Heaven.time = (0.99999*Made_in_Heaven.time)-1*dt 
	elseif Made_in_Heaven.time >= 60 and Made_in_Heaven.time < 90 then
		Made_in_Heaven.time = (0.9999*Made_in_Heaven.time)-1*dt 
	elseif Made_in_Heaven.time >= 30 and Made_in_Heaven.time < 60 then
		Made_in_Heaven.time = (0.999*Made_in_Heaven.time)-1*dt
	elseif Made_in_Heaven.time < 30 then
		Made_in_Heaven.time = (0.99*Made_in_Heaven.time)-1*dt
	end

	if Made_in_Heaven.time <= 0 then
		if player.HP >= player2.HP then
			player2.HP = 0 
		else
			player.HP = 0 
		end
		general:scambio_dati_player()
		Made_in_Heaven.bool = false
	end
end

function DRAW_MADE_IN_HEAVEN()
	love.graphics.setFont(Font.combatTextFont)
	love.graphics.print(math.floor(Made_in_Heaven.time), window.width/3+30, 3*window.height/11, 0, 3, 3)
end


function LOAD_MINION(id)
	table.insert(activeCards, Card:new(0, 0, 1,false, id))
	for i,card in ipairs(activeCards) do
		if card.id == id and not card.posizionato then
			for u,camp in ipairs(campi) do
   				for l,campo in ipairs(camp) do
					if campo.hotcampo and u == 1 then
						card.x = campo.x
						card.y = campo.y
						card.posizionato = true
						table.insert(inCampoCards,card)
						Abilita:activeAbilitySummon(card)
						evocare = false
						if PEPONE.bool then
							PEPONE = {
								PE={},
								PO={},
								NE={},
								bool=false}
						end
						love.mouse.setCursor(Cursor.arrow)
						for c,card in ipairs(inCampoCards) do	
							if card.id == 25 then --Mortius
								card.abilita = false
							end
						end
					end
				end
			end
		end
	end
end


function LOAD_CHIUDI()
	if hoster then
		server:sendToAll("CHIUDI_1-2", true)
  	elseif connesso then
    	client:send("CHIUDI_2-1", true)
    end
end