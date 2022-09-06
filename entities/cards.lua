Card = {}
activeCards = {}
inCampoCards = {}
activeCards2 = {}
inCampoCards2 = {}
Card.__index = Card

function Card:loadAssets()
	TOPimg = love.graphics.newImage("assets/cards/cardfont/TOP.png")
	BOTimg = love.graphics.newImage("assets/cards/cardfont/BOT.png")
	MALTOPimg = love.graphics.newImage("assets/cards/cardfont/MALTOP.png")
	MALBOTimg = love.graphics.newImage("assets/cards/cardfont/MALBOT.png")
	img1 = love.graphics.newImage("assets/cards/cardimg/cardimg1.png")
	Pingimg = love.graphics.newImage("assets/cards/cardfont/Pingimg.png")
	ATKimg = love.graphics.newImage("assets/cards/cardfont/ATKimg.png")
	HPimg = love.graphics.newImage("assets/cards/cardfont/HPimg.png")
	STORDITOimg = love.graphics.newImage("assets/cards/cardfont/STORDITOimg.png")
	VELENOimg = love.graphics.newImage("assets/cards/cardfont/VELENOimg.png")
	ANNULLATOimg = love.graphics.newImage("assets/cards/cardfont/ANNULLATOimg.png")
	backimg = gui.deck.img
end


function Card:new(x,y, number, drawn, id)
	local cardObj = {}
	cardObj.drawn = drawn
	cardObj.number = number
	cardObj.r = 0
	cardObj.id = id
	cardObj.width = img1:getWidth()
	cardObj.height = img1:getHeight()
	cardObj.spacing = 3
	cardObj.delgiocatore = 0
	cardObj.hover = false
	cardObj.hoverposizionato = false
	cardObj.hoverposizionato2 = false
	cardObj.posizionato = false
	cardObj.morta = false
	cardObj.puoattaccare = true --false?
	cardObj.puoabilita = false
	cardObj.puoabilita2 = true
	cardObj.attacco = false
	cardObj.attaccata = false
	cardObj.abilita = false
	cardObj.immune = false
	cardObj.stato = {}
	cardObj.stato.AVVELENATO = false
	cardObj.stato.STORDITO = false
	cardObj.INFO = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
	cardObj.color = {r,g,b,a}
	cardObj.color.r = 0
	cardObj.color.g = 0
	cardObj.color.b = 0
	cardObj.color.a = 0

	cardObj.scaleMod = 1
	--nel deck
	if cardObj.drawn == true then
		cardObj.scale = gui.deck.defaultScale
		cardObj.x = gui.deck.x
		cardObj.y = gui.deck.y
		--dove va a finire in mano
		cardObj.targetX = 150+x + (cardObj.width + cardObj.spacing) * (3*cardObj.number/4) - ((cardObj.width + cardObj.spacing) * 2.5) - cardObj.width - cardObj.spacing
		cardObj.targetY = y - 200
		cardObj.scaleMod = -1
		flux.to(cardObj, 0.3, {x = cardObj.targetX, y = cardObj.targetY, scale = 1, scaleMod = 1})
	--in mano
	else
		cardObj.scale = 2
		cardObj.x = 150+x + (cardObj.width + cardObj.spacing) * (3*cardObj.number/4) - ((cardObj.width + cardObj.spacing) * 2.5) - cardObj.width - cardObj.spacing
		cardObj.y = y - 200
	end
	cardObj.offsetY = 175

	--proprietà carte 			--se cambi qualcosa qui cambialo anche in "inventario.lua"
	if cardObj.id == 100 then -- Pepone
		cardObj.Utente = true
		cardObj.Name = "PEPONE"
		cardObj.ATK = 2800
		cardObj.Mana = 0
		cardObj.hp = 14000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "OWNER"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[è il suo gioco:
 vince]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 1 then -- Sciagghi
		cardObj.Utente = true
		cardObj.Name = "SCIAGGHI"
		cardObj.ATK = 2800
		cardObj.Mana = 2
		cardObj.hp = 14000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "GOLDEN STAFF SEGRETARIO"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Canale di Scooby-Doo:
 una carta guadagna ATK pari a
 metà dell'ATK di questa carta
 (tasto dx per selezionare la carta)]]
		cardObj.INFO.Tabilita2 = "Abilità passiva"
		cardObj.INFO.tabilita2 = 
[[La prima repubblica: 
 una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificarli per
 evocare il Pepone]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 4
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 5
 	elseif cardObj.id == 2 then -- Lucy
		cardObj.Utente = true
		cardObj.Name = "LUCY"
		cardObj.ATK = 1200
		cardObj.Mana = 2
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "GOLDEN STAFF SEGRETARIO"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Switch
scambia ATK e HP di una carta]]
		cardObj.INFO.Tabilita2 = "Abilità passiva"
		cardObj.INFO.tabilita2 = 
[[La prima repubblica: 
 una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificarli per
 evocare il Pepone]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 5
	elseif cardObj.id == 3 then -- VOID
		cardObj.Utente = true
		cardObj.Name = "VOID"
		cardObj.ATK = 2000
		cardObj.Mana = 0
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp		
		cardObj.INFO.classe = "GOLDEN STAFF SEGRETARIO"
		cardObj.INFO.Tabilita1 = "Abilità passiva"
		cardObj.INFO.tabilita1 = 
[[La prima repubblica: 
 una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificarli per
 evocare il Pepone]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 5
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 4 then -- Hardcore Jack
		cardObj.Utente = true
		cardObj.Name = "HARDCORE JACK"
		cardObj.ATK = 1500
		cardObj.Mana = 2
		cardObj.hp = 20000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Bread:
 cura una carta di un valore
 pari all'ATK di questa carta
 (tasto dx per selezionare la carta)]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 4
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 5 then -- Trill
		cardObj.Utente = true
		cardObj.Name = "TRILL"
		cardObj.ATK = 1000
		cardObj.Mana = 4
		cardObj.hp = 11500
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Kill:
 uccidi un carta avversaria
 (tasto dx per selezionare la carta)]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 6 then -- Gin Fotonic
		cardObj.Utente = true
		cardObj.Name = "GIN FOTONIC"
		cardObj.ATK = 1300
		cardObj.Mana = 3
		cardObj.hp = 12000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "CONTENT CREATOR"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[OSU:
 fai danno a ritmo
 (tasto dx per colpire i cerchi)]]
		cardObj.INFO.Tabilita2 = "Consiglio"
		cardObj.INFO.tabilita2 = 
[[si veloce]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 1
	elseif cardObj.id == 7 then -- Shadow Grimm
		cardObj.Utente = true
		cardObj.Name = "SHADOW GRIMM"
		cardObj.ATK = 1500
		cardObj.Mana = 3
		cardObj.hp = 12000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "CONTENT CREATOR"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Urlo del sium:
 stordisce gli avversari
 (tasto dx per selezionare le carte)]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 8 then -- Nabboleone
		cardObj.Utente = true
		cardObj.Name = "NABBOLEONE"
		cardObj.ATK = 1700
		cardObj.Mana = 3
		cardObj.hp = 11000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "ADMIN"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Gangam Style:
 avvelena a una carta a scelta
 (tasto dx per selezionare la carta)]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 9 then -- lolfun
		cardObj.Utente = true
		cardObj.Name = "LOLFUN"
		cardObj.ATK = 1800
		cardObj.Mana = 2
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "CONTENT CREATOR"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[una carta guadagna ATK pari
 all'ATK di questa carta
 (tasto dx per selezionare la carta)]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 10 then -- Padanian Shitposter
		cardObj.Utente = true
		cardObj.Name = "PADANIAN SHITPOSTER"
		cardObj.ATK = 2500
		cardObj.Mana = 3
		cardObj.hp = 5000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "CONTENT CREATOR"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[Dimezza gli HP
 di ogni carta aversaria]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 11 then -- Aria
		cardObj.Utente = true
		cardObj.Name = "ARIA"
		cardObj.ATK = 200
		cardObj.Mana = 3
		cardObj.hp = 8000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "ARTISTA"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[COMMISSIONE NON PAGATA:
 attacchi infiniti per 5 secondi]]
		cardObj.INFO.Tabilita2 = "Consiglio"
		cardObj.INFO.tabilita2 = 
[[Team Up:
 quando COMMISSIONE NON PAGATA
 è attiva tutte le Aria sul
 campo attaccano insieme]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 4
	elseif cardObj.id == 12 then -- Charlie Ebony
		cardObj.Utente = true
		cardObj.Name = "CHARLIE EBONY"
		cardObj.ATK = 2900
		cardObj.Mana = 3
		cardObj.hp = 4500
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "CONTENT CREATOR"
		cardObj.INFO.Tabilita1 = "Abilità passiva"
		cardObj.INFO.tabilita1 = 
[[sacrifica questa carta
 per ottenere 4 Mana anzichè 1]]
		cardObj.INFO.Tabilita2 = "Abilità a evocazione"
		cardObj.INFO.tabilita2 = 
[[raddoppia gli HP 
 di ogni carta sul
 tuo terreno]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 3
	elseif cardObj.id == 13 then -- Juj
		cardObj.Utente = true
		cardObj.Name = "JUJ"
		cardObj.ATK = 1400
		cardObj.Mana = 5
		cardObj.hp = 6500
		cardObj.HP = cardObj.hp		
		cardObj.INFO.classe = "CONTENT CREATOR"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Bello stu' 'rulog:
 un utente avversario diventa tuo
 (tasto dx per selezionare la carta)]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 14 then -- Sakura
		cardObj.Utente = true
		cardObj.Name = "SAKURA"
		cardObj.ATK = 1000
		cardObj.Mana = 3
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp		
		cardObj.INFO.classe = "ARTISTA"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[polvere di stelle
 (muovi il mouse per disegnare Stelle)]]
		cardObj.INFO.Tabilita2 = "Consiglio"
		cardObj.INFO.tabilita2 = 
[[La carta obbiettivo è 
 la carta avversaria presente 
 da più tempo]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 3
	elseif cardObj.id == 15 then -- Mostro di Firenze
		cardObj.Utente = true
		cardObj.Name = "MOSTRO DI FIRENZE"
		cardObj.ATK = 16000
		cardObj.Mana = 0
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = "Disbilità passiva"
		cardObj.INFO.tabilita1 = 
[[si elimina da sola
 dopo 2 turni]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 16 then -- La Morte Oscura
		cardObj.Utente = true
		cardObj.Name = "MORTE OSCURA"
		cardObj.ATK = 1700
		cardObj.Mana = 3
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp		
		cardObj.INFO.classe = "INGEGNERE DEI MEMES"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Laser della Morte:
tieni premuto tasto dx e rilascalo]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 17 then -- Plytlas
		cardObj.Utente = true
		cardObj.Name = "PLYTLAS"
		cardObj.ATK = 2000
		cardObj.Mana = 1
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "CONTENT CREATOR"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[ogni utente avversario di classe 
 "CONTENT CREATOR" o "GOLDEN STAFF SEGRETARIO" 
 avversario perde 500 ATK]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 18 then -- Inazuma sensei
		cardObj.Utente = true
		cardObj.Name = "INAZUMA SENSEI"
		cardObj.ATK = 1700
		cardObj.Mana = 3
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "CONTENT CREATOR"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Telecinesi:
 muovi le carte avversarie
 (tenere premuto tasto dx per 
 raccogliere le carte)]]
		cardObj.INFO.Tabilita2 = "Consiglio"
		cardObj.INFO.tabilita2 = 
[[durante Telecinesi
 se muovi le carte in verticale
 le stordisci,
 in orizzontale le fai danno]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 4
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 4
	elseif cardObj.id == 19 then -- Alex
		cardObj.Utente = true
		cardObj.Name = "ALEX"
		cardObj.ATK = 1200
		cardObj.Mana = 2
		cardObj.hp = 9000
		cardObj.HP = cardObj.hp		
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Aculei dal culo:
 spara 6 aculei
 (tasto dx per selezionare la carta)]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 20 then -- Doppialex
		cardObj.Utente = true
		cardObj.Name = "DOPPIALEX"
		cardObj.ATK = 2000
		cardObj.Mana = 0
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "CONTENT CREATOR"
		cardObj.INFO.Tabilita1 = ""
		cardObj.INFO.tabilita1 = 
[[]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 0
 		cardObj.INFOlinee.tabilita1 = 0
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 21 then -- Ping
		cardObj.Utente = true
		cardObj.Name = "PING"
		cardObj.ATK = 2000
		cardObj.Mana = 2
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "ADMIN"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Ho programmato io questo gioco!
 se ci sono 2 carte uguali sul campo
 si disintegrano entrambe]]
		cardObj.INFO.Tabilita2 = "Consiglio"
		cardObj.INFO.tabilita2 = 
[[  -è una D4C reference]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 4
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 1
	elseif cardObj.id == 22 then -- Cosmi
		cardObj.Utente = true
		cardObj.Name = "COSMI"
		cardObj.ATK = 1900
		cardObj.Mana = 3
		cardObj.hp = 10000
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "CONTENT CREATOR"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Explosion:
 infligge danno ad area
 (tasto dx per selezionare l'area)]]
		cardObj.INFO.Tabilita2 = "Consiglio"
		cardObj.INFO.tabilita2 = 
[[minore è la distanza dal centra
 maggiore è il danno
 danno massimo: 2500]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 3
	elseif cardObj.id == 23 then -- Cring3_Crimson
		cardObj.Utente = true
		cardObj.Name = "CRING3_CRIMSON"
		cardObj.ATK = 1700
		cardObj.Mana = 1
		cardObj.hp = 13500
		cardObj.HP = cardObj.hp		
		cardObj.INFO.classe = "INGEGNERE DEI MEMES"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[passano 2 turni]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 0
 		cardObj.INFOlinee.tabilita1 = 0
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
 	elseif cardObj.id == 24 then -- Fat Chad Yoshi
		cardObj.Utente = true
		cardObj.Name = "FAT CHAD YOSHI"
		cardObj.ATK = 2500
		cardObj.Mana = 4
		cardObj.hp = 7500
		cardObj.HP = cardObj.hp		
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Annulla l'effetto di una carta
 (tasto dx per selezionare la carta)]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 25 then -- Mortius
		cardObj.Utente = true
		if ((hoster and (Testo[1] == "Morbius" or Testo[1] == "morbius" or Testo[1] == "MORBIUS"))
		 or (connesso and (Testo[2] == "Morbius" or Testo[2] == "morbius" or Testo[2] == "MORBIUS"))) then
			cardObj.Name = "MORBIUS"
		else
			cardObj.Name = "MORTIUS"
		end
		cardObj.ATK = 2000
		cardObj.Mana = 2
		cardObj.hp = 11000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[evoca un minion
 (tasto dx per selezionare lo spazio)]]
		cardObj.INFO.Tabilita2 = "frase ad effetto"
		cardObj.INFO.tabilita2 = 
[[FINO ALLA MORTE ED OLTRE]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 1
 	elseif cardObj.id == 125 then -- Mini Mortius
		cardObj.Utente = true
		if ((hoster and (Testo[1] == "Morbius" or Testo[1] == "morbius" or Testo[1] == "MORBIUS"))
		 or (connesso and (Testo[2] == "Morbius" or Testo[2] == "morbius" or Testo[2] == "MORBIUS"))) then
			cardObj.Name = "MINI MORBIUS"
		elseif ((hoster and (Testo[1] == "Morbius" or Testo[1] == "morbius" or Testo[1] == "MORBIUS"))
		 or (connesso and (Testo[2] == "Morbius" or Testo[2] == "morbius" or Testo[2] == "MORBIUS"))) then

		else
			cardObj.Name = "MINI MORTIUS"
		end
		cardObj.ATK = 500
		cardObj.Mana = 0
		cardObj.hp = 800
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MINION"
		cardObj.INFO.Tabilita1 = "FRASE AD EFFETTO"
		cardObj.INFO.tabilita1 = 
[[PRONTO A SERVIRE]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 0
 		cardObj.INFOlinee.Tabilita1 = 0
 		cardObj.INFOlinee.tabilita1 = 1
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 26 then -- Verel
		cardObj.Utente = true
		cardObj.Name = "VEREL"
		cardObj.ATK = 0
		cardObj.Mana = 9
		cardObj.hp = 100
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "ARTISTA"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[l'avversario chiude il gioco]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 1
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
 	elseif cardObj.id == 27 then -- Il sam
		cardObj.Utente = true
		cardObj.Name = "IL.SAM"
		cardObj.ATK = 1800
		cardObj.Mana = 1
		cardObj.hp = 4000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MODERATORE"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[rendi una carta
 classe "INGEGNERE DEI MEMES"]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
 	elseif cardObj.id == 28 then -- Esagono
		cardObj.Utente = true
		cardObj.Name = "ESAGONO"
		cardObj.ATK = 1800
		cardObj.Mana = 2
		cardObj.hp = 6000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MODERATORE"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[tutte le carte sul tuo terreno
 costano 1 Mana in meno]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
 	elseif cardObj.id == 29 then -- Disegni e Fan Art
		cardObj.Utente = false
		cardObj.Name = "DISEGNI E FAN ART"
		cardObj.ATK = 0
		cardObj.Mana = 1
		cardObj.hp = 100
		cardObj.HP = cardObj.hp		
		cardObj.INFO.classe = "CANALE"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[ad ogni ARTISTA:
+800 ATK
+800 HP]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 30 then -- BAN
		cardObj.Utente = false
		cardObj.Name = "BAN"
		cardObj.ATK = 0
		cardObj.Mana = 3
		cardObj.hp = 100
		cardObj.HP = cardObj.hp		
		cardObj.INFO.classe = "AZIONE"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[Kill:
 uccidi un carta avversaria
 (tasto dx per selezionare la carta)]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
 	elseif cardObj.id == 31 then -- Demon Core
		cardObj.Utente = false
		cardObj.Name = "DEMON CORE"
		cardObj.ATK = 0
		cardObj.Mana = 4
		cardObj.hp = 100
		cardObj.HP = cardObj.hp
		cardObj.INFO.classe = "MEME"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[Cancro:
 uccidi tutte le carte
 sul terreno tra 3 turni]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 32 then -- #memes
		cardObj.Utente = false
		cardObj.Name = "#MEMES"
		cardObj.ATK = 0
		cardObj.Mana = 1
		cardObj.hp = 100
		cardObj.HP = cardObj.hp		
		cardObj.INFO.classe = "CANALE"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[ad ogni INGEGNERE DEI MEMES:
 +800 ATK
 +800 HP]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 33 then -- Made in Heaven
		cardObj.Utente = false
		cardObj.Name = "MADE IN HEAVEN"
		cardObj.ATK = 0
		cardObj.Mana = 8
		cardObj.hp = 100
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "AZIONE"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[la partita si
 conclude tra 2 minuti]]
		cardObj.INFO.Tabilita2 = "Consiglio"
		cardObj.INFO.tabilita2 = 
[[Il timer accellera ma
 si può resettare se
 evochi un altro Made in Heaven]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 3
	elseif cardObj.id == 34 then -- Moyai
		cardObj.Utente = false
		cardObj.Name = "MOYAI"
		cardObj.ATK = 0
		cardObj.Mana = 2
		cardObj.hp = 100
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEME"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[una carta avversaria 
 perde 1500 ATK
 (tasto dx per selezionare la carta)]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 3
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 35 then -- Kronk Drip
		cardObj.Utente = false
		cardObj.Name = "KRONK DRIP"
		cardObj.ATK = 0
		cardObj.Mana = 2
		cardObj.hp = 100
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEME"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[+1000 HP a ogni carta sul tuo terreno]]
		cardObj.INFO.Tabilita2 = "Abilità a evocazione"
		cardObj.INFO.tabilita2 = 
[[-100 ATK a ogni carta sul terreno avversario]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 1
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 1
	elseif cardObj.id == 36 then -- Jenny
		cardObj.Utente = true
		cardObj.Name = "JENNY"
		cardObj.ATK = 1600
		cardObj.Mana = 2
		cardObj.hp = 8000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = ""
		cardObj.INFO.tabilita1 = 
[[]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 0
 		cardObj.INFOlinee.tabilita1 = 0
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 37 then -- Carly
		cardObj.Utente = true
		cardObj.Name = "CARLY"
		cardObj.ATK = 1600
		cardObj.Mana = 2
		cardObj.hp = 8000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = ""
		cardObj.INFO.tabilita1 = 
[[]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 0
 		cardObj.INFOlinee.tabilita1 = 0
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 38 then -- Raiden
		cardObj.Utente = true
		cardObj.Name = "RAIDEN"
		cardObj.ATK = 1600
		cardObj.Mana = 1
		cardObj.hp = 8000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = "Abilità passiva"
		cardObj.INFO.tabilita1 = 
[[c'è una possibilità su 15
 di parare il colpo]]
		cardObj.INFO.Tabilita2 = "Abilità passiva"
		cardObj.INFO.tabilita2 = 
[[c'è una possibilità su 25
 di danneggiare la carta avversaria
 che sta attaccando questa carta]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 3
	elseif cardObj.id == 39 then -- Edd
		cardObj.Utente = true
		cardObj.Name = "EDD"
		cardObj.ATK = 1600
		cardObj.Mana = 2
		cardObj.hp = 8000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = ""
		cardObj.INFO.tabilita1 = 
[[]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 0
 		cardObj.INFOlinee.tabilita1 = 0
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 40 then -- Fizz
		cardObj.Utente = true
		cardObj.Name = "FIZZ"
		cardObj.ATK = 1600
		cardObj.Mana = 3
		cardObj.hp = 8000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[Super Cute:
 lancia cuori, curano 100 HP l'uno]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 2
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 41 then -- Uomo Piccione
		cardObj.Utente = true
		cardObj.Name = "UOMO PICCIONE"
		cardObj.ATK = 1600
		cardObj.Mana = 2
		cardObj.hp = 8000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = ""
		cardObj.INFO.tabilita1 = 
[[]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 0
 		cardObj.INFOlinee.tabilita1 = 0
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	elseif cardObj.id == 42 then -- Schrödinger
		cardObj.Utente = true
		cardObj.Name = "SCHRöDINGER"
		cardObj.ATK = 1600
		cardObj.Mana = 2
		cardObj.hp = 8000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = "Abilità a evocazione"
		cardObj.INFO.tabilita1 = 
[[Questa carta è immune al primo attacco]]
		cardObj.INFO.Tabilita2 = "Abilità passiva"
		cardObj.INFO.tabilita2 = 
[[se Verel è sul campo questa carta 
 guadagna +500 ATK e + 300 HP]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 1
 		cardObj.INFOlinee.Tabilita2 = 1
 		cardObj.INFOlinee.tabilita2 = 2
	elseif cardObj.id == 43 then -- Doom Slayer
		cardObj.Utente = true
		cardObj.Name = "DOOM SLAYER"
		cardObj.ATK = 4000
		cardObj.Mana = 3
		cardObj.hp = 9000
		cardObj.HP = cardObj.hp	
		cardObj.INFO.classe = "MEMBRO ONORARIO"
		cardObj.INFO.Tabilita1 = "Abilità speciale"
		cardObj.INFO.tabilita1 = 
[[+500 HP a questa carta]]
		cardObj.INFO.Tabilita2 = ""
		cardObj.INFO.tabilita2 = 
[[]]
 		cardObj.INFOlinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		cardObj.INFOlinee.classe = 1
 		cardObj.INFOlinee.Tabilita1 = 1
 		cardObj.INFOlinee.tabilita1 = 1
 		cardObj.INFOlinee.Tabilita2 = 0
 		cardObj.INFOlinee.tabilita2 = 0
	end

	return setmetatable(cardObj, Card)
end


function Card:update(dt,card)
	Card:checkHover(card)
	checkHoverPosizionato(card)
	Card:shrinkOthers()
	for c1,card1 in ipairs(inCampoCards) do
 		if card1.y >= 155 and card1.y <= 165 then
	        card1.y = 340
		elseif card1.y >= -5 and card1.y <= 5 then
	    	card1.y = 510
		end
		if card1.attacco then
			attacco_R = general:getAngle(card1.x+card1.width/4, card1.y+card1.height/4, mouse.x, mouse.y) +math.pi/2
		end
	end
end


function Card:shrinkOthers()
	for i,v in ipairs(activeCards) do
		flux.to(v, 0.5, {offsetY = v.height / 2, scale = 1}):ease("backout")
	end
end

globalCardHoverTime = 0
function Card:checkHover(card)

	if player.aiming or card.scaleMod < 1 then return end
	if not card.posizionato and general:aabb(card.x + card.width / 4, card.y + card.height/4, card.width / 2, card.height/2, mouse.x, mouse.y, 1, 1) then
		card.hover = true
	else
		card.hover = false
	end
end


function checkHoverPosizionato()
	for c,card in ipairs(union(inCampoCards,inCampoCards2)) do 
		if card.posizionato and general:aabb(card.x, card.y, card.width/2, card.height/2, mouse.x, mouse.y, 1, 1) then
			card.hoverposizionato = true
		else
			card.hoverposizionato = false
		end
	end
end


	--per attaccare
function Card:seleziona()
	for c,card in ipairs(inCampoCards) do --attaccante
		if (COMMISSIONE_NON_PAGATA) and (card.id == 11) and (giocatore == 1) then -- Aria
			card.attacco = true
		else
			card.attacco = false
		end
		if (giocatore == 1) and (not card.attacco) and card.hoverposizionato and card.Utente then
			if card.puoattaccare then
				card.attacco = true
				attaccante = card
				danno = card.ATK
			else
				card.attacco = false
				danno = 0
			end
		end
	end
	for c2,card2 in ipairs(inCampoCards2) do --attaccato
		if card2.hoverposizionato2 or card2.hoverposizionato then
			--if not card2.attaccata then
				general:danno(card2,attaccante)
				if hoster then
    				attaccante.puoattaccare = false
  				elseif connesso then
    				attaccante.puoattaccare = false
  				end
			--else
			--	card2.attaccata = false
			--end
		end
	end
end


function LOAD_CARDS()
	Card:loadAssets()

	--5 carte in mano
	for i=1,5 do
		SPAWN_CARD(screen.width / 2, screen.height - 90, i, false) -- ID is set inside the card:new()
	end

	LOAD_CARDS_STATS()
	LOAD_INFO()
end

function COLOR_CARDS()											--🎨
				--colore nome
	for i,self in ipairs (activeCards) do
		if self.INFO.classe == "OWNER" then
			self.color.r = 69
			self.color.g = 69
			self.color.b = 64
			self.color.a = 255
		elseif self.INFO.classe == "GOLDEN STAFF SEGRETARIO" then
			self.color.r = 227
			self.color.g = 215
			self.color.b = 43
			self.color.a = 255
		elseif self.INFO.classe == "CONTENT CREATOR" then
			self.color.r = 55
			self.color.g = 255
			self.color.b = 55
			self.color.a = 255
		elseif self.INFO.classe == "ARTISTA" then
			self.color.r = 55
			self.color.g = 55
			self.color.b = 255
			self.color.a = 255
		elseif self.INFO.classe == "MEME" then
			self.color.r = 155
			self.color.g = 255
			self.color.b = 55
			self.color.a = 255
		elseif self.INFO.classe == "ADMIN" then
			self.color.r = 255
			self.color.g = 52
			self.color.b = 38
			self.color.a = 255
		elseif self.INFO.classe == "INGEGNERE DEI MEMES" then
			self.color.r = 150
			self.color.g = 230
			self.color.b = 90
			self.color.a = 255
		elseif self.INFO.classe == "CANALE" then
			self.color.r = 40
			self.color.g = 10
			self.color.b = 150
			self.color.a = 255
		elseif self.INFO.classe == "MEMBRO ONORARIO" then
			self.color.r = 155
			self.color.g = 55
			self.color.b = 155
			self.color.a = 255
		elseif self.INFO.classe == "AZIONE" then
			self.color.r = 66
			self.color.g = 132
			self.color.b = 245
			self.color.a = 255
		elseif self.INFO.classe == "MINION" then
			self.color.r = 176 
			self.color.g = 194
			self.color.b = 255
			self.color.a = 255
		elseif self.INFO.classe == "MODERATORE" then
			self.color.r = 184
			self.color.g = 9
			self.color.b = 88
			self.color.a = 255
		end
	end
end


function SPAWN_CARD(x, y, number, drawn)
	if inventario.deck.total > 0 then
		Randomid = math.random(1,inventario.deck.total)
		id = inventario.deck[Randomid]
		table.remove(inventario.deck, Randomid)
		inventario.deck.total = inventario.deck.total-1
		table.insert(activeCards, Card:new(x, y, number,drawn, id))
		numeroCarteInMano = numeroCarteInMano + 1
	end
end

function MUOVI_CARTA()
	for i,card in ipairs(activeCards) do
		if (card.number > numCarta) and not card.posizionato then
			card.number = card.number -1
			card.x = card.x - (3*(card.width+card.spacing)/4)
		end
	end
end

function UPDATE_CARDS(dt)
	COLOR_CARDS()
	local count = 0
	for i, card in ipairs(activeCards) do
		if card.hover then
			count = count + 1
		end
		Card:update(dt,card)
	end
end


function DRAW_CARDS()																									--✏️
    for c, card in ipairs(activeCards) do
    	if not card.posizionato then
        	Card:draw(card)
        end
    end

    for c, card in ipairs(inCampoCards) do
        Card:draw(card)
    end
end

function Card:draw(card)
	if not card.morta then																						--✏️
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))										--🎨
			--carte posizionate
		if card.posizionato then
			--cornice Utente/Reazione
			DRAW_CARD_STATS(card,card.x,card.y,1/2,1/2,0,0,
				card.x,card.y,
				4,0.61,
				7,card.y + 3*card.height/8,	--ATK
				4,2)	--Mana

			--se in attacco
			if card.attacco then
				love.graphics.draw(ATKimg, card.x+card.width/4, card.y+card.height/4, attacco_R, 1, 1, ATKimg:getWidth()/2, ATKimg:getHeight()/2)
			end
			--se attaccata
			if card.attaccata then
				love.graphics.draw(HPimg, card.x , card.y, card.r)
			end

			if card.stato.STORDITO then
				love.graphics.draw(STORDITOimg, card.x , card.y, card.r)
			end

			if card.stato.AVVELENATO then
				love.graphics.draw(VELENOimg, card.x , card.y, card.r)
			end

			if not card.puoabilita2 then
				love.graphics.draw(ANNULLATOimg, card.x , card.y, card.r)
			end

			if card.immune then
				love.graphics.draw(IMMUNEimg, card.x , card.y, card.r)
			end

		else --non posizionate

			DRAW_CARD_STATS(card,
				card.x + card.width/2,card.y + card.offsetY,card.scale * card.scaleMod/2,card.scale/2,card.width / 2, card.height / 2,
				card.x + card.width /4,card.y + card.offsetY/2,
				2,1,
				1 , card.y + 15*card.offsetY/12,	--ATK
				2,1.34)								--Mana

		end
		DRAW_INFO()
	end
end


function LOAD_CARDS_STATS()
	CARDstats = {Name,ATK,Mana,HP}
	CARDstats.Name = {font,Width,Height,scale}
	CARDstats.ATK = {font,Width,Height}
	CARDstats.Mana = {font,Width,Height}
	CARDstats.HP = {font,Width,Height}
end

function DRAW_CARD_STATS(card,a,b,c,d,e,f,g,h,i,j,k,l,m,n)												--✏️

	if ((hoster and (Testo[1] == "sonostatoobbligato" or Testo[1] == "SonoStatoObbligato" or Testo[1] == "SONOSTATOOBBLIGATO"
	 or Testo[1] == "sono stato obbligato" or Testo[1] == "Sono Stato Obbligato" or Testo[1] == "SONO STATO OBBLIGATO"))
	 or (connesso and (Testo[2] == "sonostatoobbligato" or Testo[2] == "SonoStatoObbligato" or Testo[2] == "SONOSTATOOBBLIGATO"
	 or Testo[2] == "sono stato obbligato" or Testo[2] == "Sono Stato Obbligato" or Testo[2] == "SONO STATO OBBLIGATO")))
	 and card.id == 8 then
		love.graphics.draw(love.graphics.newImage("assets/cards/cardimg/cardimg108.png"), a, b, card.r, c, d, e, f)
	elseif ((hoster and (Testo[1] == "Jawier")) or (connesso and (Testo[2] == "Jawier")))
	 and (card.id == 1 or card.id == 25) then
		love.graphics.draw(love.graphics.newImage("assets/cards/cardimg/cardimg101.png"), a, b, card.r, c, d, e, f)
	elseif ((hoster and (Testo[1] == "jawier")) or (connesso and (Testo[2] == "jawier")))
	 and (card.id == 1 or card.id == 25) then
		love.graphics.draw(love.graphics.newImage("assets/cards/cardimg/cardimg201.png"), a, b, card.r, c, d, e, f)
	elseif ((hoster and (Testo[1] == "JAWIER")) or (connesso and (Testo[2] == "JAWIER")))
	 and (card.id == 1 or card.id == 25) then
		love.graphics.draw(love.graphics.newImage("assets/cards/cardimg/cardimg301.png"), a, b, card.r, c, d, e, f)
	else
		love.graphics.draw(love.graphics.newImage("assets/cards/cardimg/cardimg"..card.id..".png"), a, b, card.r, c, d, e, f)
	end
	
	love.graphics.setColor(love.math.colorFromBytes(card.color.r,card.color.g,card.color.b,255))								--🎨
	if card.Utente then
		love.graphics.draw(TOPimg, g, h, card.r)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))														--🎨
		love.graphics.draw(BOTimg, g, h, card.r)
	else
		love.graphics.draw(MALTOPimg, g, h-10, card.r)
		love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))														--🎨
		love.graphics.draw(MALBOTimg, g, h-10, card.r)
	end

		--Scritte-font
	love.graphics.setFont(Font.cardName)
			--NAME
		CARDstats.Name.font = love.graphics.getFont()
		CARDstats.Name.Width = CARDstats.Name.font:getWidth(card.Name)
		CARDstats.Name.Height = CARDstats.Name.font:getHeight()/4
		if CARDstats.Name.Width > 266 then
			CARDstats.Name.scale = card.scale/2
		else
			CARDstats.Name.scale = card.scale
		end
			--ATK
		CARDstats.ATK.font = love.graphics.getFont()
		CARDstats.ATK.Width = CARDstats.ATK.font:getWidth(card.ATK)
		CARDstats.ATK.Height = CARDstats.ATK.font:getHeight()/4
		if CARDstats.ATK.Width > 90 then
			CARDstats.ATK.Width = 90
		end
			--Mana
		CARDstats.Mana.font = love.graphics.getFont()
		CARDstats.Mana.Width = CARDstats.ATK.font:getWidth(card.ATK)
		CARDstats.Mana.Height = CARDstats.ATK.font:getHeight()/4
		if CARDstats.Mana.Width > 90 then
			CARDstats.Mana.Width = 90
		end
			--HP
		CARDstats.HP.font = love.graphics.getFont()
		CARDstats.HP.Width = CARDstats.HP.font:getWidth(card.HP)
		CARDstats.HP.Height = CARDstats.HP.font:getHeight()/4
		if CARDstats.HP.Width > 90 then
			CARDstats.HP.Width = 90
		end
	
	if card.Utente then --Utenti
			--ATK
		love.graphics.setColor(love.math.colorFromBytes(100,100,100,220))
		love.graphics.rectangle("fill",card.x + 3*card.width/(11*k) , l-2.5, CARDstats.ATK.Width,CARDstats.ATK.Height)
		love.graphics.setColor(love.math.colorFromBytes(200,200,200,255))
		love.graphics.print(card.ATK,card.x + 3*card.width/(11*k) ,l, card.r, 1/4, 1/4)
			--Mana
		love.graphics.setColor(love.math.colorFromBytes(250,250,250,255))
		love.graphics.draw(Pingimg, card.x+30+card.width/m, card.y-170+card.height/n, card.r, 1/40, 1/40)
		love.graphics.print(card.Mana, card.x+48+card.width/m, card.y-156+card.height/n, card.r, 1/3, 1/3, CARDstats.Mana.Width/3, CARDstats.Mana.Height*1.5)
			--HP
		love.graphics.setColor(love.math.colorFromBytes(100,100,100,220))
		love.graphics.rectangle("fill", 25+card.x + 3*card.width/(11*k) , 22.5+l, CARDstats.HP.Width,CARDstats.HP.Height)
		love.graphics.setColor(love.math.colorFromBytes(200,200,200,255))
		love.graphics.print(card.HP, 25+card.x + 3*card.width/(11*k) , 25+l, card.r, 1/4, 1/4)
	else 		-- Reazioni
			--Mana
		love.graphics.setColor(love.math.colorFromBytes(250,250,250,255))
		love.graphics.print(card.Mana, card.x+card.width/m, card.y+card.height/n, card.r, 1/3, 1/3, CARDstats.Mana.Width/3, CARDstats.Mana.Height*1.5)
	end
		--Name
	love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
	love.graphics.print(card.Name,card.x + card.width/i, (card.y + ((7*j)*card.height/11)), card.r, CARDstats.Name.scale* card.scaleMod/3,card.scale/3, CARDstats.Name.Width/2, card.height / 4)
end


function LOAD_INFO()
	INFOstats = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2,MAXWidth}
	INFOstats.classe = {font,Width,Height,color}
	INFOstats.Tabilita1 = {font,Width,Height}
	INFOstats.tabilita1 = {font,Width,Height}
	INFOstats.Tabilita2 = {font,Width,Height}
	INFOstats.tabilita2 = {font,Width,Height}

	INFOstats2 = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2,MAXWidth}
	INFOstats2.classe = {font,Width,Height,color}
	INFOstats2.Tabilita1 = {font,Width,Height}
	INFOstats2.tabilita1 = {font,Width,Height}
	INFOstats2.Tabilita2 = {font,Width,Height}
	INFOstats2.tabilita2 = {font,Width,Height}
end

function DRAW_INFO()
	for i, card in ipairs(union(activeCards,inCampoCards2)) do

		if (card.hover) or (card.hoverposizionato) or (card.hoverposizionato2) then
			--statishe testo
			love.graphics.setFont(Font.cardInfo)
			INFOstats.classe.font = love.graphics.getFont()
			INFOstats.classe.Width  = INFOstats.classe.font:getWidth(card.INFO.classe)
			INFOstats.classe.Height = INFOstats.classe.font:getHeight()
			INFOstats.Tabilita1.font = love.graphics.getFont()
			INFOstats.Tabilita1.Width  = INFOstats.Tabilita1.font:getWidth(card.INFO.Tabilita1)
			INFOstats.Tabilita1.Height = INFOstats.Tabilita1.font:getHeight()
			INFOstats.tabilita1.font = love.graphics.getFont()
			INFOstats.tabilita1.Width  = INFOstats.tabilita1.font:getWidth(card.INFO.tabilita1)
			INFOstats.tabilita1.Height = INFOstats.tabilita1.font:getHeight()
			INFOstats.Tabilita2.font = love.graphics.getFont()
			INFOstats.Tabilita2.Width  = INFOstats.Tabilita2.font:getWidth(card.INFO.Tabilita2)
			INFOstats.Tabilita2.Height = INFOstats.Tabilita2.font:getHeight()
			INFOstats.tabilita2.font = love.graphics.getFont()
			INFOstats.tabilita2.Width  = INFOstats.tabilita2.font:getWidth(card.INFO.tabilita2)
			INFOstats.tabilita2.Height = INFOstats.tabilita2.font:getHeight()
				--riga più larga
			INFOstats.MAXWidth = general:greaterNumber5(INFOstats.classe.Width, INFOstats.Tabilita1.Width, INFOstats.tabilita1.Width, INFOstats.Tabilita2.Width, INFOstats.tabilita2.Width)

				--scrittura e colori testi
		
			love.graphics.setColor(love.math.colorFromBytes(100,100,100,220))
			love.graphics.rectangle("fill", mouse.x, mouse.y, INFOstats.MAXWidth, 
				-((INFOstats.classe.Height*card.INFOlinee.classe)+(INFOstats.Tabilita1.Height*card.INFOlinee.Tabilita1)+(INFOstats.tabilita1.Height*card.INFOlinee.tabilita1)+(INFOstats.Tabilita2.Height*card.INFOlinee.Tabilita2)+(INFOstats.tabilita2.Height*card.INFOlinee.tabilita2)))
			love.graphics.setColor(love.math.colorFromBytes(card.color.r,card.color.g,card.color.b,card.color.a))
			love.graphics.print(card.INFO.classe, mouse.x, mouse.y-INFOstats.classe.Height*(card.INFOlinee.tabilita2+card.INFOlinee.Tabilita2+card.INFOlinee.tabilita1+card.INFOlinee.Tabilita1+card.INFOlinee.classe))
			love.graphics.setColor(love.math.colorFromBytes(255,0,0,255))
			love.graphics.print(card.INFO.Tabilita1, mouse.x, mouse.y-INFOstats.Tabilita1.Height*(card.INFOlinee.tabilita2+card.INFOlinee.Tabilita2+card.INFOlinee.tabilita1+card.INFOlinee.Tabilita1))
			love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
			love.graphics.print(card.INFO.tabilita1, mouse.x, mouse.y-INFOstats.tabilita1.Height*(card.INFOlinee.tabilita2+card.INFOlinee.Tabilita2+card.INFOlinee.tabilita1))
			love.graphics.setColor(love.math.colorFromBytes(255,0,0,255))
			love.graphics.print(card.INFO.Tabilita2, mouse.x, mouse.y-INFOstats.Tabilita2.Height*(card.INFOlinee.tabilita2+card.INFOlinee.Tabilita2))
			love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))
			love.graphics.print(card.INFO.tabilita2, mouse.x, mouse.y-INFOstats.tabilita2.Height*(card.INFOlinee.tabilita2))
		end
	end
end