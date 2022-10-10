tutorial = {}

function tutorial:load()
	tutorial.bool = true
	tutorial.no_cambia_turno = true
	tutorial.no_sacrifici = true
	tutorial.no_posizionamenti = false
	tutorial.next = {
		img = love.graphics.newImage("assets/menu/tutorials/next.png"),
		x = 50,
		y = 50
	}
	tutorial.next.width = tutorial.next.img:getWidth()
	tutorial.next.height = tutorial.next.img:getHeight()
	tutorial.bar = {
		img = love.graphics.newImage("assets/menu/tutorials/bar.png"),
		x = 300,
		y = 50
	}
	tutorial.bar.width = tutorial.bar.img:getWidth()
	tutorial.bar.height = tutorial.bar.img:getHeight()
	tutorial.arrow = {
		img = love.graphics.newImage("assets/menu/tutorials/arrow.png"),
		bool = false,
		bool2 = false,
		bool3 = false
	}
	tutorial.arrow.width = tutorial.arrow.img:getWidth()
	tutorial.arrow.height = tutorial.arrow.img:getHeight()

	tutorial.mouse = { --da fare
		img0 = love.graphics.newImage("assets/menu/tutorials/Grid213x269.png"),
		img = {},
		x = 0,
		y = 0,
		bool = false,
		bool2 = false,
		bool3 = false
	}
	tutorial.mouse.img[1] = love.graphics.newQuad( 213, 0, 213, 269, tutorial.mouse.img0)
	tutorial.mouse.img[2] = love.graphics.newQuad( 426, 0, 213, 269, tutorial.mouse.img0)
	tutorial.mouse.img[3] = love.graphics.newQuad( 639, 0, 213, 269, tutorial.mouse.img0)
	--steps per il tutorial
	tutorial.step = 1
	Timer.after(2.5, function() --⏱️
		tutorial.arrow.bool = true
	end)
	cards:load()
	giocatore = 1
	gamestate.switch(inGamE)
end

function tutorial:update(dt)
	if tutorial.bool then
		if tutorial.step == 15 then
			if tutorial.mouse.bool then
				tutorial.mouse.x = tutorial.mouse.x+20*dt
				tutorial.mouse.y = tutorial.mouse.y-50*dt
				if tutorial.mouse.y <= -350 then
					tutorial.mouse.y = 0 
					tutorial.mouse.x = 0
				end
			end
			for c,card in ipairs(inCampoCards) do
				tutorial.step = tutorial.step+1
			end
		elseif tutorial.step == 18 then
			for c2,card2 in ipairs(inCampoCards2) do
				if card2.HP < card2.hp then
					tutorial.step = tutorial.step+1
				end
			end
		elseif tutorial.step == 21 then
			text_anim:load("NON PUOI USARE LA TUA ABILITA'\n NEL TURNO IN CUI LA EVOCHI",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0) --💬
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 26 and player.Mana >= 4 then
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 28 and giocatore == 2 then
			Abilita:cambiaTurno()
			tutorial.step = tutorial.step+1
		end
	end
end

function tutorial:draw() --✏️
	if tutorial.bool then
		love.graphics.setFont(font.pixel)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255))
			--barra di testo
		if tutorial.step >=2 then
			love.graphics.draw(tutorial.bar.img, tutorial.bar.x, tutorial.next.y, 0, 0.56, 1)
			love.graphics.setColor(love.math.colorFromBytes(162,80,12))		--🎨
			text_anim:draw()
		end
			--tasto NEXT
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))		--🎨
		love.graphics.draw(tutorial.next.img, tutorial.next.x, tutorial.next.y)
		love.graphics.setColor(love.math.colorFromBytes(162,80,12,255))		--🎨
		if tutorial.step >= 38 then
			love.graphics.print("END", tutorial.next.x+25, tutorial.next.y+35, 0, 0.53, 0.52)
		else
			love.graphics.print("NEXT", tutorial.next.x+25, tutorial.next.y+35, 0, 0.53, 0.52)
		end
			--clicca qui per andare avanti col tutorial
		love.graphics.setFont(font.cardName)
		love.graphics.setColor(love.math.colorFromBytes(250,255,255,255))		--🎨
		if tutorial.step == 1 and tutorial.arrow.bool then 									--freccia 1
			love.graphics.draw(tutorial.arrow.img, 250, 145, 1, 0.4, 0.4)
			love.graphics.print(
				[[premi qui per andare
				 avanti col tutorial]],
				  350, 500, 0, 0.5, 0.5)
		elseif tutorial.step == 15 and tutorial.arrow.bool2 then 							--freccia 2
			love.graphics.draw(tutorial.arrow.img, window.width*0.15, window.height*0.83, 0, 0.4, 0.4)
			love.graphics.print(
				[[CARTA]],
				  window.width*0.25, window.height*0.805, 0, 0.6, 0.6)
			for u,camp in ipairs(campi) do
				for i,campo in ipairs(camp) do
					if u == 1 then
						love.graphics.draw(tutorial.arrow.img, campo.x+campo.width*0.5, campo.y, -math.pi/2, 0.1, 0.1, 0, tutorial.arrow.height/2)
		     	   	end
		   		end
			end
		elseif tutorial.step == 26 and tutorial.arrow.bool3 then 							--freccia 3
			love.graphics.setColor(love.math.colorFromBytes(200,20,20,255))		--🎨
			love.graphics.setLineWidth(14)
			for u,camp in ipairs(campi) do
				for i,campo in ipairs(camp) do
					if u == 6 then
						love.graphics.circle("line",campo.x+campo.width/2,campo.y+campo.height/2,110)
					end
	        	end
	   	end
	   	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))		--🎨
	   	love.graphics.setLineWidth(1)
		end
		if tutorial.step == 15 and tutorial.mouse.bool then
			for c,card in ipairs(inManoCards) do
				love.graphics.draw(tutorial.mouse.img0, tutorial.mouse.img[1], card.x+card.width/2+tutorial.mouse.x, card.y+card.height/2+tutorial.mouse.y, 0, 0.4, 0.4)
			end
		elseif tutorial.step == 18 and tutorial.mouse.bool2 then
			for c,card in ipairs(inCampoCards) do
				if card.puoattaccare and not card.attacco then
					love.graphics.draw(tutorial.mouse.img0, tutorial.mouse.img[2], card.x+card.width/4+tutorial.mouse.x, card.y+card.height/2+tutorial.mouse.y, 0, 0.4, 0.4)
				else
					for c2,card2 in ipairs(inCampoCards2) do
						love.graphics.draw(tutorial.mouse.img0, tutorial.mouse.img[2], card2.x+card2.width/4+tutorial.mouse.x, card2.y+card2.height/2+tutorial.mouse.y, 0, 0.4, 0.4)
					end
				end
			end
		elseif tutorial.step == 20 and tutorial.mouse.bool3 then
			for c,card in ipairs(inCampoCards) do
				love.graphics.draw(tutorial.mouse.img0, tutorial.mouse.img[3], card.x+card.width/4+tutorial.mouse.x, card.y+card.height/2+tutorial.mouse.y, 0, 0.4, 0.4)
			end
		end
	end
end

function tutorial:mousepressed(x, y, button)
		--vari steps del tutorial
	if tutorial.bool then
		if button == 1 and general:aabb(tutorial.next.x, tutorial.next.y, tutorial.next.width, tutorial.next.height, mouse.x, mouse.y, 1, 1) and not(tutorial.step == 15 or tutorial.step == 18 or tutorial.step == 19 or tutorial.step == 20 or tutorial.step == 26)  then
			tutorial.step = tutorial.step+1
		end
		if tutorial.step == 2 then
				--(testo,
			text_anim:load("BENVENUTO NEL TUTORIAL DI PING",
									--x,				y,			scalax,	scalay,		sec_per_lettera,sec_passati,lettera_corrente)
				tutorial.bar.x*1.1, tutorial.bar.y*1.7,		0.5, 0.5, 		0.1, 0, 0) --💬
			Timer.after(2.5, function() --⏱️
				tutorial.arrow.bool = false
			end)
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 4 then
			text_anim:load("PER PRIMA COSA ECCOTI UNA CARTA",
				tutorial.bar.x*1.1, tutorial.bar.y*1.7,	0.5, 0.5,		0.07, 0, 0) --💬
			Timer.after(2, function() --⏱️
					--carta di Trill
				cards:spawn(100,window.height*0.78,5)
			end)
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 6 then
			text_anim:load("QUANDO INIZI UNA PARTITA PUOI\nSCEGLIERNE 30 DA METTERE NEL MAZZO",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.4, 0.4,		0.07, 0, 0) --💬
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 8 then
			text_anim:load("(MASSIMO 2 COPIE PER OGNI CARTA)",
				tutorial.bar.x*1.1, tutorial.bar.y*1.7,		0.5, 0.5,		0.055, 0, 0) --💬
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 10 then
			text_anim:load("E UNA PARTITA INIZIA\n CON 5 CARTE",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.4, 0.4,		0.07, 0, 0) --💬
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 12 then
			text_anim:load("GLI UTENTI SI POSIZIONANO NELLA META' ALTA\n E LE REAZIONI NELLA META' BASSA",
				tutorial.bar.x*1.1, tutorial.bar.y*1.4,	0.38, 0.4,		0.07, 0, 0) --💬
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 14 then
			text_anim:load("PER POSIZIONARE UNA CARTA POSIZIONA IL MOUSE SU\n DI ESSA E TIENI PREMUTO IL TASTO SX,  TRASCINA IL\n MOUSE SULLO SPAZIO APPOSITO E RILASCIA IL MOUSE",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0) --💬
			Timer.after(9, function() --⏱️
				tutorial.mouse.bool = true
				Timer.after(4, function() --⏱️
					tutorial.arrow.bool2 = true
				end)
			end)
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 17 then
			text_anim:load("PER ATTACCARE UNA CARTA AVVERSARIA\n PREMI TASTO DX SULLA TUA CARTA E\n TASTO DX SU QUELLA AVVERSARIA\n\n\n                                            \n\n\n\n C'E' UNA POSSIBILITA' DI DANNO CRITICO (X10)",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0) --💬
			for c,card in ipairs(inCampoCards) do
				card.puoattaccare = true
			end
			cards:spawn(100,window.height*0.78,1)
				table.insert(inCampoCards2, inManoCards[2])
				table.remove(inManoCards, 2)
				inCampoCards2[1].x = 263
				inCampoCards2[1].y = 161
			Timer.after(8, function() --⏱️
				tutorial.mouse.bool2 = true
			end)
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 19 then
			text_anim:load("PER ATTIVARE L'ABILITA' SPECIALE DI\n UNA TUA CARTA USA IL TASTO ROTELLINA\n DEL MOUSE",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0) --💬
			Timer.after(8, function() --⏱️
				tutorial.mouse.bool3 = true
			end)
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 20 and button == 3 then
			for c,card in ipairs(inCampoCards) do 
				if general:aabb(card.x, card.y, card.width/2, card.height/2, mouse.x, mouse.y, 1, 1) then
					tutorial.step = tutorial.step+1
				end
			end
		elseif tutorial.step == 23 then
			text_anim:load("RICORDA CHE L'ATTIVAZIONE DI\n UNA ABILITA' RICHIEDE MANA\n (INDICATO IN BASSO A DX)",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0) --💬
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 25 then
			text_anim:load("PER OTTENERE MANA DEVI SACRIFICARE\n CARTE DALLA TUA MANO (+1 MANA)\n > POSIZIONA LA CARTA SULLA ZONA SACRIFICI <",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0) --💬
			tutorial.no_posizionamenti = true
			tutorial.no_sacrifici = false
			Timer.after(1.6, function() --⏱️
					--Cring3_Crimson
				cards:spawn(100,window.height*0.78,23)
				Timer.after(9, function() --⏱️
					tutorial.arrow.bool3 = true
				end)
			end)
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 27 then
			text_anim:load("PASSA IL TURNO\n PREMENDO L'APPOSITO PULSANTE",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0) --💬
			tutorial.no_cambia_turno = false
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 29 then
			text_anim:load("OGNI CARTA HA LA SUA ABILITA'\n E CLASSE",
				tutorial.bar.x*1.1, tutorial.bar.y*1.4,	0.5, 0.5,		0.069, 0, 0) --💬
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 31 then
			text_anim:load("LE CARTE POSSONO ESSERE\n		UTENTI  O  REAZIONI\n	E SI DISTINGUONO DALLA LORO CORNICE",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0) --💬
			Timer.after(1.6, function() --⏱️
					--Ping & #memes
				cards:spawn(100,window.height*0.78,2)
				cards:spawn(250,window.height*0.78,32)
			end)
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 33 then
			text_anim:load("SE PROVI AD ATTIVARE UNA CARTA\n REAZIONE SENZA AVERE IL MANA NECESSARIO\n ESSA VERRA' SACRIFICATA (+1 MANA)",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0) --💬
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 35 then
			text_anim:load("IN BASE AL MOUSE SI POSSONO\n USARE DIVERSI POTERI",
				tutorial.bar.x*1.1, tutorial.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0) --💬
			Timer.after(3, function() --⏱️
				love.mouse.setCursor(Cursor.TelecinesiLibero)
			end)
			Timer.after(3.6, function() --⏱️
				love.mouse.setCursor(Cursor.TelecinesiPreso)
			end)
			Timer.after(4.2, function() --⏱️
				love.mouse.setCursor(Cursor.Bread)
			end)
			Timer.after(4.8, function() --⏱️
				love.mouse.setCursor(Cursor.Potenziare)
			end)
			Timer.after(5.4, function() --⏱️
				love.mouse.setCursor(Cursor.DePotenziare)
			end)
			Timer.after(6, function() --⏱️
				love.mouse.setCursor(Cursor.Evocare)
			end)
			Timer.after(6.6, function() --⏱️
				love.mouse.setCursor(Cursor.INGEGNERE_DEI_MEMES)
			end)
			Timer.after(7.2, function() --⏱️
				love.mouse.setCursor(Cursor.Explosion)
			end)
			Timer.after(7.8, function() --⏱️
				love.mouse.setCursor(Cursor.Rubare)
			end)
			Timer.after(8.4, function() --⏱️
				love.mouse.setCursor(Cursor.Switch)
			end)
			Timer.after(9, function() --⏱️
				love.mouse.setCursor(Cursor.Annulla)
			end)
			Timer.after(9.6, function() --⏱️
				love.mouse.setCursor(Cursor.Stella)
			end)
			Timer.after(10.2, function() --⏱️
				love.mouse.setCursor(Cursor.Aculeo)
			end)
			Timer.after(10.8, function() --⏱️
				love.mouse.setCursor(Cursor.Laser)
			end)
			Timer.after(11.4, function() --⏱️
				love.mouse.setCursor(Cursor.Urlo)
			end)
			Timer.after(12, function() --⏱️
				love.mouse.setCursor(Cursor.Smith)
			end)
			Timer.after(12.6, function() --⏱️
				love.mouse.setCursor(Cursor.Cuore)
			end)
			Timer.after(13.2, function() --⏱️
				love.mouse.setCursor(Cursor.Immunnizzare)
			end)
			Timer.after(13.8, function() --⏱️
				love.mouse.setCursor(Cursor.Uccidere)
			end)
			Timer.after(14.4, function() --⏱️
				love.mouse.setCursor(Cursor.arrow)
			end)
			tutorial.step = tutorial.step+1
		elseif tutorial.step == 37 then
			text_anim:load("PER PROBLEMI DI CONNESSIONE CONSULTARE\n CONSULTARE IL TUTORIAL APPOSITO",
				tutorial.bar.x*1.1, tutorial.bar.y*1.4,	0.2, 0.2,		0.05, 0, 0) --💬
			tutorial.step = tutorial.step+1

		elseif tutorial.step == 39 then
			tutorial.bool = false
			tutorial.no_cambia_turno = false
			tutorial.no_sacrifici = false
			tutorial.no_posizionamenti = false
			Timer.after(2, function() --⏱️
				love.load()
				music.inGame:stop()
			end)
		end
	end
end