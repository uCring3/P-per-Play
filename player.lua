player = {}

local HAI_PERSO = love.graphics.newImage("assets/HAI_PERSO-VINTO/HAI_PERSO"..love.math.random(1,5)..".png")
local dead

function player:load()
	self.img = love.graphics.newImage("assets/ehp/frame.png")
	self.width = self.img:getWidth()
	self.height = self.img:getHeight()
	self.x = (window.width)/2 + 450
	self.y = ((window.height/2)-100) + 100
	self.attaccata = false
	self.puopassare = false

	self.previousCard = 18
	self.aiming = false
	self.nextCardFree = false

	self.maxHP = 200000
	self.HP = self.maxHP

	self.Mana = 3
	
	self.scale = 2
end


function player:mouseClick(x, y, button)
	if button == 1 then --tasto sx
		mouse.pressed.sx.x, mouse.pressed.sx.y = mouse.x, mouse.y
		player:aim()
	end
	if button == 2 then --tasto dx
		mouse.pressed.dx.x, mouse.pressed.dx.y = mouse.x, mouse.y
		Abilita:useAbility()
		
		for i,card in ipairs(inCampoCards) do
			if  card.abilita == false then
				Card:seleziona()
				player2:seleziona()
			end
		end
	end
end


function player:aim()
	for i,card in ipairs(activeCards) do
		if card.hover == true then
			
			if self.nextCardFree == true then
				self.nextCardFree = false
				self.aiming = true
			else
				self.aiming = true
			end
		end
	end
end

function player:throw()
	if self.aiming == true then
		for c,card in ipairs(activeCards) do
			if card.hover and not card.morta then
				for u,camp in ipairs(campi) do
    				for l,campo in ipairs(camp) do
						if campo.hotcampo and not card.posizionato then
							if (giocatore == 1 or ToolBox) and not SHOP then
								if ((u == 1 and card.Utente) or (u == 3 and not card.Utente)) and not(tutorial.no_posizionamenti) then
									card.x = campo.x
									card.y = campo.y
									card.posizionato = true
									card.img = nil
										--attivare un abilità con evocazione
									Abilita:activeAbilitySummon(card)
									campo.hotcampo = false
									campo.puohotcampo = false
									numeroCarteInMano = numeroCarteInMano - 1
									numCartaLanciata = card.number
									MUOVI_CARTA(card.number)
									table.insert(inCampoCards,card)
								elseif (u == 6) and not tutorial.no_sacrifici then
									card.x = campo.x-campo_Width/2
									card.y = campo.y-campo_Height/2
									numeroCarteInMano = numeroCarteInMano - 1
									numCartaLanciata = card.number 
									card.morta = true
									if card.id == 12 then --Charlie
										self.Mana = self.Mana+4
									elseif card then
										self.Mana = self.Mana+1
									end
									MUOVI_CARTA(card.number)
								elseif (u == 1 or u == 2 or u == 3 or u == 4) and ToolBox then --🧰
									card.x = campo.x
									card.y = campo.y
									card.posizionato = true
									card.img = nil
										--attivare un abilità con evocazione
									Abilita:activeAbilitySummon(card)
									campo.hotcampo = false
									campo.puohotcampo = false
									numeroCarteInMano = numeroCarteInMano - 1
									--numCartaLanciata = card.number
									MUOVI_CARTA(card.number)
									table.insert(inCampoCards2,card)
								end
							end
						end
					end
				end
				player.previousCard = card.id
			end
		end
		self.aiming = false
	end
end


function player:update(dt)
	if (player.HP <= 0) and not ((hoster and (Testo[1] == "ping" or Testo[1] == "Ping" or Testo[1] == "PING")) or (connesso and (Testo[2] == "ping" or Testo[2] == "Ping" or Testo[2] == "PING"))) then
		dead = true
	end
end


function player:draw()																									--✏️
		--Barra Vita
	love.graphics.draw(self.img,self.x,self.y)
		--Nome
	if hoster then
		love.graphics.print(Testo[1],self.x,self.y-35, 0, .5, .5)
	elseif connesso then
		love.graphics.print(Testo[2],self.x,self.y-35, 0, .5, .5)
	end
		--Punti vita
	love.graphics.print(self.HP ..  " / "  .. self.maxHP,self.x,self.y+25, 0, .3, .3)
		--Barra colorata
	love.graphics.setColor(love.math.colorFromBytes(150/(self.HP/self.maxHP),155*(3*self.HP/self.maxHP),5))			--🎨
	love.graphics.rectangle("fill",self.x , self.y,self.width*self.HP/self.maxHP,self.height)
		--Mana
	love.graphics.setColor(love.math.colorFromBytes(245,55,55))														--🎨
	love.graphics.setFont(Font.horror)
	love.graphics.print(self.Mana, sacrifici.x+campo_Width/3, sacrifici.y+campo_Height/4, 0, 2,2)

	if dead then
		love.graphics.setColor(1,1,1)
		love.graphics.draw(HAI_PERSO, 0, -30)
	end
end


function player:scambio_nomi()
	if hoster then
		server:sendToAll("player_name_1-2", Testo[1])
  	elseif connesso then
    	client:send("player_name_2-1", Testo[2])
    end
    general:scambio_dati_player()
end


function LOAD_PLAYER()
	player:load()
end

function UPDATE_PLAYER(dt)
	player:update(dt)
end


function DRAW_PLAYER()
	love.graphics.setColor(1,1,1)																					--🎨
	love.graphics.setFont(Font.cardName)
	player:draw()
end