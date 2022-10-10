hamachi = {}

function hamachi:load()

	hamachi.bool = true

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

	self.link = {web,youtube}

	self.link.web = {
		img = love.graphics.newImage("assets/menu/tutorials/web.png"),
		x = menu.hamachi.x,
		y = menu.hamachi.y + menu.hamachi.height + 10
	}
	self.link.web.width = self.link.web.img:getWidth()
	self.link.web.height = self.link.web.img:getHeight()

	self.link.youtube = {
		img = love.graphics.newImage("assets/menu/tutorials/youtube.png"),
		x = self.link.web.x + self.link.web.width + 10,
		y = self.link.web.y
	}
	self.link.youtube.width = self.link.youtube.img:getWidth()
	self.link.youtube.height = self.link.youtube.img:getHeight()

	self.app = {}

	self.app.icona = {
		img = love.graphics.newImage("assets/menu/tutorials/hamachi_icona.png"),
		x = 800,
		y = 100
	}
	self.app.icona.width = self.app.icona.img:getWidth()
	self.app.icona.height = self.app.icona.img:getHeight()

	self.app.finestra = {
		bool = {},
		img = {1,2,3,4,5,6},
		width = {},
		height = {},
		x = {},
		y = {}
	}
	for i,img in ipairs(self.app.finestra.img) do
		self.app.finestra.img[i] = love.graphics.newImage("assets/menu/tutorials/hamachi_finestra"..i..".png")
		self.app.finestra.width[i] = self.app.finestra.img[i]:getWidth()
		self.app.finestra.height[i] = self.app.finestra.img[i]:getHeight()	
	end

	self.app.finestra.x[1] = window.width*0.5
	self.app.finestra.y[1] = window.height*0.6
	self.app.finestra.x[2] = window.width*0.6
	self.app.finestra.y[2] = window.height*0.7
	self.app.finestra.x[3] = window.width*0.5
	self.app.finestra.y[3] = window.height*0.6
	self.app.finestra.x[4] = window.width*0.8
	self.app.finestra.y[4] = window.height*0.7
	self.app.finestra.x[5] = window.width*0.5
	self.app.finestra.y[5] = window.height*0.6
	self.app.finestra.x[6] = window.width*0.7
	self.app.finestra.y[6] = window.height*0.7

	self.arrow = {
		img = love.graphics.newImage("assets/menu/tutorials/arrow.png"),
		bool = false,
		bool2 = false,
	}
	self.arrow.width = self.arrow.img:getWidth()
	self.arrow.height = self.arrow.img:getHeight()

	--steps per il tutorial
	self.step = 1
	Timer.after(2.5, function() --⏱️
		self.arrow.bool = true
	end)
end

function hamachi:mousepressed(x, y, button) --🖱️
	if hamachi.bool then
			--vari steps del tutorial
		if button == 1 and general:aabb(self.next.x, self.next.y, self.next.width, self.next.height, mouse.x, mouse.y, 1, 1) then
			self.step = self.step+1
		end

		if self.step == 2 then
			text_anim:load(--(testo,		x,				y,			scalax,	scalay,		sec_per_lettera,sec_passati,lettera_corrente)
	"BENVENUTO NEL TUTORIAL DI PING",	self.bar.x*1.1, self.bar.y*1.7,		0.5, 0.5, 		0.1, 0, 0)
			Timer.after(2.5, function() --⏱️
				self.arrow.bool = false
			end)
			self.step = self.step+1

		elseif self.step == 4 then
			text_anim:load("SE HAI PREMUTO QUEL PULSANTE SIGNIFICA\n CHE NON SAI COME CONNETTERE 2 GIOCATORI", self.bar.x*1.1, self.bar.y*1.3,	0.4, 0.4,		0.06, 0, 0)
			self.step = self.step+1

		elseif self.step == 6 then
			text_anim:load("PER PRIMA COSA NECESSITI DI INSTALLARE\n HAMACHI                   (CLICCA SULL'ICONA)", self.bar.x*1.1, self.bar.y*1.4,	0.4, 0.4,		0.07, 0, 0)
			Timer.after(4, function() --⏱️
				self.link.web.bool = true
			end)
			self.step = self.step+1

		elseif self.step == 8 then
			text_anim:load("SU INTERNET CI SONO UN SACCO DI TUTORIALS\n SU COME FAR FUNZIONARE PERFETTAMENTE HAMACHI\n                       (AD ESEMPIO QUESTO)", self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.06, 0, 0)
			Timer.after(7.5, function() --⏱️
				self.link.youtube.bool = true
			end)
			self.step = self.step+1

		elseif self.step == 10 then
			text_anim:load("UNA VOLTA INSTALLATO HAMACHI BASTERA'\n CLICCARE SULL ICONA      PER ACCENDERLO", self.bar.x*1.1, self.bar.y*1.3,	0.4, 0.4,		0.07, 0, 0)
			Timer.after(1, function() --⏱️
				self.app.finestra.bool[1] = true
			end)
			Timer.after(3, function() --⏱️
				self.app.finestra.bool[2] = true
			end)
			Timer.after(4.2, function() --⏱️
				self.app.icona.bool = true
			end)
			self.step = self.step+1

		elseif self.step == 12 then
			text_anim:load("LA FINESTRA CONTIENE L'IP\n DELLA LAN FITTIZZIA", self.bar.x*1.1, self.bar.y*1.4,	0.35, 0.35,		0.07, 0, 0)
			Timer.after(4.2, function() --⏱️
				self.app.icona.bool = false
			end)
			self.step = self.step+1

		elseif self.step == 14 then
			text_anim:load("UN GIOCATORE DOVRA' CREARE UNA STANZA\n CON RELATIVO IP RETE E PASSWORD", self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
			Timer.after(1, function() --⏱️
				self.app.finestra.bool[3] = true
			end)
			Timer.after(3, function() --⏱️
				self.app.finestra.bool[4] = true
			end)
			self.step = self.step+1

		elseif self.step == 16 then
			text_anim:load("L'ALTRO DOVRA' ENTRARE IN QUELLA STANZA\n INSERNEDO LO STESSO IP RETE E PASSWORD", self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
			Timer.after(1, function() --⏱️
				self.app.finestra.bool[5] = true
			end)
			Timer.after(3, function() --⏱️
				self.app.finestra.bool[6] = true
			end)
			self.step = self.step+1

		elseif self.step == 18 then
			text_anim:load("UNA VOLTA FATTO QUESTO IL CREATORE DELLA STANZA\n DOVRA' DIRE IL SUO IP LAN FITTIZZIO\n (SCRITTO SOTTO LA CENSURA) ALL'ALTRO GIOCATORE", self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
			self.step = self.step+1

		elseif self.step == 20 then
			text_anim:load("APERTO IL GIOCO BASTERA' CHE IL CREATORE DELLA STANZA\n CLICCHI SU [HOST IP] ED INSERISCA IL SUO IP MENTRE L'ALTRO\n GIOCATORE DEVE METTERLO SU [CLIENT IP]\n (CONFERMA CON INVIO)", self.bar.x*1.1, self.bar.y*1.3,	0.25, 0.25,		0.069, 0, 0)
			Timer.after(1, function() --⏱️
				self.arrow.bool = true
			end)
			self.step = self.step+1
		elseif self.step == 22 then
			text_anim:load("IL CODICE IP LAN E' SIMILE A QUALCOSA COME\n 69.69.69.69", self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
			self.step = self.step+1

		elseif self.step == 24 then
			text_anim:load("PER INIZIARE A GIOCARE BASTA CLICCARE CON TASTO\n SX SU [HOST] SE SI E' IL CREATORE DELLA STANZA\n  O [CLIENT] SE SI E' L'ALTRO GIOCATORE", self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
			Timer.after(1, function() --⏱️
				self.arrow.bool2 = true
			end)
			self.step = self.step+1

		elseif self.step == 26 then
			text_anim:load("MAC NON SUPPORTA HAMACHI MA E' POSSIBILE\n GIOCARE IN LOCALE APRENDO 2 FINESTRE\n (UNA PER GIOCATORE) SENZA INSERIRE NESSUN IP", self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.069, 0, 0)
			Timer.after(1, function() --⏱️
				self.arrow.bool2 = true
			end)
			self.step = self.step+1

		elseif self.step == 28 then
			text_anim:load("SE SI CLICCA TASTO DX E' POSSIBILE CAMBIARE NOME\n (INVIO PER CONFERMARE)", self.bar.x*1.1, self.bar.y*1.7,	0.33, 0.33,		0.069, 0, 0)
			self.step = self.step+1

		elseif self.step == 30 then
			text_anim:load("PER QUALUNQUE COSA CONTATTATE\n U/CRING3_CRIMSON\n ALIAS PING SU DISCORD", self.bar.x*1.1, self.bar.y*1.3,	0.33, 0.33,		0.08, 0, 0)
			self.step = self.step+1

		elseif self.step == 32 then
			self.bool = false
			self.link.web.bool = false
			self.link.youtube.bool = false
			music.menu:pause()
			love.load()
		end

		if self.link.web.bool and general:aabb(self.link.web.x, self.link.web.y, self.link.web.width, self.link.web.height, mouse.x, mouse.y, 1, 1) then
			love.system.openURL("https://www.vpn.net/")
		elseif self.link.youtube.bool and general:aabb(self.link.youtube.x, self.link.youtube.y, self.link.youtube.width, self.link.youtube.height, mouse.x, mouse.y, 1, 1) then
			love.system.openURL("https://youtu.be/rJITMZD9p6M")
		end
	end
end

function hamachi:update(dt) --🔁
	if hamachi.bool then
		if (self.app.finestra.bool[1] or self.app.finestra.bool[2]) and self.step > 14 then
			self.app.finestra.bool[1] = false
			self.app.finestra.bool[2] = false
		elseif (self.app.finestra.bool[3] or self.app.finestra.bool[4]) and self.step > 16 then
			self.app.finestra.bool[3] = false
			self.app.finestra.bool[4] = false
		elseif (self.app.finestra.bool[5] or self.app.finestra.bool[6]) and self.step > 18 then
			self.app.finestra.bool[5] = false
			self.app.finestra.bool[6] = false
		end
	end
end

function hamachi:draw() --✏️
	if hamachi.bool then
		love.graphics.setFont(Font.pixel)
		--barra di testo
		if self.step >=2 then
			love.graphics.draw(self.bar.img, self.bar.x, self.next.y, 0, 0.56, 1)
		love.graphics.setColor(love.math.colorFromBytes(162,80,12))		--🎨
			text_anim:draw()
		end
		--tasto NEXT
		love.graphics.setColor(1,1,1)										--🎨
		love.graphics.draw(self.next.img, self.next.x, self.next.y)
		love.graphics.setColor(love.math.colorFromBytes(162,80,12))		--🎨
		if self.step == 31 then
			love.graphics.print("END", self.next.x+25, self.next.y+35, 0, 0.53, 0.52)
		else
			love.graphics.print("NEXT", self.next.x+25, self.next.y+35, 0, 0.53, 0.52)
		end
		--clicca qui per andare avanti col tutorial
			love.graphics.setFont(Font.cardName)
			love.graphics.setColor(love.math.colorFromBytes(250,255,255))		--🎨
		if self.step == 1 and self.arrow.bool then
			love.graphics.draw(self.arrow.img, 250, 145, 1, 0.4, 0.4)
			love.graphics.print(
				[[premi qui per andare
				 avanti col tutorial]],
				  350, 500, 0, 0.5, 0.5)
		end
		--freccie
		if self.step == 21 and self.arrow.bool then
			love.graphics.draw(self.arrow.img, menu.hostIP.x, menu.hostIP.y+menu.hostIP.height*0.9, math.pi, 0.4, 0.4)
			love.graphics.draw(self.arrow.img, menu.clientIP.x, menu.clientIP.y+menu.clientIP.height*0.9, math.pi, 0.4, 0.4)
		elseif self.step == 25 and self.arrow.bool2 then
			love.graphics.draw(self.arrow.img, menu.player1.x+menu.player1.width, menu.player1.y, 0, 0.4, 0.4)
			love.graphics.draw(self.arrow.img, menu.player2.x+menu.player2.width, menu.player2.y, 0, 0.4, 0.4)
		end
		if self.link.web.bool then
			love.graphics.draw(self.link.web.img, self.link.web.x, self.link.web.y)
		end
		if self.link.youtube.bool then
			love.graphics.draw(self.link.youtube.img, self.link.youtube.x, self.link.youtube.y)
		end
		if self.app.icona.bool and self.step == 11 then
			love.graphics.draw(self.app.icona.img, self.app.icona.x, self.app.icona.y)
		end
		for i,img in ipairs(self.app.finestra.img) do
			if self.app.finestra.bool[i] then
				love.graphics.draw(self.app.finestra.img[i], self.app.finestra.x[i], self.app.finestra.y[i], 0,1,1, self.app.finestra.width[i]/2, self.app.finestra.height[i]/2)
			end
		end
	end
end