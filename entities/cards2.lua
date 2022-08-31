Card2 = {}
CimiteroCards = {}
inCampoCards2 = {}
Card2.__index = Card2

function loadAssets2()
	TOPimg2 = love.graphics.newImage("assets/cards/cardfont/TOP.png")
	BOTimg2 = love.graphics.newImage("assets/cards/cardfont/BOT.png")
	MALTOPimg2 = love.graphics.newImage("assets/cards/cardfont/MALTOP.png")
	MALBOTimg2 = love.graphics.newImage("assets/cards/cardfont/MALBOT.png")
	img12 = love.graphics.newImage("assets/cards/cardimg/cardimg1.png")
	ATKimg2 = love.graphics.newImage("assets/cards/cardfont/ATKimg.png")
	HPimg2 = love.graphics.newImage("assets/cards/cardfont/HPimg.png")
	STORDITOimg2 = love.graphics.newImage("assets/cards/cardfont/STORDITOimg.png")
	VELENOimg2 = love.graphics.newImage("assets/cards/cardfont/VELENOimg.png")
	ANNULLATOimg2 = love.graphics.newImage("assets/cards/cardfont/ANNULLATOimg.png")
	backimg2 = gui.deck.img
end

function Card2:update(dt)
	checkHoverPosizionato2()
	
	for c,card2 in ipairs(inCampoCards2) do
 		if card2.y >= 325 and card2.y <= 345 then
	        card2.y = 161
		elseif card2.y >= 505 and card2.y <= 525 then
	    	card2.y = 0
		end
	end
end


function checkHoverPosizionato2()
	for c, card2 in ipairs(inCampoCards2) do
		if card2.posizionato == true and general:aabb(card2.x, card2.y, card2.width/2, card2.height/2, mouse.x, mouse.y, 1, 1) then
			card2.hoverposizionato2 = true
		else
			card2.hoverposizionato2 = false
		end
	end
end

function draw2(card2)																								--✏️
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))												--🎨

--carte posizionate
	if card2.posizionato then
	-- posizionate 
		--cornice Personaggio/Maledizione
		
		DRAW_CARD_STATS2(card2,card2.x,card2.y,1/2,1/2,0,0,
			card2.x,card2.y,
			4,0.61,
			7,card2.y + 3*card2.height/8,
			4,2)	
		

			--se in attacco
		if card2.attacco then
			love.graphics.draw(ATKimg,card2.x , card2.y, card2.r, 1/2, 1/2)
		end
			--se attaccata
		if card2.attaccata then
			love.graphics.draw(HPimg,card2.x , card2.y, card2.r)
		end

		if card2.stato.STORDITO then
			love.graphics.draw(STORDITOimg,card2.x , card2.y, card2.r)
		end

		if card2.stato.AVVELENATO then
			love.graphics.draw(VELENOimg,card2.x , card2.y, card2.r)
		end

		if card2.puoabilita2 == false then
			love.graphics.draw(ANNULLATOimg,card2.x , card2.y, card2.r)
		end
	end
end

function LOAD_CARDS2()
	loadAssets2()
end

function UPDATE_CARDS2(dt)
	Card2:update(dt)
end

function DRAW_CARDS2()																									--✏️
	for c, card in ipairs(CimiteroCards) do
		love.graphics.draw(love.graphics.newImage("assets/cards/cardimg/cardimg"..card.id..".png"), card.x, card.y, card.r, 1/2, 1/2, 0, 0)
		love.graphics.setColor(love.math.colorFromBytes(card.color.r,card.color.g,card.color.b,255))
		if card.Personaggio then
			love.graphics.draw(TOPimg2, card.x, card.y, card.r)
			love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
			love.graphics.draw(BOTimg2, card.x, card.y, card.r)
		else
			love.graphics.draw(MALTOPimg2, card.x, card.y-10, card.r)
			love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))														--🎨
			love.graphics.draw(MALBOTimg2, card.x, card.y-10, card.r)
		end
    end

    for c2, card2 in ipairs(inCampoCards2) do
    	draw2(card2)
    end
end

function DRAW_CARD_STATS2(card2,a,b,c,d,e,f,g,h,i,j,k,l,m,n)
	loadAssets2()					
	love.graphics.draw(love.graphics.newImage("assets/cards/cardimg/cardimg"..card2.id..".png"), a, b, card2.r, c, d, e, f)
	love.graphics.setColor(love.math.colorFromBytes(card2.color.r,card2.color.g,card2.color.b,255))
	
	if card2.Personaggio then
		love.graphics.draw(TOPimg2, g, h, card2.r)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
		love.graphics.draw(BOTimg2, g, h, card2.r)
	else
		love.graphics.draw(MALTOPimg2, g, h-10, card2.r)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))														--🎨
		love.graphics.draw(MALBOTimg2, g, h-10, card2.r)
	end
		--Scritte-font
	love.graphics.setFont(Font.cardName)
			--NAME
		CARDstats.Name.font = love.graphics.getFont()
		CARDstats.Name.Width = CARDstats.Name.font:getWidth(card2.Name)
		CARDstats.Name.Height = CARDstats.Name.font:getHeight()/4
		if CARDstats.Name.Width > 266 then
			CARDstats.Name.scale = card2.scale/2
		else
			CARDstats.Name.scale = card2.scale
		end
			--ATK
		CARDstats.ATK.font = love.graphics.getFont()
		CARDstats.ATK.Width = CARDstats.ATK.font:getWidth(card2.ATK)
		CARDstats.ATK.Height = CARDstats.ATK.font:getHeight()/4
		if CARDstats.ATK.Width > 90 then
			CARDstats.ATK.Width = 90
		end
			--Mana
		CARDstats.Mana.font = love.graphics.getFont()
		CARDstats.Mana.Width = CARDstats.ATK.font:getWidth(card2.ATK)
		CARDstats.Mana.Height = CARDstats.ATK.font:getHeight()/4
		if CARDstats.Mana.Width > 90 then
			CARDstats.Mana.Width = 90
		end
			--HP
		CARDstats.HP.font = love.graphics.getFont()
		CARDstats.HP.Width = CARDstats.HP.font:getWidth(card2.HP)
		CARDstats.HP.Height = CARDstats.HP.font:getHeight()/4
		if CARDstats.HP.Width > 90 then
			CARDstats.HP.Width = 90
		end
	
	if card2.Personaggio then --Personaggi
			--ATK
		love.graphics.setColor(love.math.colorFromBytes(100,100,100,220))
		love.graphics.rectangle("fill",card2.x + 3*card2.width/(11*k) , l-2.5, CARDstats.ATK.Width,CARDstats.ATK.Height)
		love.graphics.setColor(love.math.colorFromBytes(200,200,200,255))
		love.graphics.print(card2.ATK,card2.x + 3*card2.width/(11*k) ,l, card2.r, 1/4, 1/4)
			--Mana
		love.graphics.setColor(love.math.colorFromBytes(250,250,250,255))
		love.graphics.draw(Pingimg, card2.x+30+card2.width/m, card2.y-170+card2.height/n, card2.r, 1/40, 1/40)
		love.graphics.print(card2.Mana, card2.x+48+card2.width/m, card2.y-156+card2.height/n, card2.r, 1/3, 1/3, CARDstats.Mana.Width/3, CARDstats.Mana.Height*1.5)
			--HP
		love.graphics.setColor(love.math.colorFromBytes(100,100,100,220))
		love.graphics.rectangle("fill", 25+card2.x + 3*card2.width/(11*k) , 22.5+l, CARDstats.HP.Width,CARDstats.HP.Height)
		love.graphics.setColor(love.math.colorFromBytes(200,200,200,255))
		love.graphics.print(card2.HP, 25+card2.x + 3*card2.width/(11*k) , 25+l, card2.r, 1/4, 1/4)
	else 		-- Maledizioni
			--Mana
		love.graphics.setColor(love.math.colorFromBytes(250,250,250,255))
		love.graphics.print(card2.Mana, card2.x+card2.width/m, card2.y+card2.height/n, card2.r, 1/3, 1/3, CARDstats.Mana.Width/3, CARDstats.Mana.Height*1.5)
	end
		--Name
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
	love.graphics.print(card2.Name,card2.x + card2.width/i, (card2.y + ((7*j)*card2.height/11)), card2.r, CARDstats.Name.scale* card2.scaleMod/3,card2.scale/3, CARDstats.Name.Width/2, card2.height / 4)
end
