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

	self.previousCard = 18
	self.aiming = false
	self.nextCardFree = false

	self.maxHP = 10000
	self.HP = self.maxHP

	self.Mana = 3

	--local HAI_PERSO = HAI_PERSO
	--HAI_PERSO = love.graphics.newImage("assets/HAI_PERSO-VINTO/HAI_PERSO"..love.math.random(1,5)..".png")
	
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
			if card.hover then
				for u,camp in ipairs(campi) do
    				for l,campo in ipairs(camp) do
						if campo.hotcampo and not card.posizionato then
							if giocatore == 1 then
								if ((u == 1 and card.Utente) or (u == 3 and not card.Utente)) and not(tutorial.no_posizionamenti) then
									card.x = campo.x
									card.y = campo.y
									card.posizionato = true
										--attivare un abilità con evocazione
									Abilita:activeAbilitySummon(card)
									campo.hotcampo = false
									campo.puohotcampo = false
									numeroCarteInMano = numeroCarteInMano - 1
									numCarta = card.number
									MUOVI_CARTA()
									table.insert(inCampoCards,card)
								elseif (u == 6) and not tutorial.no_sacrifici then
									card.x = campo.x-campo_Width/2
									card.y = campo.y-campo_Height/2
									numeroCarteInMano = numeroCarteInMano - 1
									numCarta = card.number --ha risolto? quando sacrifichi una carta devono spostarsi
									tick.delay(function () card.morta = true end , 0.5)
									if card.id == 12 then
										self.Mana = self.Mana+4
									else
										self.Mana = self.Mana+1
									end
									MUOVI_CARTA()
								elseif ToolBox then
									card.x = campo.x
									card.y = campo.y
									card.posizionato = true
										--attivare un abilità con evocazione
									--Abilita:activeAbilitySummon(card)
									campo.hotcampo = false
									campo.puohotcampo = false
									numeroCarteInMano = numeroCarteInMano - 1
									numCarta = card.number
									MUOVI_CARTA()
									table.insert(inCampoCards,card)
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
	if (player.HP <= 0) and not ((hoster and Testo[1] == "ping") or (connesso and Testo[2] == "ping")) then
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
	love.graphics.print(self.HP ..  "I"  .. self.maxHP,self.x,self.y+25, 0, .3, .3)
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