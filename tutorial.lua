tutorial = {}

function tutorial:load()
	self.bool = true
	self.no_cambia_turno = true
	self.no_sacrifici = true
	self.no_posizionamenti = false
	self.next = {
		img = love.graphics.newImage("assets/menu/tutorials/next.png"),
		x = 50,
		y = 50
	}
	self.next.width = self.next.img:getWidth()
	self.next.height = self.next.img:getHeight()
	self.bar = {
		img = love.graphics.newImage("assets/menu/tutorials/bar.png"),
		x = 300,
		y = 50
	}
	self.bar.width = self.bar.img:getWidth()
	self.bar.height = self.bar.img:getHeight()
	self.arrow = {
		img = love.graphics.newImage("assets/menu/tutorials/arrow.png"),
		bool = false,
		bool2 = false,
		bool3 = false
	}
	self.arrow.width = self.arrow.img:getWidth()
	self.arrow.height = self.arrow.img:getHeight()

	self.mouse = { --da fare
		img0 = love.graphics.newImage("assets/menu/tutorials/Grid213x269.png"),
		img = {},
		x = 0,
		y = 0,
		bool = false,
		bool2 = false,
		bool3 = false
	}
	self.mouse.img[1] = love.graphics.newQuad( 213, 0, 213, 269, self.mouse.img0)
	self.mouse.img[2] = love.graphics.newQuad( 426, 0, 213, 269, self.mouse.img0)
	self.mouse.img[3] = love.graphics.newQuad( 639, 0, 213, 269, self.mouse.img0)
	--steps per il tutorial
	self.step = 1
	tick.delay(function () self.arrow.bool = true end , 2.5)
end

function tutorial:mouseClick(x, y, button)
		--vari steps del tutorial
	if button == 1 and general:aabb(self.next.x, self.next.y, self.next.width, self.next.height, mouse.x, mouse.y, 1, 1) and not(self.step == 15 or self.step == 18 or self.step == 19 or self.step == 20 or self.step == 26)  then
		self.step = self.step+1
	end
	if self.step == 2 then
		LOAD_TEXT_ANIM(
			--(testo,					x,				y,			scalax,	scalay,		sec_per_lettera,sec_passati,lettera_corrente)
[[BENVENUTO NEL TUTORIAL DI PING]],	self.bar.x*1.1, self.bar.y*1.7,		0.5, 0.5, 		0.1, 0, 0)
		tick.delay(function () self.arrow.bool = false end , 2.5)
		self.step = self.step+1
	elseif self.step == 4 then
		LOAD_TEXT_ANIM(
[[PER PRIMA COSA ECCOTI UNA CARTA]], self.bar.x*1.1, self.bar.y*1.7,	0.5, 0.5,		0.07, 0, 0)
		tick.delay(function () 
				--carta di Trill
			table.insert(activeCards, Card:new(screen.width / 2, screen.height - 90, 1,false, 5))
			COLOR_CARDS(activeCards)
		 end , 2)
		self.step = self.step+1
	elseif self.step == 6 then
		LOAD_TEXT_ANIM(
[[QUANDO INIZI UNA PARTITA PUOI
 SCEGLIERNE 30 DA METTERE NEL MAZZO]], self.bar.x*1.1, self.bar.y*1.3,	0.4, 0.4,		0.07, 0, 0)
		self.step = self.step+1
	elseif self.step == 8 then
		LOAD_TEXT_ANIM(
[[(MASSIMO 2 COPIE PER OGNI CARTA)]], self.bar.x*1.1, self.bar.y*1.7,		0.5, 0.5,		0.055, 0, 0)
		self.step = self.step+1
	elseif self.step == 10 then
		LOAD_TEXT_ANIM(
[[E UNA PARTITA INIZIA
 CON 5 CARTE]], self.bar.x*1.1, self.bar.y*1.3,	0.4, 0.4,		0.07, 0, 0)
		self.step = self.step+1
	elseif self.step == 12 then
		LOAD_TEXT_ANIM(
[[GLI UTENTI SI POSIZIONANO NELLA META' ALTA
 E LE REAZIONI NELLA META' BASSA]], self.bar.x*1.1, self.bar.y*1.4,	0.38, 0.4,		0.07, 0, 0)
		self.step = self.step+1
	elseif self.step == 14 then
		LOAD_TEXT_ANIM(
[[PER POSIZIONARE UNA CARTA POSIZIONA IL MOUSE SU
 DI ESSA E TIENI PREMUTO IL TASTO SX,  TRASCINA IL
 MOUSE SULLO SPAZIO APPOSITO E RILASCIA IL MOUSE]], self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
		tick.delay(function () self.mouse.bool = true end , 9)
			:after(function () self.arrow.bool2 = true end , 4)
		self.step = self.step+1
	elseif self.step == 17 then
		LOAD_TEXT_ANIM(
[[PER ATTACCARE UNA CARTA AVVERSARIA
 PREMI TASTO DX SULLA TUA CARTA E
 TASTO DX SU QUELLA AVVERSARIA






C'E' UNA POSSIBILITA' DI DANNO CRITICO (X10)]], self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
		for c,card in ipairs(inCampoCards) do
			card.puoattaccare = true
		end
		activeCards[2] = Card:new(screen.width / 2, screen.height - 90, 1,false, 1)
		COLOR_CARDS(activeCards)
			table.insert(inCampoCards2, activeCards[2])
			table.remove(activeCards, 2)
			inCampoCards2[1].posizionato = true
			inCampoCards2[1].x = 263
			inCampoCards2[1].y = 161
		tick.delay(function () self.mouse.bool2 = true end , 8)
		self.step = self.step+1
	elseif self.step == 19 then
		LOAD_TEXT_ANIM(
[[PER ATTIVARE L'ABILITA' SPECIALE DI
 UNA TUA CARTA USA IL TASTO ROTELLINA
 DEL MOUSE]], self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
		tick.delay(function () self.mouse.bool3 = true end , 8)
		self.step = self.step+1
	elseif self.step == 20 and button == 3 then
		for c,card in ipairs(inCampoCards) do 
			if general:aabb(card.x, card.y, card.width/2, card.height/2, mouse.x, mouse.y, 1, 1) then
				self.step = self.step+1
			end
		end
	elseif self.step == 23 then
		LOAD_TEXT_ANIM(
[[RICORDA CHE L'ATTIVAZIONE DI 
 UNA ABILITA' RICHIEDE MANA
 (INDICATO IN BASSO A DX)]], self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
		self.step = self.step+1
	elseif self.step == 25 then
		LOAD_TEXT_ANIM(
[[PER OTTENERE MANA DEVI SACRIFICARE
 CARTE DALLA TUA MANO (+1 MANA)
> POSIZIONA LA CARTA SULLA ZONA SACRIFICI <]], self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
		self.no_posizionamenti = true
		self.no_sacrifici = false
		tick.delay(function () 
				--carta di Trill
			table.insert(activeCards, Card:new(screen.width / 2, screen.height - 90, 1,false, 23))
			COLOR_CARDS(activeCards)
		 end , 1.6)
			:after(function() self.arrow.bool3 = true end, 9)
		self.step = self.step+1
	elseif self.step == 27 then
		LOAD_TEXT_ANIM(
[[PASSA IL TURNO 
 PREMENDO L'APPOSITO PULSANTE]], self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
		self.no_cambia_turno = false
		self.step = self.step+1
	elseif self.step == 29 then
		LOAD_TEXT_ANIM(
[[OGNI CARTA HA LA SUA ABILITA'
 E CLASSE]], self.bar.x*1.1, self.bar.y*1.4,	0.5, 0.5,		0.069, 0, 0)
		self.step = self.step+1
	elseif self.step == 31 then
		LOAD_TEXT_ANIM(
[[LE CARTE POSSONO ESSERE
   UTENTI  O  REAZIONI   
 E SI DISTINGUONO DALLA LORO CORNICE]], self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
		tick.delay(function () 
				--carta di Ping e #memes
			table.insert(activeCards, Card:new(screen.width / 2, screen.height - 90, 1,false, 2))
			table.insert(activeCards, Card:new(300+screen.width / 2, screen.height - 90, 1,false, 32))
			COLOR_CARDS(activeCards)
		 end , 1.6)
		self.step = self.step+1
	elseif self.step == 33 then
		LOAD_TEXT_ANIM(
[[SE PROVI AD ATTIVARE UNA CARTA
 REAZIONE SENZA AVERE IL MANA NECESSARIO
 ESSA VERRA' SACRIFICATA (+1 MANA)]], self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
		tick.delay(function () 
				--carta di Ping e #memes
			table.insert(activeCards, Card:new(screen.width / 2, screen.height - 90, 1,false, 2))
			table.insert(activeCards, Card:new(300+screen.width / 2, screen.height - 90, 1,false, 32))
			COLOR_CARDS(activeCards)
		 end , 1.6)
		self.step = self.step+1
	elseif self.step == 35 then
		LOAD_TEXT_ANIM(
[[IN BASE AL MOUSE SI POSSONO
 USARE DIVERSI POTERI]], self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
		tick.delay(function() love.mouse.setCursor(Cursor.TelecinesiLibero) end, 3)
			:after(function() love.mouse.setCursor(Cursor.TelecinesiPreso) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Bread) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Potenziare) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.DePotenziare) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Evocare) end, 0.6)	
			:after(function() love.mouse.setCursor(Cursor.INGEGNERE_DEI_MEMES) end, 0.6)	
			:after(function() love.mouse.setCursor(Cursor.Explosion) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Rubare) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Switch) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Annulla) end, 0.6)	
			:after(function() love.mouse.setCursor(Cursor.Stella) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Aculeo) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Laser) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Urlo) end, 0.6)	
			:after(function() love.mouse.setCursor(Cursor.Smith) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Cuore) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Immunnizzare) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.Uccidere) end, 0.6)
			:after(function() love.mouse.setCursor(Cursor.arrow) end, 0.6)
		self.step = self.step+1
	elseif self.step == 37 then
		LOAD_TEXT_ANIM(
[[PER PROBLEMI DI CONNESSIONE CONSULTARE
 CONSULTARE IL TUTORIAL APPOSITO]], self.bar.x*1.1, self.bar.y*1.4,	0.2, 0.2,		0.05, 0, 0)
		self.step = self.step+1

	elseif self.step == 39 then
		self.bool = false
		self.no_cambia_turno = false
		self.no_sacrifici = false
		self.no_posizionamenti = false
		tick.delay(function ()
			love.load()
			music.inGame:stop()
			end , 2)
	end
end


function tutorial:update(dt)
	if self.step == 15 then
		for c,card in ipairs(inCampoCards) do
			self.step = self.step+1
		end
	elseif self.step == 18 then
		for c2,card2 in ipairs(inCampoCards2) do
			if card2.HP < card2.hp then
				self.step = self.step+1
			end
		end
	elseif self.step == 21 then
		LOAD_TEXT_ANIM(
[[(NON PUOI USARE LA TUA ABILITA'
 NEL TURNO IN CUI LA EVOCHI)]], self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
		self.step = self.step+1
	elseif self.step == 26 and player.Mana >= 4 then
		self.step = self.step+1
	elseif self.step == 28 and giocatore == 2 then
		Abilita:cambiaTurno()
		self.step = self.step+1
	end
end

local function UPDATE_MOUSE(dt)
	if tutorial.mouse.bool and tutorial.step == 15 then
		tutorial.mouse.x = tutorial.mouse.x+10*dt
		tutorial.mouse.y = tutorial.mouse.y-50*dt
		if tutorial.mouse.y <= -350 then
			tutorial.mouse.y = 0 
			tutorial.mouse.x = 0
		end
	end
end


function tutorial:draw()							--✏️
	love.graphics.setFont(Font.pixel)
	love.graphics.setColor(love.math.colorFromBytes(255,255,255))
		--barra di testo
	if self.step >=2 then
		love.graphics.draw(self.bar.img, self.bar.x, self.next.y, 0, 0.56, 1)
		love.graphics.setColor(love.math.colorFromBytes(162,80,12))		--🎨
		text_anim:draw()
	end
		--tasto NEXT
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))		--🎨
	love.graphics.draw(self.next.img, self.next.x, self.next.y)
	love.graphics.setColor(love.math.colorFromBytes(162,80,12,255))		--🎨
	if self.step >= 38 then
		love.graphics.print("END", self.next.x+25, self.next.y+35, 0, 0.53, 0.52)
	else
		love.graphics.print("NEXT", self.next.x+25, self.next.y+35, 0, 0.53, 0.52)
	end
		--clicca qui per andare avanti col tutorial
	love.graphics.setFont(Font.cardName)
	love.graphics.setColor(love.math.colorFromBytes(250,255,255,255))		--🎨
	if self.step == 1 and self.arrow.bool then 									--freccia 1
		love.graphics.draw(self.arrow.img, 250, 145, 1, 0.4, 0.4)
		love.graphics.print(
			[[premi qui per andare
			 avanti col tutorial]],
			  350, 500, 0, 0.5, 0.5)
	elseif self.step == 15 and self.arrow.bool2 then 							--freccia 2
		love.graphics.draw(self.arrow.img, window.width*0.25, window.height-175, 0, 0.4, 0.4)
		love.graphics.print(
			[[CARTA]],
			  window.width*0.375, window.height-185, 0, 0.6, 0.6)
		for u,camp in ipairs(campi) do
			for i,campo in ipairs(camp) do
				if u == 1 then
					love.graphics.draw(self.arrow.img, campo.x+campo.width*0.8, campo.y, -math.pi/2, 0.1, 0.1, 0, self.arrow.height/2)
     	   	end
   		end
		end
	elseif self.step == 26 and self.arrow.bool3 then 							--freccia 3
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
	if self.step == 15 and self.mouse.bool then
		for c,card in ipairs(activeCards) do
			love.graphics.draw(self.mouse.img0, self.mouse.img[1], card.x+card.width/2+self.mouse.x, card.y+card.height/2+self.mouse.y, 0, 0.4, 0.4)
		end
	elseif self.step == 18 and self.mouse.bool2 then
		for c,card in ipairs(inCampoCards) do
			if card.puoattaccare and not card.attacco then
				love.graphics.draw(self.mouse.img0, self.mouse.img[2], card.x+card.width/4+self.mouse.x, card.y+card.height/2+self.mouse.y, 0, 0.4, 0.4)
			else
				for c2,card2 in ipairs(inCampoCards2) do
					love.graphics.draw(self.mouse.img0, self.mouse.img[2], card2.x+card2.width/4+self.mouse.x, card2.y+card2.height/2+self.mouse.y, 0, 0.4, 0.4)
				end
			end
		end
	elseif self.step == 20 and self.mouse.bool3 then
		for c,card in ipairs(inCampoCards) do
			love.graphics.draw(self.mouse.img0, self.mouse.img[3], card.x+card.width/4+self.mouse.x, card.y+card.height/2+self.mouse.y, 0, 0.4, 0.4)
		end
	end
end


function LOAD_TUTORIAL()
	tutorial:load()
	LOAD_INGAME() 	--vedi main.lua
	LOAD_CARDS2()
	LOAD_CARDS()
	LOAD_ABILITA()
	player:scambio_nomi()
end


function UPDATE_TUTORIAL(dt)
	if tutorial.bool then
		tutorial:update(dt)
		UPDATE_MOUSE(dt)
	end
end 

function TUTORIAL_MOUSECLICK(x, y, button)
	if tutorial.bool then
		tutorial:mouseClick(x, y, button)
	end
end

function DRAW_TUTORIAL()
	if tutorial.bool then
		tutorial:draw()	
	end
end