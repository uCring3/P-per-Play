Abilita = {}
Abilita.__index = Abilita

local CONO
local SMITH
local AREA
local BEAN
local CUORI
local ACULEI
local STELLE
local LASER
local WALL
local SQUALO
local NOTE
--local SHOP
local evocare_SHOP
local curare = false
local potenziare = false
local ruba = false
local uccidere = false
local annullare = false
local immunizzare = false

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


local function DRAW_AREA()
	love.graphics.circle("line", mouse.x, mouse.y, 200 )
end

local squalo = {img,x,y,width,height,scale,grid,animation}
local function MOVE_SQUALO(dt)
	squalo.x = squalo.x+500*dt
	for c2,card2 in ipairs(inCampoCards2) do
		if general:aabb(card2.x, card2.y, card2.width/2, card2.height/2, squalo.x+squalo.width*squalo.scale/2, squalo.y+squalo.height*squalo.scale/1.5, 1, 1) then 
			danno = attaccante.ATK
			general:danno(card2,attaccante)
		end
	end
end
local function LOAD_SQUALO(card)
	SQUALO = true
	attaccante = card
	squalo.img = love.graphics.newImage("assets/cards/cardfont/squalo374x122.png")
	squalo.x = -2000 
	squalo.y = -180
	squalo.width = squalo.img:getWidth()/2
	squalo.height= squalo.img:getHeight()
	squalo.scale = 5
    squalo.grid = anim8.newGrid(squalo.img:getWidth()/2, squalo.img:getHeight(), squalo.img:getWidth(), squalo.img:getHeight())
    squalo.animation = anim8.newAnimation(squalo.grid('1-2',1), 0.10)
end

local ruota_smith
local smith = {img,width,height,x,y,r,ox,oy}
local function LOAD_SMITH(card)
	SMITH = true
	love.mouse.setCursor(Cursor.Smith)
	ruota_smith = true
	attaccante = card
	smith.x = card.x + card.width/4
	smith.y = card.y + card.height/4
	--smith = {img,width,height,x,y,r,ox,oy}
	smith.img = love.graphics.newImage("assets/cards/cardfont/SMITHimg.png")
	smith.width = smith.img:getWidth()
	smith.height = smith.img:getHeight()
	smith.X = smith.x
	smith.Y = smith.y
	smith.ox = smith.width/2
	smith.oy = smith.height/2
end
local function UPDATE_SMITH()
	flux.to(smith, 1, {x = smith.X, y = smith.Y})
	for c2,card2 in ipairs(inCampoCards2) do
		if general:aabb(card2.x,card2.y, card2.width/2,card2.height/2, smith.x,smith.y, 1, 1) and not card2.abilita then
			card2.stato.avvelenata = true
			for c,card in ipairs(inCampoCards) do
				if (card.id == 8) then --Nabboleone
					card.abilita = false
				end
			end
			general:scambio_dati_carta()
			danno = 300
			general:danno(card2,attaccante)
			SMITH = false
		end
	end
end
local function DRAW_SMITH()
	smith.r = general:getAngle(smith.x, smith.y, mouse.x, mouse.y) +((3.14/2)+0.1)
	if ruota_smith then
		smith.R = smith.r
	end
	love.graphics.draw(smith.img, smith.x,smith.y, smith.R, 1/2,1/2, smith.ox,smith.oy)
end

local laser = {img,width,height,x,y,r,ox,oy,alfa}
local function LOAD_LASER()
	love.mouse.setCursor(Cursor.Laser)
	--laser = {img,width,height,x,y,r,ox,oy,alfa}
	laser.img = love.graphics.newImage("assets/cards/cardfont/LASERimg.png")
	laser.width = laser.img:getWidth()
	laser.height = laser.img:getHeight()
	laser.x = mouse.x
	laser.y = mouse.y
	laser.ox = laser.width/2
	laser.oy = laser.height/2
	laser.alfa = 0
	ruota_laser = true
	LASER_GO = true
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
local function UPDATE_LASER(dt)
	bean.scale.width = 1.5*bean.scale.width+0.5*dt
	for c2,card2 in ipairs(inCampoCards2) do
		if general:calculateDistanceToLine(card2.x+card2.width/4,card2.y+card2.height/4, laser.x,laser.y, mouse.released.dx.x,mouse.released.dx.y) < (bean.height*bean.scale.height) then
			danno = 80
			general:danno(card2,attaccante)
		end
	end
end
local function MOVE_LASER(x, y, button)
	laser.R = laser.r
	ruota_laser = false
	LASER_GO = false
	BEAN = true
	for c,card in ipairs(inCampoCards) do 
		if card.id == 16 then	--Morte Oscura
			card.abilita = false
		end
	end
	mouse.released.dx.x = mouse.x 
	mouse.released.dx.y = mouse.y 
	tick.delay(function() LASER = false end, 1.75)
		:after(function() BEAM = false end, 0)
end
local function DRAW_LASER()
	if ruota_laser then
		laser.r = general:getAngle(laser.x, laser.y, mouse.x, mouse.y) +((3.14/2)+0.5)
		laser.R = laser.r
		bean.r = laser.r -2.07
	end
	laser.alfa = (laser.alfa+0.006)*1.01
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,laser.alfa))
	love.graphics.draw(laser.img, laser.x,laser.y, laser.R, 2,2, laser.ox,laser.oy)
	love.graphics.setColor(1,1,1,1)
	if BEAN then
		love.graphics.draw(bean.img, laser.x,laser.y, bean.r, bean.scale.width,bean.scale.height, (-100)/bean.scale.width,bean.oy, 0,0)
	end
end

local ferma_aculei = false
local aculei = {}
local function LOAD_ACULEI(card)
	ACULEI = true
	--card.abilita = false
	card.puoabilita = false
	love.mouse.setCursor(Cursor.Aculeo)
	aculei[1] = {x = love.math.random(0, 140), y = love.math.random(50, 685), r = 0}
	aculei[2] = {x = love.math.random(1140, 1280), y = love.math.random(50, 685), r = 0}
	aculei[3] = {x = love.math.random(0, 140), y = love.math.random(50, 685), r = 0}
	aculei[4] = {x = love.math.random(1140, 1280), y = love.math.random(50, 685), r = 0}
	aculei[5] = {x = love.math.random(0, 140), y = love.math.random(50, 685), r = 0}
	aculei[6] = {x = love.math.random(1140, 1280), y = love.math.random(50, 685), r = 0}
	aculei[7] = {x = love.math.random(0, 140), y = love.math.random(50, 685), r = 0}
	aculei[8] = {x = love.math.random(1140, 1280), y = love.math.random(50, 685), r = 0}
end
local function UPDATE_ACULEI(dt)
	for c2,card2 in ipairs(inCampoCards2) do
		for a,aculeo in ipairs(aculei) do
			if general:aabb(card2.x, card2.y, card2.width/2, card2.height/2, aculeo.x, aculeo.y, 1, 1) then
				card2.stato.avvelenata = true
				for c,card in ipairs(inCampoCards) do
					if card.id == 19 then --Alex
						card.abilita = false
					end
				end
				love.mouse.setCursor(Cursor.arrow)
				general:scambio_dati_carta()
			end
		end
	end
end
local function DRAW_ACULEI(dt)
	for a,aculeo in ipairs(aculei) do
		if not ferma_aculei then
			aculeo.r = general:getAngle(aculeo.x, aculeo.y, mouse.x, mouse.y) -math.pi/2
		end
		aculeo.R = aculeo.r
		general:drawRotatedTriangle("fill", aculeo.x, aculeo.y, 20, 40, aculeo.R)
	end
end

local stelle = {}
local stella = {x,y,z,r}
local stella_img = {img, width, height}
local stelle_ruota = false
local stella_X
local stella_Y
local function MOVE_STELLE()
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
local function LOAD_STELLE()
	STELLE = true
	love.mouse.setCursor(Cursor.Stella)
	stella_img.img = love.graphics.newImage("assets/cards/cardfont/STELLAimg.png")
	stella_img.width = stella_img.img:getWidth()
	stella_img.height = stella_img.img:getHeight()
	for s, stella in ipairs(stelle) do
		stella.z = true
	end

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
		:after(function() MOVE_STELLE(dt) end , 0.9)
		:after(function() stelle_ruota = true end , 0.1)
		:after(function() love.mouse.setCursor(Cursor.arrow) end , 8)
		:after(function() STELLE = false
			stelle = {}
			stelle_ruota = false end, 0)
end
local function UPDATE_STELLE(dt)
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
local function DRAW_STELLE()
	for s, stella in ipairs(stelle) do
		love.graphics.draw(stella_img.img, stella.x,stella.y, stella.r, 0.9,0.9, stella_img.width/2,stella_img.height/2)
	end
end

local cuori = {}
local cuore = {x,y,z,r}
local cuore_img = {img, width, height}
local cuori_ruota = false
local cuore_X
local cuore_Y

local function MOVE_CUORI()
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
local function LOAD_CUORI()
	love.mouse.setCursor(Cursor.Cuore)
	cuore_img.img = love.graphics.newImage("assets/cards/cardfont/CUOREimg.png")
	cuore_img.width = cuore_img.img:getWidth()
	cuore_img.height = cuore_img.img:getHeight()
	for s, cuore in ipairs(cuori) do
		cuore.z = true
	end

	CUORI = true
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
		:after(function() MOVE_CUORI(dt) end , 0.9)
		:after(function() cuori_ruota = true end , 0.1)
		:after(function() love.mouse.setCursor(Cursor.arrow) end , 6)
		:after(function() CUORI = false
			cuori = {}
			cuori_ruota = false end, 0)
end
local function UPDATE_CUORI(dt)
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
local function DRAW_CUORI()
	for cu, cuore in ipairs(cuori) do
		love.graphics.draw(cuore_img.img, cuore.x,cuore.y, cuore.r, 0.9,0.9, cuore_img.width/2,cuore_img.height/2)
	end
end


local cono = {sxa,sya,dxa,dya,sxb,syb,dxb,dyb}
local function LOAD_CONO(card)
	love.mouse.setCursor(Cursor.Urlo)
	CONO = true
	cono.sxb = card.x
	cono.syb = card.y + card.height/4
	cono.dxb = card.x + card.width/2
	cono.dyb = card.y + card.height/4
	cono.cxb = card.x + card.height/8
	cono.cyb = card.y + card.height/4
end
local function UPDATE_CONO()
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
local function DRAW_CONO()
	love.graphics.polygon("line", cono.dxa,cono.dya, cono.sxa,cono.sya, cono.sxb,cono.syb, cono.dxb,cono.dyb)
end

local function UPDATE_LA_PRIMA_REPUBBLICA()
	for p,pe in ipairs(PEPONE.PE) do
		for p,po in ipairs(PEPONE.PO) do
			for p,ne in ipairs(PEPONE.NE) do
				PEPONE.bool = true
				love.mouse.setCursor(Cursor.Evocare)
			end
		end
	end
end

local function elimina_cloni()
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

local COMMISSIONE_NON_PAGATA_RADIUS
local COMMISSIONE_NON_PAGATA_ALPHA
local inCampoAria = {}
local function LOAD_COMMISSIONE_NON_PAGATA(card)
	attaccante = card
	COMMISSIONE_NON_PAGATA = true
	COMMISSIONE_NON_PAGATA_RADIUS = 10
	COMMISSIONE_NON_PAGATA_ALPHA = 255
	for c,card in ipairs(inCampoCards) do
		tick.delay(function () COMMISSIONE_NON_PAGATA = false end , 5)
			:after(function () card.abilita = false end , 0)
			:after(function () card.attacco = false end , 0)
	end
	inCampoAria = {}
	for c1,card1 in ipairs(inCampoCards) do
		if card1.id == 11 then --Aria
			table.insert(inCampoAria,card) --Combo di Aria
			danno = card.ATK*(#inCampoAria) 	--Danno Combo di Aria
			card1.puoabilita = false
			card1.attacco = true
		end
	end
end
local function UPDATE_COMMISSIONE_NON_PAGATA(dt)
	if COMMISSIONE_NON_PAGATA then
		COMMISSIONE_NON_PAGATA_RADIUS = (1.011*COMMISSIONE_NON_PAGATA_RADIUS+40*dt)
		COMMISSIONE_NON_PAGATA_ALPHA = (0.98*COMMISSIONE_NON_PAGATA_ALPHA-0.9999*dt)
	end
end
local function DRAW_COMMISSIONE_NON_PAGATA()
	love.graphics.setColor(love.math.colorFromBytes(7, 0, 135,COMMISSIONE_NON_PAGATA_ALPHA))
	love.graphics.circle("fill", mouse.pressed.rot.x, mouse.pressed.rot.y, COMMISSIONE_NON_PAGATA_RADIUS )
end


local osu = {x={1,2,3,4,5,6,7,8},y={1,2,3,4,5,6,7,8},bool={[1]=false,[2]=false,[3]=false,[4]=false,[5]=false,[6]=false,[7]=false,[8]=false},min={x,y},max={x,y}}
local osu_img = {img,width,height}
local function LOAD_OSU(card)
	OSU = true

	attaccante = card
	card.puoabilita = false
	osu_img.img = love.graphics.newImage("assets/cards/cardfont/OSUimg.png")
	osu_img.width = osu_img.img:getWidth()
	osu_img.height = osu_img.img:getHeight()

	osu.min.x = window.width*0.15
	osu.max.x = window.width*0.85
	osu.min.y = 45
	osu.max.y = 345

	for o,su in ipairs(osu.x) do
		osu.x[o] = love.math.random(osu.min.x, osu.max.x)
	end
	for o,su in ipairs(osu.y) do
		osu.y[o] = love.math.random(osu.min.y, osu.max.y)
	end

	tick.delay(function() osu.bool[1] = true end, 1)
		:after(function() osu.bool[2] = true end, 0.5)
		:after(function() osu.bool[3] = true end, 0.5)
		:after(function() osu.bool[4] = true end, 0.45)
		:after(function() osu.bool[5] = true end, 0.4)
		:after(function() osu.bool[6] = true end, 0.35)
		:after(function() osu.bool[7] = true end, 0.25)
		:after(function() osu.bool[8] = true end, 0.2)
		:after(function() OSU = false end, 3)
		:after(function() 
			for o,su in ipairs(osu.bool) do 
				osu.bool[o] = false 
			end 
				end, 0)
end
local function DRAW_OSU()
	love.graphics.setFont(Font.cardName)
	love.graphics.setColor(1,1,1)
	for o,su in ipairs(osu.bool) do
		if osu.bool[o] then
			love.graphics.draw(osu_img.img, osu.x[o], osu.y[o], 0, 0.1, 0.1, osu_img.width/2, osu_img.height/2)
			love.graphics.print("GIN", osu.x[o]-((osu_img.width/4)*0.12), osu.y[o]-((osu_img.height/4)*0.07), 0, 0.6, 0.6)
		end
	end
end

local function LOAD_TELECINESI(card)
	TELECINESI = true
	love.mouse.setCursor(Cursor.TelecinesiLibero)
	for c2,card2 in ipairs(inCampoCards2) do
		card2.X = card2.x 
		card2.Y = card2.y 
		if not card2.morta then
			tick.delay(function() flux.to(card2, 1.5, {x = card2.X, y = card2.Y}) end, 7)
			:after(function() TELECINESI = false end, 0)
			:after(function() love.mouse.setCursor(Cursor.arrow) end, 0)
			:after(function() card.abilita = false end, 0)
			:after(function() general:scambio_dati_carta() end, 1.6)
		end
	end	
end
local function MOVE_TELECINESI(x, y, dx, dy)
	for c2,card2 in ipairs(inCampoCards2) do
		if card2.hoverposizionato2 and love.mouse.isDown(2) then
			card2.x = card2.x + dx
			card2.y = card2.y + dy
			if dx > 100 then
				card2.stato.stordito = true
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

local function LOAD_PLYTLAS()
	for c2,card2 in ipairs(inCampoCards2) do
		if ((card2.INFO.classe == "CONTENT CREATOR") or (card2.INFO.classe == "GOLDEN STAFF SEGRETARIO")) then
			piuATK = -500
			general:aumentaATK(card2)
		end
	end
end 

local function LOAD_KYS()
	KYS.bool = true
	KYS.TURNO = turno.n
end
local function UPDATE_KYS()
	if turno.n == KYS.TURNO + 2 then
		for c,card in ipairs(inCampoCards) do
			if card.id == 15 then -- Mostro di Firenze
				card.morta = true
				KYS.bool = false
			end
		end
	end
end


local function LOAD_KYS_ALL()
	KYS_ALL.bool = true
	KYS_ALL.TURNO = turno.n
end
local function UPDATE_KYS_ALL()
	if turno.n == KYS_ALL.TURNO + 3 then
		inCampoCards = {}
		inCampoCards2 = {}
		general:scambio_dati_carta()
		general:scambio_dati_carta_propria()
		for u,camp in ipairs(campi) do
    		for l,campo in ipairs(camp) do
    			campo.hotcampo = false
    			campo.puohotcampo = true
    		end
    	end
		KYS_ALL.bool = false
	end
end

local function LOAD_DIMEZZA_HP()
	for c2,card2 in ipairs(inCampoCards2) do
		card2.HP = card2.HP/2
	end
	general:scambio_dati_carta()
end 

local function LOAD_RADDOPPIA_HP()
	for c,card in ipairs(inCampoCards) do
		card.hp = card.hp*2
		card.HP = card.HP*2
	end
	general:scambio_dati_carta()
end 

function LOAD_MADE_IN_HEAVEN(time)
	Made_in_Heaven.bool = true
	Made_in_Heaven.time = time
end
local function UPDATE_MADE_IN_HEAVEN(dt)
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
local function DRAW_MADE_IN_HEAVEN()
	love.graphics.setFont(Font.combatTextFont)
	love.graphics.print(math.floor(Made_in_Heaven.time), window.width/3+30, 3*window.height/11, 0, 3, 3)
end

local function LOAD_MINION(id)
	table.insert(activeCards, Card:new(0, 0, 1,false, id))
	COLOR_CARDS(activeCards)
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
						campo.puohotcampo = false
						campo.hotcampo = false
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

local function LOAD_CHIUDI()
	if hoster then
		server:sendToAll("CHIUDI_1-2", true)
  	elseif connesso then
    	client:send("CHIUDI_2-1", true)
    end
end

local Wall = {}
local function LOAD_WALL()							--💬
	WALL = true
	FONT_SIZE        = 90
	FONT_LINE_HEIGHT = 1.3

	FIELD_TYPE = "multiwrap" -- Possible values: normal, password, multiwrap, multinowrap
	
	FIELD_OUTER_X      = 0
	FIELD_OUTER_Y      = 0
	FIELD_OUTER_WIDTH  = window.width
	FIELD_OUTER_HEIGHT = window.height
	FIELD_PADDING      = 20

	FIELD_INNER_X      = FIELD_OUTER_X + FIELD_PADDING
	FIELD_INNER_Y      = FIELD_OUTER_Y
	FIELD_INNER_WIDTH  = FIELD_OUTER_WIDTH  - 2*FIELD_PADDING
	FIELD_INNER_HEIGHT = FIELD_OUTER_HEIGHT

	SCROLLBAR_WIDTH = 0
	BLINK_INTERVAL  = 0.90

	theFont = love.graphics.newFont(FONT_SIZE)
	theFont:setLineHeight(FONT_LINE_HEIGHT)

	field = InputField(Testo[5], FIELD_TYPE)
	field:setFont(theFont)
	field:setDimensions(FIELD_INNER_WIDTH, FIELD_INNER_HEIGHT)

	tick.delay(function() 	
		if hoster then
			server:sendToAll("WALL_1-2", bitser.dumps(Wall))
		elseif connesso then
			client:send("WALL_2-1", bitser.dumps(Wall))
		end
		WALL = false
		end, 15)
end
local function DRAW_WALL()

    -- Input field.
    love.graphics.setScissor(FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Background.
    love.graphics.setColor(0, 0, 0, 0.2)
    love.graphics.rectangle("fill", FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Selection.
	love.graphics.setColor(.2, .2, 1)
	for _, selectionX, selectionY, selectionWidth, selectionHeight in field:eachSelection() do
	    love.graphics.rectangle("fill", FIELD_INNER_X+selectionX, FIELD_INNER_Y+selectionY, selectionWidth, selectionHeight)
	end

    -- Text.
	love.graphics.setFont(theFont)
	love.graphics.setColor(1, 1, 1)
	for _, lineText, lineX, lineY in field:eachVisibleLine() do
	    love.graphics.print(lineText, FIELD_INNER_X+lineX, FIELD_INNER_Y+lineY)
	    Wall[_] = lineText
	end

    -- Cursor.
    local cursorWidth = 2
    local cursorX, cursorY, cursorHeight = field:getCursorLayout()
    local alpha = ((field:getBlinkPhase() / BLINK_INTERVAL) % 1 < .5) and 1 or 0
    love.graphics.setColor(1, 1, 1, alpha)
    love.graphics.rectangle("fill", FIELD_INNER_X+cursorX-cursorWidth/2, FIELD_INNER_Y+cursorY, cursorWidth, cursorHeight)

    love.graphics.setScissor()

    -- Scrollbars.
    local horiOffset, horiCoverage, vertOffset, vertCoverage = field:getScrollHandles()

    local horiHandleLength = horiCoverage * FIELD_OUTER_WIDTH
    local vertHandleLength = vertCoverage * FIELD_OUTER_HEIGHT
    local horiHandlePos    = horiOffset   * FIELD_OUTER_WIDTH
    local vertHandlePos    = vertOffset   * FIELD_OUTER_HEIGHT

    -- Handles.
	love.graphics.setColor(.7, .7, .7)
	love.graphics.rectangle("fill", FIELD_OUTER_X+FIELD_OUTER_WIDTH, FIELD_OUTER_Y+vertHandlePos,  SCROLLBAR_WIDTH, vertHandleLength) -- Vertical scrollbar.
	love.graphics.rectangle("fill", FIELD_OUTER_X+horiHandlePos, FIELD_OUTER_Y+FIELD_OUTER_HEIGHT, horiHandleLength, SCROLLBAR_WIDTH) -- Horizontal scrollbar.
end

--local Note = {}
local function LOAD_NOTE()							--💬
	NOTE = true
	FONT_SIZE        = 55
	FONT_LINE_HEIGHT = 1

	FIELD_TYPE = "multiwrap" -- Possible values: normal, password, multiwrap, multinowrap
	
	FIELD_OUTER_X      = (window.width/2)-200
	FIELD_OUTER_Y      = (window.height/2)-250
	FIELD_OUTER_WIDTH  = 400
	FIELD_OUTER_HEIGHT = 500
	FIELD_PADDING      = 10

	FIELD_INNER_X      = FIELD_OUTER_X + FIELD_PADDING
	FIELD_INNER_Y      = FIELD_OUTER_Y + FIELD_PADDING
	FIELD_INNER_WIDTH  = FIELD_OUTER_WIDTH  - FIELD_PADDING
	FIELD_INNER_HEIGHT = FIELD_OUTER_HEIGHT - FIELD_PADDING

	SCROLLBAR_WIDTH = 0
	BLINK_INTERVAL  = 2

	theFont = love.graphics.newFont(FONT_SIZE)
	theFont:setLineHeight(FONT_LINE_HEIGHT)

	field = InputField(Testo[6], FIELD_TYPE)
	field:setFont(theFont)
	field:setDimensions(FIELD_INNER_WIDTH, FIELD_INNER_HEIGHT)
end
local function DRAW_NOTE()
    -- Input field.
    love.graphics.setScissor(FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Background.
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", FIELD_OUTER_X, FIELD_OUTER_Y, FIELD_OUTER_WIDTH, FIELD_OUTER_HEIGHT)

    -- Selection.
	love.graphics.setColor(0, 0, 0)
	for _, selectionX, selectionY, selectionWidth, selectionHeight in field:eachSelection() do
	    love.graphics.rectangle("fill", FIELD_INNER_X+selectionX, FIELD_INNER_Y+selectionY, selectionWidth, selectionHeight)
	end

    -- Text.
	love.graphics.setFont(Font.horror)
	love.graphics.setColor(0, 0, 0)
	for _, lineText, lineX, lineY in field:eachVisibleLine() do
	    love.graphics.print(lineText, FIELD_INNER_X+lineX, FIELD_INNER_Y+lineY)
	    Testo[6] = lineText
	end

    -- Cursor.
    local cursorWidth = 2
    local cursorX, cursorY, cursorHeight = field:getCursorLayout()
    local alpha = ((field:getBlinkPhase() / BLINK_INTERVAL) % 1 < .5) and 1 or 0
    love.graphics.setColor(0, 0, 0, alpha)
    love.graphics.rectangle("fill", FIELD_INNER_X+cursorX-cursorWidth/2, FIELD_INNER_Y+cursorY, cursorWidth, cursorHeight)

    love.graphics.setScissor()

    -- Scrollbars.
    local horiOffset, horiCoverage, vertOffset, vertCoverage = field:getScrollHandles()

    local horiHandleLength = horiCoverage * FIELD_OUTER_WIDTH
    local vertHandleLength = vertCoverage * FIELD_OUTER_HEIGHT
    local horiHandlePos    = horiOffset   * FIELD_OUTER_WIDTH
    local vertHandlePos    = vertOffset   * FIELD_OUTER_HEIGHT

    -- Handles.
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("fill", FIELD_OUTER_X+FIELD_OUTER_WIDTH, FIELD_OUTER_Y+vertHandlePos,  SCROLLBAR_WIDTH, vertHandleLength) -- Vertical scrollbar.
	love.graphics.rectangle("fill", FIELD_OUTER_X+horiHandlePos, FIELD_OUTER_Y+FIELD_OUTER_HEIGHT, horiHandleLength, SCROLLBAR_WIDTH) -- Horizontal scrollbar.
end
local function CLOSE_NOTE(key) 
	if key == "return" then 
		for c2,card2 in ipairs(inCampoCards2) do
			if card2.Name == Testo[6] then 
				card2.morta = true
			end
		end
		NOTE = false
		general:scambio_dati_carta()
	end
end


local shop = {}
local function LOAD_SHOP()
	SHOP = true
	table.insert(shop, Card:new(window.width*0.71, window.height*0.6, 1,false, love.math.random(1, inventario.maxCards)))
	table.insert(shop, Card:new(window.width*0.86, window.height*0.6, 1,false, love.math.random(1, inventario.maxCards)))
	table.insert(shop, Card:new(window.width*1.02, window.height*0.6, 1,false, love.math.random(1, inventario.maxCards)))
end
local function SELECT_SHOP(x,y)
	for c,card in ipairs(shop) do
		if general:aabb(card.x,card.y, card.width/2,card.height/2, mouse.x,mouse.y, 1,1) and SHOP then
			shop[4] = card
			SHOP = false
			evocare_SHOP = true
			love.mouse.setCursor(Cursor.Evocare)
			for c1,card1 in ipairs(inCampoCards) do
				if card1.id == 52 then -- Temmie
					card1.morta = true
				end
			end
		end
	end
end
local function EVOCA_SHOP(card)
	for u,camp in ipairs(campi) do
		for l,campo in ipairs(camp) do
			if campo.hotcampo and ((u == 1 and card.Utente) or (u == 3 and not card.Utente)) then
				card.x = campo.x
				card.y = campo.y
				card.posizionato = true
				table.insert(inCampoCards,card)
				Abilita:activeAbilitySummon(card)
				campo.puohotcampo = false
				campo.hotcampo = false
				love.mouse.setCursor(Cursor.arrow)
			end
		end
	end
end
local function DRAW_SHOP()
	SHOP = true
	love.graphics.setColor(love.math.colorFromBytes(174,134,61,90))
	love.graphics.rectangle("fill", window.width*0.27, window.height*0.3, window.width*0.47, window.height*0.34)
	love.graphics.setColor(1,1,1,1)
	for s,card in ipairs(shop) do
		COLOR_CARDS(shop)
		card.scaleMod = 1
		card.scale = 1.2
		DRAW_CARD_STATS(card,card.x,card.y,1/2,1/2,0,0,
			card.x,card.y,
			4,0.61,
			7,card.y + 3*card.height/8,	--ATK
			4,2)	--Mana
	end
end


function Abilita:activeAbility(x,y,button)
	if button == 3 then mouse.pressed.rot.x, mouse.pressed.rot.y = mouse.x, mouse.y
		for c,card in ipairs(inCampoCards) do
			if card.puoabilita2 and giocatore == 1 and card.hoverposizionato then
				if not card.abilita and card.puoabilita and card.Mana <= player.Mana then
						card.abilita = true
						player.Mana = player.Mana - card.Mana
						if card.id == 1 then -- Sciagghi
							piuATK = card.ATK/2
							potenziare = true
							love.mouse.setCursor(Cursor.Potenziare)
							card.puoabilita = false
						elseif card.id == 2 then -- Lucy
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 3 then -- VOID
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 4 then -- Hardcore Jack
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 5 then -- Trill
							love.mouse.setCursor(Cursor.Uccidere)
							uccidere = true
							card.puoabilita = false
						elseif card.id == 6 then -- Gin Fotonic
							LOAD_OSU(card)
							tick.delay(function () card.abilita = false end , 0.5)
						elseif card.id == 7 then -- Shadow Grimm
							LOAD_CONO(card)
							card.puoabilita = false
						elseif card.id == 8 then -- Ceo of Sex inc
							LOAD_SMITH(card)
							card.puoabilita = false
						elseif card.id == 9 then -- lolfun
							love.mouse.setCursor(Cursor.Potenziare)
							piuATK = card.ATK
							potenziare = true
							--love.mouse.setCursor(Cursor.Potenziare)
							card.puoabilita = false
						elseif card.id == 10 then	-- Padanian Shitposter
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 11 then -- Aria
							LOAD_COMMISSIONE_NON_PAGATA(card)
						elseif card.id == 12 then -- Charlie Ebony
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 13 then -- Juj
							love.mouse.setCursor(Cursor.Rubare)
							ruba = true
							card.puoabilita = false
						elseif card.id == 14 then -- Sakura
							LOAD_STELLE()
							attaccante = card
							tick.delay(function() card.abilita = false end, 5)
								:after(function() love.mouse.setCursor(Cursor.arrow) end, 0)
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
							LOAD_TELECINESI(card)
							attaccante = card
							card.puoabilita = false
						elseif card.id == 19 then -- Alex
							LOAD_ACULEI(card)
						elseif card.id == 20 then -- Doppialex
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 21 then -- Ping
							elimina_cloni()
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 22 then -- Cosmi
							love.mouse.setCursor(Cursor.Explosion)
							AREA = true
							attaccante = card
							card.puoabilita = false
						elseif card.id == 23 then -- Cring3_Crimson
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 24 then -- Fat Chad Yoshi
							love.mouse.setCursor(Cursor.Annulla)
							annullare = true
							card.puoabilita = false
						elseif card.id == 25 then -- Mortius
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 26 then -- Verel
							LOAD_SQUALO(card)
							--player.Mana = player.Mana + card.Mana
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
							uccidere = true
							love.mouse.setCursor(Cursor.Uccidere)
							--player.Mana = player.Mana + card.Mana
							--card.abilita = false
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
						elseif card.id == 36 then -- IL DVCE
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 37 then -- Carly
							love.mouse.setCursor(Cursor.Switch)
							switch = true
							card.puoabilita = false
						elseif card.id == 38 then -- Raiden
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 39 then -- Edd
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 40 then -- Fizz
							LOAD_CUORI()
							tick.delay(function() card.abilita = false end, 5)
							card.puoabilita = false
						elseif card.id == 41 then -- Uomo Piccione
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
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
						elseif card.id == 44 then -- Perry
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 45 then -- Basato
							-- Ha una Abilità passiva
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 46 then -- Summer
							love.mouse.setCursor(Cursor.Bread)
							antidanno = card.ATK
							curare = true
							card.puoabilita = false
						elseif card.id == 47 then -- Gato sburato
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 48 then -- Bread
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 49 then -- Neko Arc
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 50 then -- Sfango
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 51 then -- Mr Caputo
							LOAD_WALL()
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 52 then -- Temmie Shop
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 53 then -- Sboro
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 54 then -- Death Note
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 55 then -- Local Troller
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						elseif card.id == 56 then -- Erba
							-- Ha una Abilità in Abilita:activeAbilitySummon(card)
							player.Mana = player.Mana + card.Mana
							card.abilita = false
							card.puoabilita = false
						end
				elseif card.abilita then	 
					card.abilita = false
					card.puoabilita = true
					player.Mana = player.Mana + card.Mana
					CONO = false
					SMITH = false
					AREA = false
					BEAN = false
					CUORI = false
					ACULEI = false
					STELLE = false
					LASER = false
					OSU = false
					love.mouse.setCursor(Cursor.arrow)
				end
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
	elseif card.id == 4 then -- Hardcore Jack
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			table.insert(inventario.deck, 48)
			table.insert(inventario.deck, 48)
			table.insert(inventario.deck, 48)
			inventario.deck.total = inventario.deck.total+3
		end
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
	elseif card.id == 20 then -- Doppialex
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			for c2,card2 in ipairs(inCampoCards2) do
				if c2 < 4 and card2 ~= nil then 
					card2.stato.stordito = true
				end
			end
		end
	elseif card.id == 23 then	--Cring3_Crimson
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			if hoster then
            	Abilita:cambiaTurno()
            	server:sendToAll("cambia_turno_1-2", true)
        	elseif connesso then
         	   Abilita:cambiaTurno()
        	   client:send("cambia_turno_2-1", true)
        	end
        	tick.delay(function() 
        	if hoster then
            	Abilita:cambiaTurno()
            	server:sendToAll("cambia_turno_1-2", true)
        	elseif connesso then
         	   Abilita:cambiaTurno()
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
	elseif card.id == 28 then -- Esagono
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			for c,card1 in ipairs(inCampoCards) do
				if card1.Mana > 0 then
					card1.Mana = card1.Mana-1
				end
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
			love.mouse.setCursor(Cursor.Uccidere)
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
			LOAD_MADE_IN_HEAVEN(120)
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
			piuATK = -9000
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
	elseif card.id == 36 then -- IL DVCE
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			table.insert(inventario.deck, (love.math.random(1,inventario.maxCards)))
			inventario.deck.total = inventario.deck.total+1
		end
	elseif card.id == 39 then -- Edd
		for c2,card2 in ipairs(inCampoCards2) do
			if card2.INFO.classe == "GOLDEN STAFF SEGRETARIO" then
				piuATK = -700
				general:aumentaATK(card2)
				danno = 100
				general:danno(card2)
			end
		end
	elseif card.id == 41 then -- Uomo Piccione
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			for c12,card12 in ipairs(union(inCampoCards,inCampoCards2)) do
				card12.HP = card12.HP - 100
			end
		end
	elseif card.id == 42 then -- Schrödinger
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			card.stato.immune = true
		end
		for c1,card1 in ipairs(inCampoCards) do
			if card1.id == 26 then 	--Verel
				card.ATK = card.ATK + 500
				card.HP = card.HP + 300
			end
		end
	elseif card.id == 44 then -- Perry
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			card.abilita = true
			immunizzare = true
			love.mouse.setCursor(Cursor.Immunizzare)
		else
			player.Mana = player.Mana+1
		end
		card.morta = true
		sfx.perry:play()
	elseif card.id == 47 then -- Gato sburato
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			SPAWN_CARD(screen.width / 2, screen.height - 90, numeroCarteInMano-1, true)
			--MUOVI_CARTA()
			COLOR_CARDS(activeCards)
		end
	elseif card.id == 48 then -- Bread
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			love.mouse.setCursor(Cursor.Bread)
			curare = true
		else
			player.Mana = player.Mana+1
			card.morta = true
		end
	elseif card.id == 49 then -- Neko Arc
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			card.abilita = true
			piuATK = 1000
			potenziare = true
			love.mouse.setCursor(Cursor.DePotenziare)
		else
			player.Mana = player.Mana+1
		end
		card.morta = true
	elseif card.id == 50 then -- Sfango
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			SPAWN_CARD(screen.width / 2, screen.height - 90, numeroCarteInMano-1, true)
			SPAWN_CARD(screen.width / 2, screen.height - 90, numeroCarteInMano-1, true)
			--MUOVI_CARTA()
			COLOR_CARDS(activeCards)
		else 
			player.Mana = player.Mana+1
		end
		card.morta = true
	elseif card.id == 52 then -- Temmie Shop
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			LOAD_SHOP()
		else 
			player.Mana = player.Mana+1
		end
		card.morta = true
	elseif card.id == 53 then -- Sboro
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			for c,card in ipairs(inCampoCards) do
				if card.INFO.classe == "GOLDEN STAFF SEGRETARIO" then 
					card.ATK = card.ATK + 1000
					card.HP = card.HP + 500
				elseif card.INFO.classe == "ADMIN" then 
					card.HP = card.HP + 1000
				end
			end
		else 
			player.Mana = player.Mana+1
		end
		card.morta = true
	elseif card.id == 54 then -- Death Note
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			LOAD_NOTE()
		else 
			player.Mana = player.Mana+1
		end
		card.morta = true
	elseif card.id == 55 then -- local Troller
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			Konami.newCode({"up", "up", "down", "down", "left", "right", "left", "right", "b", "a"}, function() player.HP = player.maxHP general:scambio_dati_player_propria() end)
		end
	elseif card.id == 56 then -- Erba
		if card.Mana <= player.Mana then
			player.Mana = player.Mana - card.Mana
			for c2,card2 in ipairs(inCampoCards2) do 
				if card2.INFO.classe == "GOLDEN STAFF SEGRETARIO" or card2.INFO.classe == "ADMIN" then
					LOAD_CHIUDI()
				end
			end
		end
	end
	if card.INFO.classe == "GOLDEN STAFF SEGRETARIO" then -- Staffers
		for c1,card1 in ipairs(inCampoCards2) do
			if card1.id == 39 then 	--Edd
				card.ATK = card.ATK - 700
				card.HP = card.HP - 100
			end
		end
	end
end


function Abilita:useAbility()
	if AREA then
		for c2,card2 in ipairs(inCampoCards2) do
			if (general:calculateDistance(card2.x+card2.width/4,card2.y+card2.height/4,mouse.x,mouse.y)) < 200 then
				danno = math.floor(2500-(general:calculateDistance(card2.x+card2.width/4,card2.y+card2.height/4,mouse.x,mouse.y)))
				general:danno(card2,attaccante)
				AREA = false
				love.mouse.setCursor(Cursor.arrow)
			end
		end
	elseif CONO then
		for c2,card2 in ipairs(inCampoCards2) do
			if ((giocatore == 1) and ((general:getAngle(cono.cxa,cono.cya, cono.cxb,cono.cyb)) > 0)) or ((giocatore == 2) and ((general:getAngle(cono.cxa,cono.cya, cono.cxb,cono.cyb)) < 0)) then
				if ((general:getAngle(card2.x+card2.width/4,card2.y+card2.height/4, cono.cxb,cono.cyb))-0.4 < (general:getAngle(cono.cxa,cono.cya, cono.cxb,cono.cyb))) and 
					((general:getAngle(card2.x+card2.width/4,card2.y+card2.height/4, cono.cxb,cono.cyb))+0.4 > (general:getAngle(cono.cxa,cono.cya, cono.cxb,cono.cyb)))
				 then
					card2.stato.stordito = true
					general:scambio_dati_carta()
					CONO = false
					for c,card in ipairs(inCampoCards) do
						if (card.id == 7) then --Shadow grimm
							card.abilita = false
						end
					end
					love.mouse.setCursor(Cursor.arrow)
				end
			end
		end
	elseif SMITH then
		for c2,card2 in ipairs(inCampoCards2) do
			if card2.hoverposizionato2 then
				smith.X = mouse.x 
				smith.Y = mouse.y
				smith.R = smith.r
				ruota_smith = false
				UPDATE_SMITH()
				love.mouse.setCursor(Cursor.arrow)
			end
		end
	elseif LASER_GO then
		laser.x = mouse.x 
		laser.y = mouse.y
		LASER = true
		love.mouse.setCursor(Cursor.arrow)
	elseif ACULEI then
		ferma_aculei = true
		for a,aculeo in ipairs(aculei) do
			flux.to(aculeo, 3, {x = (mouse.pressed.dx.x+(2*(mouse.pressed.dx.x-aculeo.x))), y = (mouse.pressed.dx.y+(2*(mouse.pressed.dx.y-aculeo.y))),})
		end
		tick.delay(function() ACULEI = false end, 3)
			:after(function() ferma_aculei = false end, 0)
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
			if card.id == 1 or card.id == 9 or card.id == 49 then	-- Sciagghi or lolfun
				card.abilita = false
			elseif card.id == 34 then				--Moyai
				card.morta = true
			end
		end
	elseif ruba then
		for c2,card2 in ipairs(inCampoCards2) do
			if card2.hoverposizionato2 then
				table.insert(inventario.deck, card2.id)
				card2.morta = true
				general:scambio_dati_carta()
				inventario.deck.total = inventario.deck.total+1
				ruba = false
				love.mouse.setCursor(Cursor.arrow)
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
				love.mouse.setCursor(Cursor.arrow)
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
				card2.hoverposizionato2 = false
				for c,card in ipairs(inCampoCards) do	
					if card.id == 24 then --Fat Chad Yoshi
						card.abilita = false
					end
				end
				annullare = false
				love.mouse.setCursor(Cursor.arrow)
			end
		end
	elseif immunizzare then
		for c,card in ipairs(inCampoCards) do
			if card.hoverposizionato then
				card.stato.immune = true
				immunizzare = false
				love.mouse.setCursor(Cursor.arrow)
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
				love.mouse.setCursor(Cursor.arrow)
			end
			if card.id == 2 then --Lucy
				card.abilita = false
			end
		end
	elseif evocare_SHOP then 
		EVOCA_SHOP(shop[4])
	elseif TELECINESI then
		love.mouse.setCursor(Cursor.TelecinesiPreso)
	elseif OSU then
		for c,card2 in ipairs(inCampoCards2) do
			danno = 300
			for o,su in ipairs(osu.bool) do
				if osu.bool[o] and ((general:calculateDistance(osu.x[o], osu.y[o], mouse.x, mouse.y)) < 50) then
					osu.bool[o] = false
					if (general:aabb((card2.x-50),(card2.y-50), ((card2.width/4)+100),((card2.height/4)+100), osu.x[o],osu.y[o], 1, 1)) then
						general:danno(card2)
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


function Abilita:mousereleased(x, y, button)
	if button == 1 and SHOP then 
		SELECT_SHOP(x, y)
	elseif button == 2 then
		if LASER then
			MOVE_LASER(x, y, button)
		elseif TELECINESI then
			love.mouse.setCursor(Cursor.TelecinesiLibero)
		end
	end
end


function Abilita:mousemoved(x, y, dx, dy)
	if TELECINESI then	
		MOVE_TELECINESI(x, y, dx, dy)
	end
end

function Abilita:keypressed(key)
	if NOTE then	
		CLOSE_NOTE(key)
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
	if SMITH and not ruota_smith then
		UPDATE_SMITH()
	end
	if BEAN then
		UPDATE_LASER(dt)
	end
	if CONO then
		UPDATE_CONO()
	end
	if ferma_aculei then
		UPDATE_ACULEI()
	end
	if STELLE then
		UPDATE_STELLE(dt)
	end
	if CUORI then
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
	if SQUALO then 
		squalo.animation:update(dt)
		MOVE_SQUALO(dt)
	end
end

function Abilita:draw(card)
	love.graphics.setColor(1,1,1)
		--carte posizionate
	if card.posizionato then
			--se abilità attiva
		if card.abilita then
			love.graphics.draw(ABimg,card.x , card.y, card.r, 1/2, 1/2)
		end
	end
	if AREA then
		DRAW_AREA()
	end
	if CONO then
		DRAW_CONO()
	end
	if SMITH then
		DRAW_SMITH()
	end
	if LASER then
		DRAW_LASER()
	end
	if ACULEI then
		DRAW_ACULEI(dt)
	end
	if STELLE then
		DRAW_STELLE()
	end
	if CUORI then
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
	if WALL then 
		DRAW_WALL()
	end
	if NOTE then 
		DRAW_NOTE()
	end
	if SHOP then 
		DRAW_SHOP()
	end
	if SQUALO then 
		squalo.animation:draw(squalo.img, squalo.x, squalo.y, 0, squalo.scale, squalo.scale)
		--love.graphics.circle("fill",squalo.x+squalo.width*squalo.scale/2, squalo.y+squalo.height*squalo.scale/1.5, 60)
		--for c2,card2 in ipairs(inCampoCards2) do
		--	love.graphics.rectangle("fill", card2.x, card2.y, card2.width/2, card2.height/2, 6)
		--end
		--qwerty
	end
end


function Abilita:cambiaTurno()
	for u,camp in ipairs(campi) do --spegnere i campi
		for i,campo in ipairs(camp) do
			if campo.hotcampo then
				campo.hotcampo = false
			end
		end
	end
		--cambio turno
	love.mouse.setCursor(Cursor.arrow)

	AREA = false
	CONO = false
	SMITH = false
	STELLE = false
	LASER = false
	BEAN = false
	ACULEI = false
	OSU = false
	COMMISSIONE_NON_PAGATA = false
	CUORI = false
	WALL = false
	SQUALO = false

	ferma_aculei = false
	
	potenziare = false
	ruba = false
	uccidere = false
	annullare = false
	immunizzare = false
	curare = false
	evocare = false

	if wall ~= nil then
		wall[#wall] = nil
		if wall[1] == nil then 
			wall = nil
		end
	end
	
	attaccante = nessuno
	for c,card in ipairs(inCampoCards) do --cambio turno da stordito
		if card.stato.stordito then
			card.puoattaccare = false
			if giocatore == 1 then
				card.stato.stordito = false
			end
		else 
			card.puoattaccare = true
		end
		card.hoverposizionato = false
		card.puoabilita = true
		if card.stato.avvelenata then
			danno = 300
			--attaccante = nessuno
			general:danno(card)
			if general:togliEffeto() then
				card.stato.avvelenata = false
			end
		end
	end
	if giocatore == 1 then
		giocatore = 2
		turno.x = turno.x + 140
		turno.y = turno.y + 37
		turno.r = 3.14
		if connesso then
			turno.n = turno.n +1
			if turno.n == 2 then
				player:scambio_nomi()
			end
		end
		danno = 0
	elseif giocatore == 2 then
		giocatore = 1
		turno.x = turno.x - 140
		turno.y = turno.y - 37
		turno.r = 0
		if hoster then
			turno.n = turno.n +1
			if turno.n == 2 then
				player:scambio_nomi()
			end
		end
		danno = 0
		SPAWN_CARD(screen.width / 2, screen.height - 90, numeroCarteInMano, true)
		COLOR_CARDS(activeCards)
	end
	general:fineBattaglia()	
	general:scambio_dati_player()
end