player = {}
playerimg = love.graphics.newImage("assets/player/frame.png")
local HAI_PERSO = love.graphics.newImage("assets/HAI_PERSO-VINTO/HAI_PERSO"..love.math.random(1,5)..".png")
local dead

function player:load() --💾
	--player.img = love.graphics.newImage("assets/ehp/frame.png")
	player.width = playerimg:getWidth()
	player.height = playerimg:getHeight()
	player.x = (window.width)/2 + 450
	player.y = ((window.height/2)-100) + 100
	player.attaccata = false
	player.puopassare = false

	player.maxHP = 100000
	player.HP = player.maxHP
	player.MANA = 2
	
	player.scale = 2
end

function player:update(dt) --🔁
	if (player.HP <= 0) and not ((hoster and (testo[1] == "ping" or testo[1] == "Ping" or testo[1] == "PING")) or (connesso and (testo[2] == "ping" or testo[2] == "Ping" or testo[2] == "PING"))) then
		dead = true
	end
end

function player:draw() --✏️
		--Barra Vita
	love.graphics.draw(playerimg,player.x,player.y)
		--Nome
	love.graphics.setColor(1,1,1,1) --🎨
	love.graphics.setFont(font.RamonaBold)
	if hoster then
		love.graphics.print(testo[1],player.x,player.y-37, 0, .5, .5)
	elseif connesso then
		love.graphics.print(testo[2],player.x,player.y-37, 0, .5, .5)
	end
		--Punti vita
	love.graphics.print(player.HP ..  " / "  .. player.maxHP,player.x,player.y+25, 0, .3, .3)
		--Barra colorata
	love.graphics.setColor(love.math.colorFromBytes(150/(player.HP/player.maxHP),155*(3*player.HP/player.maxHP),5))			--🎨
	love.graphics.rectangle("fill",player.x , player.y,player.width*player.HP/player.maxHP,player.height)
		--MANA
	love.graphics.setColor(love.math.colorFromBytes(245,55,55))														--🎨
	love.graphics.setFont(font.horror)
	love.graphics.print(player.MANA, sacrifici.x+sacrifici.width/3, sacrifici.y+sacrifici.height/4, 0, 2,2)

	if dead then
		love.graphics.setColor(1,1,1)
		love.graphics.draw(HAI_PERSO, 0, -30,0, window.width/(HAI_PERSO:getWidth()),1.03*window.height/(HAI_PERSO:getHeight()))
	end
end

function player:mousepressed(x, y, button) --🖱️
	if button == 1 then
		for c,card in ipairs(inManoCards) do
			if general:aabb(card.x,card.y,card.width,card.height,mouse.x,mouse.y,1,1) then
				card.selezionata = true
			end
		end
	end
end

function player:mousereleased(x, y, button) --🖱️
	for c,card in ipairs(inManoCards) do
		for i,camp in ipairs(campi) do
	    	for u,campo in ipairs(camp) do
	    		if campo.hotcampo and card.selezionata and giocatore == 1 and not SHOP and (player.puopassare or connesso or ToolBox) then
	    			if ((i == 1 and card.utente) or (i == 3 and not card.utente)) and not(tutorial.no_posizionamenti) then
						card.x = campo.x 
						card.y = campo.y
						table.insert(inCampoCards,card)
						table.remove(inManoCards,c)
						campo.hotcampo = false
						campo.puohotcampo = false
						abilita:activeAbilitySummon(card)
						cards:moveCards(card.num)
					elseif (i == 6) and not tutorial.no_sacrifici then
						card.x = campo.x
						card.y = campo.y
						card.morta = true
						table.remove(inManoCards,c)
						if card.id == 12 then --Charlie
							player.MANA = player.MANA+4
						elseif card then
							player.MANA = player.MANA+1
						end
						cards:moveCards(card.num)
					elseif ((i == 4 and card.utente) or (i == 2 and not card.utente)) and Toolbox then
						card.x = campo.x 
						card.y = campo.y
						table.insert(inCampoCards2,card)
						table.remove(inManoCards,c)
						campo.hotcampo = false
						campo.puohotcampo = false
						abilita:activeAbilitySummon(card)
						cards:moveCards(card.num)
					end
				end
			end
		end
	end
end