cards = {}
inManoCards = {}
inCampoCards = {}
inCampoCards2 = {}
CimiteroCards = {} --fare draw per cimitero

img1 = love.graphics.newImage("assets/cards/cardimg1.png")

card = class{
	init = function(self,id,x,y,num)
		self.id = id
		self.x = x 
		self.y = y 
		self.num = num
		self.color = {r=0,g=0,b=0} --🎨
		self.width = img1:getWidth()/2
		self.height = img1:getHeight()/2
		self.scale = 1/2
		self.selezionata = false
		self.morta = false
		self.puoabilita = false
		self.puoabilita2 = true
		self.attacco = false
		self.abilita = false
		self.avvelenata = false
		self.fiamme = false
		self.stordita = false
		self.immune = false
		self.info = {classe="",Tabilita1="",tabilita1="",Tabilita2="",tabilita2=""}
		self.infoLinee = {classe=0,Tabilita1=0,tabilita1=0,Tabilita2=0,tabilita2=0}
		self.utente = true
		self.name = ""
		self.ATK = 0
		self.MANA = 0
		self.HP = 0
	cards:addStats(self)
	cards:addColor(self) --🎨
	end,
}

function cards:spawn(x,y,id)
	if cards.deck.total > 0 then
		local Randomid
		if id == nil then
			Randomid = math.random(1,cards.deck.total)
			ID = cards.deck.mazzo[Randomid]
		else
			ID = id
		end
		table.remove(cards.deck.mazzo, Randomid)
		cards.deck.total = cards.deck.total-1
		num = #inManoCards+1
		table.insert(inManoCards,card(ID,x,y,num))
		cards:addStats(inManoCards[#inManoCards])
		cards:addColor(inManoCards[#inManoCards])
	elseif tutorial.bool then
		ID = id
		num = #inManoCards+1
		table.insert(inManoCards,card(ID,x,y,num))
		cards:addStats(inManoCards[#inManoCards])
		cards:addColor(inManoCards[#inManoCards])
	end
end

function cards:moveCards(num)
	for c,card in ipairs(inManoCards) do
		if c >= num then
			card.num = card.num-1
		end
	end
end

function cards:addStats(card)
	--proprietà carte 			--se cambi qualcosa qui cambialo anche in "inventario.lua"--analisi carte su Excel
	if card.id == 100 then -- Pepone
		card.utente = true
		card.name = "PEPONE"
		card.ATK = 666
		card.MANA = 0
		card.HP = 420
		card.info.classe = "OWNER"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[è il suo gioco:
 vince]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 1 then -- Sciagghi
		card.utente = true
		card.name = "SCIAGGHI"
		card.ATK = 2800
		card.MANA = 2
		card.HP = 8000
		
		card.info.classe = "GOLDEN STAFF SEGRETARIO"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Canale di Scooby-Doo:
 una carta guadagna ATK pari a
 metà dell'ATK di questa carta
 (tasto dx per selezionare la carta)]]
		card.info.Tabilita2 = "Abilità passiva"
		card.info.tabilita2 = 
[[La prima repubblica: 
 una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificarli per
 evocare il Pepone]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 4
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 5
 	elseif card.id == 2 then -- Lucy
		card.utente = true
		card.name = "LUCY"
		card.ATK = 1200
		card.MANA = 0
		card.HP = 8000
			
		card.info.classe = "GOLDEN STAFF SEGRETARIO"
		card.info.Tabilita1 = "Abilità passiva"
		card.info.tabilita1 = 
[[La prima repubblica: 
 una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificarli per
 evocare il Pepone]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 5
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 3 then -- VOID
		card.utente = true
		card.name = "VOID"
		card.ATK = 2000
		card.MANA = 0
		card.HP = 7500
				
		card.info.classe = "GOLDEN STAFF SEGRETARIO"
		card.info.Tabilita1 = "Abilità passiva"
		card.info.tabilita1 = 
[[La prima repubblica: 
 una volta che hai piazzato 
 tutti i segretari sul campo 
 puoi sacrificarli per
 evocare il Pepone]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 5
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 4 then -- Hardcore Jack
		card.utente = true
		card.name = "HARDCORE JACK"
		card.ATK = 1500
		card.MANA = 3
		card.HP = 10000
		
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[aggiungi 3 BREAD al tuo mazzo]] --da provare
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 5 then -- Trill
		card.utente = true
		card.name = "TRILL"
		card.ATK = 5000
		card.MANA = 5
		card.HP = 5000
		
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Kill:
 uccidi un carta avversaria
 (tasto dx per selezionare la carta)]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 6 then -- Gin Fotonic
		card.utente = true
		card.name = "GIN FOTONIC"
		card.ATK = 1300
		card.MANA = 4
		card.HP = 12000
		
		card.info.classe = "CONTENT CREATOR"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[OSU:
 fai danno a ritmo
 (tasto dx per colpire i cerchi)]]
		card.info.Tabilita2 = "Consiglio"
		card.info.tabilita2 = 
[[se fallisci attiva l'abilità
 di un'altra GIN FOTONIC per
 continuare l'attacco]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 3
	elseif card.id == 7 then -- Shadow Grimm
		card.utente = true
		card.name = "SHADOW GRIMM"
		card.ATK = 3000
		card.MANA = 4
		card.HP = 12000
		
		card.info.classe = "CONTENT CREATOR"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Urlo del sium:
 stordisce gli avversari
 (tasto dx per selezionare le carte)]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 8 then -- Nabboleone
		card.utente = true
		card.name = "NABBOLEONE"
		card.ATK = 1700
		card.MANA = 3
		card.HP = 11000
		
		card.info.classe = "ADMIN"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Gangam Style:
 avvelena a una carta a scelta
 (tasto dx per selezionare la carta)]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 9 then -- lolfun
		card.utente = true
		card.name = "LOLFUN"
		card.ATK = 1800
		card.MANA = 3
		card.HP = 10000
		
		card.info.classe = "CONTENT CREATOR"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[una carta guadagna ATK pari
 all'ATK di questa carta
 (tasto dx per selezionare la carta)]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 10 then -- Padanian Shitposter
		card.utente = true
		card.name = "PADANIAN SHITPOSTER"
		card.ATK = 2500
		card.MANA = 4
		card.HP = 5000
		
		card.info.classe = "CONTENT CREATOR"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[Dimezza gli HP
 di ogni carta aversaria]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 11 then -- Aria
		card.utente = true
		card.name = "ARIA"
		card.ATK = 200
		card.MANA = 4
		card.HP = 8000
		
		card.info.classe = "ARTISTA"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[COMMISSIONE NON PAGATA:
 attacchi infiniti per 5 secondi]]
		card.info.Tabilita2 = "Consiglio"
		card.info.tabilita2 = 
[[Team Up:
 quando COMMISSIONE NON PAGATA
 è attiva l'ATK di Aria raddoppia
 per ogni Aria sul campo]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 4
	elseif card.id == 12 then -- Charlie Ebony
		card.utente = true
		card.name = "CHARLIE EBONY"
		card.ATK = 2900
		card.MANA = 4
		card.HP = 4500
		
		card.info.classe = "CONTENT CREATOR"
		card.info.Tabilita1 = "Abilità passiva"
		card.info.tabilita1 = 
[[sacrifica questa carta
 per ottenere 4 MANA anzichè 1]]
		card.info.Tabilita2 = "Abilità a evocazione"
		card.info.tabilita2 = 
[[raddoppia gli HP 
 di ogni carta sul
 tuo terreno]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 3
	elseif card.id == 13 then -- Juj
		card.utente = true
		card.name = "JUJ"
		card.ATK = 1400
		card.MANA = 6
		card.HP = 6500
				
		card.info.classe = "CONTENT CREATOR"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Bello stu' 'rulog:
 un utente avversario diventa tuo
 (tasto dx per selezionare la carta)]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 14 then -- Sakura
		card.utente = true
		card.name = "SAKURA"
		card.ATK = 3000
		card.MANA = 4
		card.HP = 9000
				
		card.info.classe = "ARTISTA"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[polvere di stelle
 (muovi il mouse per disegnare Stelle)]]
		card.info.Tabilita2 = "Consiglio"
		card.info.tabilita2 = 
[[La carta obbiettivo è 
 la carta avversaria presente 
 da più tempo]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 3
	elseif card.id == 15 then -- Mariottide
		card.utente = true
		card.name = "MARIOTTIDE"
		card.ATK = 15000
		card.MANA = 0
		card.HP = 20000
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Disabilità passiva"
		card.info.tabilita1 = 
[[si elimina da sola
 dopo 2 turni]]
		card.info.Tabilita2 = "Consiglio"
		card.info.tabilita2 = 
[[evoca un altro MARIOTTIDE
 il turno dopo
 per allungare l'effetto]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 3
	elseif card.id == 16 then -- La Morte Oscura
		card.utente = true
		card.name = "MORTE OSCURA"
		card.ATK = 1700
		card.MANA = 4
		card.HP = 10000
				
		card.info.classe = "INGEGNERE DEI MEMES"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Laser della Morte:
(tieni premuto tasto dx e rilascalo)]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 17 then -- Plytlas
		card.utente = true
		card.name = "PLYTLAS"
		card.ATK = 2000
		card.MANA = 2
		card.HP = 8500
			
		card.info.classe = "CONTENT CREATOR"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[ogni utente avversario di classe 
 "CONTENT CREATOR" o "GOLDEN STAFF SEGRETARIO" 
 avversario perde 500 ATK]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 18 then -- Inazuma sensei
		card.utente = true
		card.name = "INAZUMA SENSEI"
		card.ATK = 1700
		card.MANA = 4
		card.HP = 10000
			
		card.info.classe = "CONTENT CREATOR"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Telecinesi:
 muovi le carte avversarie
 (tenere premuto tasto dx per 
 raccogliere le carte)]]
		card.info.Tabilita2 = "Consiglio"
		card.info.tabilita2 = 
[[durante Telecinesi
 se muovi le carte in verticale
 le stordisci,
 in orizzontale le fai danno]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 4
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 4
	elseif card.id == 19 then -- Zio Pera
		card.utente = true
		card.name = "ZIO PERA"
		card.ATK = 1200
		card.MANA = 3
		card.HP = 8000
				
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
"Aculei dal culo: \n spara 6 aculei \n (tasto dx per selezionare la carta) "
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 20 then -- Doppialex
		card.utente = true
		card.name = "DOPPIALEX"
		card.ATK = 2000
		card.MANA = 3
		card.HP = 10000
			
		card.info.classe = "CONTENT CREATOR"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[stordisce 3 carte avversarie]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 21 then -- Ping
		card.utente = true
		card.name = "PING"
		card.ATK = 2000
		card.MANA = 4
		card.HP = 4000
		
		card.info.classe = "ADMIN"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
"Ho programmato io questo gioco! \n se ci sono 2 carte uguali sul campo \n si disintegrano entrambe "
		card.info.Tabilita2 = "Consiglio"
		card.info.tabilita2 = 
[[  -è una D4C reference]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 4
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 1
	elseif card.id == 22 then -- Cosmi
		card.utente = true
		card.name = "COSMI"
		card.ATK = 1900
		card.MANA = 4
		card.HP = 10000
		
		card.info.classe = "CONTENT CREATOR"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Explosion:
 infligge danno ad area
 (tasto dx per selezionare l'area)]]
		card.info.Tabilita2 = "Consiglio"
		card.info.tabilita2 = 
[[minore è la distanza dal centra
 maggiore è il danno
 danno massimo: 2500]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 3
	elseif card.id == 23 then -- Cring3_Crimson
		card.utente = true
		card.name = "CRING3_CRIMSON"
		card.ATK = 1700
		card.MANA = 2
		card.HP = 13500
				
		card.info.classe = "INGEGNERE DEI MEMES"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[passano 2 turni]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 24 then -- Fat Chad Yoshi
		card.utente = true
		card.name = "FAT CHAD YOSHI"
		card.ATK = 2500
		card.MANA = 5
		card.HP = 7500
				
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Annulla l'effetto di una carta
 (tasto dx per selezionare la carta)]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 25 then -- Mortius
		card.utente = true
		if ((hoster and (testo[1] == "Morbius" or testo[1] == "morbius" or testo[1] == "MORBIUS"))
		 or (connesso and (testo[2] == "Morbius" or testo[2] == "morbius" or testo[2] == "MORBIUS"))) then
			card.name = "MORBIUS"
		else
			card.name = "MORTIUS"
		end
		card.ATK = 2000
		card.MANA = 4
		card.HP = 6000
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[evoca un minion
 (tasto dx per selezionare lo spazio)]]
		card.info.Tabilita2 = "frase ad effetto"
		card.info.tabilita2 = 
[[FINO ALLA MORTE ED OLTRE]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 1
 	elseif card.id == 125 then -- Mini Mortius
		card.utente = true
		if ((hoster and (testo[1] == "Morbius" or testo[1] == "morbius" or testo[1] == "MORBIUS"))
		 or (connesso and (testo[2] == "Morbius" or testo[2] == "morbius" or testo[2] == "MORBIUS"))) then
			card.name = "MINI MORBIUS"
		elseif ((hoster and (testo[1] == "Morbius" or testo[1] == "morbius" or testo[1] == "MORBIUS"))
		 or (connesso and (testo[2] == "Morbius" or testo[2] == "morbius" or testo[2] == "MORBIUS"))) then

		else
			card.name = "MINI MORTIUS"
		end
		card.ATK = 500
		card.MANA = 0
		card.HP = 800
			
		card.info.classe = "MINION"
		card.info.Tabilita1 = "FRASE AD EFFETTO"
		card.info.tabilita1 = 
[[PRONTO A SERVIRE]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 26 then -- Verel
		card.utente = true
		card.name = "VEREL"
		card.ATK = 3000
		card.MANA = 5
		card.HP = 3000
			
		card.info.classe = "ARTISTA"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Squalo: mangia gli aversari
 (danno pari all'ATK di questa carta)]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 27 then -- Il sam
		card.utente = true
		card.name = "IL.SAM"
		card.ATK = 5500
		card.MANA = 2
		card.HP = 7000
			
		card.info.classe = "MODERATORE"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[rendi una carta
 classe "INGEGNERE DEI MEMES"]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 28 then -- Esagono
		card.utente = true
		card.name = "ESAGONO"
		card.ATK = 1800
		card.MANA = 2
		card.HP = 6000
			
		card.info.classe = "ADMIN"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[tutte le carte sul tuo terreno
 costano 1 MANA in meno]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 29 then -- Disegni e Fan Art
		card.utente = false
		card.name = "DISEGNI E FAN ART"
		card.ATK = 0
		card.MANA = 1
		card.HP = 4000
				
		card.info.classe = "CANALE"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[ad ogni ARTISTA:
+800 ATK
+800 HP]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 30 then -- BAN
		card.utente = false
		card.name = "BAN"
		card.ATK = 0
		card.MANA = 3
		card.HP = 4000
				
		card.info.classe = "AZIONE"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[Kill:
 uccidi un carta avversaria
 (tasto dx per selezionare la carta)]]
		card.info.Tabilita2 = "Consiglio"
		card.info.tabilita2 = 
[[se ritiri l'effetto puoi utilizzarlo dopo]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 1
 	elseif card.id == 31 then -- Demon Core
		card.utente = false
		card.name = "DEMON CORE"
		card.ATK = 0
		card.MANA = 7
		card.HP = 4000
		
		card.info.classe = "MEME"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[Cancro:
 uccidi tutte le carte
 sul terreno tra 3 turni]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 32 then -- #memes
		card.utente = false
		card.name = "#MEMES"
		card.ATK = 0
		card.MANA = 1
		card.HP = 4000
				
		card.info.classe = "CANALE"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[ad ogni INGEGNERE DEI MEMES:
 +800 ATK
 +800 HP]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 33 then -- Made in Heaven
		card.utente = false
		card.name = "MADE IN HEAVEN"
		card.ATK = 0
		card.MANA = 9
		card.HP = 4000
			
		card.info.classe = "AZIONE"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[la partita si
 conclude tra 2 minuti]]
		card.info.Tabilita2 = "Consiglio"
		card.info.tabilita2 = 
[[Il timer accellera ma
 si può resettare se
 evochi un altro Made in Heaven]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 3
	elseif card.id == 34 then -- Moyai
		card.utente = false
		card.name = "MOYAI"
		card.ATK = 0
		card.MANA = 2
		card.HP = 4000
			
		card.info.classe = "MEME"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[una carta avversaria 
 perde 9000 ATK
 (tasto dx per selezionare la carta)]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 35 then -- Kronk Drip
		card.utente = false
		card.name = "KRONK DRIP"
		card.ATK = 0
		card.MANA = 2
		card.HP = 4000
			
		card.info.classe = "MEME"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[+1000 HP a ogni carta sul tuo terreno]]
		card.info.Tabilita2 = "Abilità a evocazione"
		card.info.tabilita2 = 
[[-100 ATK a ogni carta sul terreno avversario]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 1
	elseif card.id == 36 then -- IL DVCE
		card.utente = true
		card.name = " IL DVCE"
		card.ATK = 3000
		card.MANA = 3
		card.HP = 8000
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = --da provare
[[aggiungi una carta a caso al tuo mazzo]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 37 then -- Carly
		card.utente = true
		card.name = "CARLY"
		card.ATK = 3000
		card.MANA = 3
		card.HP = 8000
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Switch
scambia ATK e HP di una carta]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 38 then -- Raiden
		card.utente = true
		card.name = "RAIDEN"
		card.ATK = 3000
		card.MANA = 0
		card.HP = 3000
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità passiva"
		card.info.tabilita1 = 
[[c'è una possibilità su 15
 di parare il colpo]]
		card.info.Tabilita2 = "Abilità passiva"
		card.info.tabilita2 = 
[[c'è una possibilità su 25
 di danneggiare la carta avversaria
 che sta attaccando questa carta]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 3
	elseif card.id == 39 then -- Edd
		card.utente = true
		card.name = "EDD"
		card.ATK = 1500
		card.MANA = 0
		card.HP = 2500
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità passiva"
		card.info.tabilita1 = 
[[tutti gli Utenti di classe
"GOLDEN STAFF SEGRETARIO"
perdono -700 ATK e -100 HP]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 40 then -- Fizz
		card.utente = true
		card.name = "FIZZ"
		card.ATK = 2000
		card.MANA = 3
		card.HP = 8000
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[Super Cute:
 lancia cuori, curano 100 HP l'uno]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 41 then -- Uomo Piccione
		card.utente = true
		card.name = "UOMO PICCIONE"
		card.ATK = 3000
		card.MANA = 2
		card.HP = 8500
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[ogni carta sul terreno perde
	-100 HP]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 42 then -- Schrödinger
		card.utente = true
		card.name = "SCHRODINGER"
		card.ATK = 1600
		card.MANA = 3
		card.HP = 8000
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[Questa carta è immune al primo attacco]]
		card.info.Tabilita2 = "Abilità passiva"
		card.info.tabilita2 = 
[[se Verel è sul campo questa carta 
 guadagna +500 ATK e + 300 HP]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 2
	elseif card.id == 43 then -- Doom Slayer
		card.utente = true
		card.name = "DOOM SLAYER"
		card.ATK = 6000
		card.MANA = 4
		card.HP = 8500
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[+500 HP a questa carta]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 44 then -- Perry
		card.utente = false
		card.name = "PERRY L'ORNITORINCO"
		card.ATK = 0
		card.MANA = 2
		card.HP = 4000
			
		card.info.classe = "MEME"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[rende una carta immune al prossimo attacco]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 45 then -- B per Basato
		card.utente = true
		card.name = "B PER BASATO"
		card.ATK = 3000
		card.MANA = 0
		card.HP = 1500
			
		card.info.classe = "ARTISTA"
		card.info.Tabilita1 = "Abilità passiva"
		card.info.tabilita1 = 
[[possibilità di danno critico maggiore]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 46 then -- Summer
		card.utente = true
		card.name = "SUMMER"
		card.ATK = 3000
		card.MANA = 3
		card.HP = 4000
			
		card.info.classe = "ARTISTA"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = --da controllare
[[Bread:
 cura una carta di un valore
 pari all'ATK di questa carta
 (tasto dx per selezionare la carta)]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 4
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 47 then -- Gato Sburato
		card.utente = true
		card.name = "LAC REATURA"
		card.ATK = 3500
		card.MANA = 1
		card.HP = 3500
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = --da controllare
[[pesca una carta]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 48 then -- Bread
		card.utente = false
		card.name = "BREAD"
		card.ATK = 0
		card.MANA = 1
		card.HP = 4000
			
		card.info.classe = "MEME"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = --da controllare
[[cura una carta del 30%]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 49 then -- Neco Arc
		card.utente = false
		card.name = "NECO ARC"
		card.ATK = 0
		card.MANA = 1
		card.HP = 4000
			
		card.info.classe = "MEME"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = --da controllare
[[aumenta l'attacco di una carta +1000 ATK]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 50 then -- Sfango
		card.utente = false
		card.name = "SFANGO"
		card.ATK = 0
		card.MANA = 0
		card.HP = 4000
			
		card.info.classe = "MEME"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = --da controllare
[[pesca 2 carte]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 51 then -- Mr Caputo
		card.utente = true
		card.name = "MR CAPUTO"
		card.ATK = 3000
		card.MANA = 4
		card.HP = 3500
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 =
[[Wall Text:
 copri la visuale all'avversario]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 52 then -- Temmie Shop
		card.utente = false
		card.name = "TEMMIE SHOP"
		card.ATK = 0
		card.MANA = 3
		card.HP = 4000
			
		card.info.classe = "MEME"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 =
[[evoca una carta Utente dal
 negozio di Temmie]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 53 then -- Sboro
		card.utente = false
		card.name = "SBORO"
		card.ATK = 0
		card.MANA = 1
		card.HP = 4000
			
		card.info.classe = "CANALE"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 =
[[ogni "GOLDEN STAFF SEGRETARIO"
guadagna +1000 ATK e +500 HP 
ogni "ADMIN guadagna +1000 HP"]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 54 then -- Death Note
		card.utente = false
		card.name = "DEATH NOTE"
		card.ATK = 0
		card.MANA = 4
		card.HP = 4000
			
		card.info.classe = "AZIONE"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = --da provare
[[scrivi il nome di una carta ed 
 essa muore]]
		card.info.Tabilita2 = "Consiglio"
		card.info.tabilita2 = 
[[tutto in maiuscolo
 INVIO per confermare]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 1
 		card.infoLinee.tabilita2 = 2
	elseif card.id == 55 then -- Local Troller
		card.utente = true
		card.name = "LOCAL TROLLER"
		card.ATK = 3000
		card.MANA = 20
		card.HP = 2000
			
		card.info.classe = "MEMBRO ONORARIO"
		card.info.Tabilita1 = "Abilità segreta"
		card.info.tabilita1 =
[[è un segreto]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 56 then -- Erba
		card.utente = false
		card.name = "ERBA"
		card.ATK = 0
		card.MANA = 15
		card.HP = 4000
			
		card.info.classe = "MEME"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 =
[[se c'è un "GOLDEN STAFF SEGRETARIO" o un
 "ADMIN" mel campo nemico
 l'avversario chiude il gioco]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 3
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 57 then -- DUO
		card.utente = false
		card.name = "DUO"
		card.ATK = 0
		card.MANA = 6
		card.HP = 4000
				
		card.info.classe = "CANALE"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[solo 2 Utenti ammessi
 nel campo avversario]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 58 then -- DUO
		card.utente = false
		card.name = "TRIO"
		card.ATK = 0
		card.MANA = 4
		card.HP = 4000
				
		card.info.classe = "CANALE"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[solo 3 Utenti ammessi
 nel campo avversario]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 59 then -- DUO
		card.utente = false
		card.name = "QUARTETTO"
		card.ATK = 0
		card.MANA = 2
		card.HP = 4000
				
		card.info.classe = "CANALE"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[solo 4 Utenti ammessi
 nel campo avversario]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 60 then -- verificazione
		card.utente = false
		card.name = "VERIFICAZIONE"
		card.ATK = 0
		card.MANA = 2
		card.HP = 4000
				
		card.info.classe = "CANALE"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[stordisce tutte le carte avversarie]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
 	elseif card.id == 61 then -- Alex
		card.utente = true
		card.name = "ALEX"
		card.ATK = 3000
		card.MANA = 3
		card.HP = 3000
				
		card.info.classe = "MODERATORE"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[stordisce 3 carte avversarie
 1 a piacere 2 a caso]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0

 	elseif card.id == 62 then -- Sole
		card.utente = false
		card.name = "SOLE"
		card.ATK = 0
		card.MANA = 2
		card.HP = 4000
				
		card.info.classe = "MEME"
		card.info.Tabilita1 = "Abilità a evocazione"
		card.info.tabilita1 = 
[[lancia un sole]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 1
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	elseif card.id == 63 then -- Incazzoso
		card.utente = true
		card.name = "INCAZZOSO"
		card.ATK = 3000
		card.MANA = 1
		card.HP = 3000
				
		card.info.classe = "INGEGNERE DEI MEMES"
		card.info.Tabilita1 = "Abilità speciale"
		card.info.tabilita1 = 
[[aggiungi una carta Reazione di classe "MEME"
 a caso alla tua mano]]
		card.info.Tabilita2 = ""
		card.info.tabilita2 = 
[[]]
 		card.infoLinee = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2}
 		card.infoLinee.classe = 1
 		card.infoLinee.Tabilita1 = 1
 		card.infoLinee.tabilita1 = 2
 		card.infoLinee.Tabilita2 = 0
 		card.infoLinee.tabilita2 = 0
	end
end

function cards:addColor(card) --🎨
			--colore nome
	if card.info.classe == "OWNER" then
		card.color.r = 69
		card.color.g = 69
		card.color.b = 64
	elseif card.info.classe == "GOLDEN STAFF SEGRETARIO" then
		card.color.r = 227
		card.color.g = 215
		card.color.b = 43
	elseif card.info.classe == "CONTENT CREATOR" then
		card.color.r = 55
		card.color.g = 255
		card.color.b = 55
	elseif card.info.classe == "ARTISTA" then
		card.color.r = 55
		card.color.g = 55
		card.color.b = 255
	elseif card.info.classe == "MEME" then
		card.color.r = 155
		card.color.g = 255
		card.color.b = 55
	elseif card.info.classe == "ADMIN" then
		card.color.r = 255
		card.color.g = 52
		card.color.b = 38
	elseif card.info.classe == "INGEGNERE DEI MEMES" then
		card.color.r = 150
		card.color.g = 230
		card.color.b = 90
	elseif card.info.classe == "CANALE" then
		card.color.r = 40
		card.color.g = 10
		card.color.b = 150
	elseif card.info.classe == "MEMBRO ONORARIO" then
		card.color.r = 155
		card.color.g = 55
		card.color.b = 155
	elseif card.info.classe == "AZIONE" then
		card.color.r = 66
		card.color.g = 132
		card.color.b = 245
	elseif card.info.classe == "MINION" then
		card.color.r = 176 
		card.color.g = 194
		card.color.b = 255
	elseif card.info.classe == "MODERATORE" then
		card.color.r = 184
		card.color.g = 9
		card.color.b = 88
	end
end

local cardimg = {}
function cards:load() --💾
        --copertina carte
    TOPBOT = love.graphics.newImage("assets/misc/TOPBOT.png")
	TOPimg = love.graphics.newQuad( 0, 0, TOPBOT:getWidth(), 56, TOPBOT)
	BOTimg = love.graphics.newQuad( 0, 56, TOPBOT:getWidth(), 117, TOPBOT)
	MALTOPimg = love.graphics.newImage("assets/misc/MALTOP.png")
	MALBOTimg = love.graphics.newImage("assets/misc/MALBOT.png")
	Pingimg = love.graphics.newImage("assets/misc/Ping.png")
	ATKimg = love.graphics.newImage("assets/misc/ATK.png")
	IMMUNEimg = love.graphics.newImage("assets/misc/IMMUNE.png")
	STORDITOimg = love.graphics.newImage("assets/misc/STORDITO.png")
	VELENOimg = love.graphics.newImage("assets/misc/VELENO.png")
	ANNULLATOimg = love.graphics.newImage("assets/misc/ANNULLATO.png")
	--backimg = gui.deck.img
	cards.maxCards = 63 --numero di carte totali nella collezione
	cardimg[100] = love.graphics.newImage("assets/cards/cardimg100.png")
	cardimg[125] = love.graphics.newImage("assets/cards/cardimg125.png")
	cardimg[108] = love.graphics.newImage("assets/cards/cardimg108.png")
	cardimg[101] = love.graphics.newImage("assets/cards/cardimg101.png")
	cardimg[201] = love.graphics.newImage("assets/cards/cardimg201.png")
	cardimg[301] = love.graphics.newImage("assets/cards/cardimg301.png")
	cards.deck = {}
	cards.deck.mazzo = {}
	cards.deck.max = 30 --massimo carte nel mazzo
	cards.deck.total = 0
	cards.copies = {}
	for i=1,cards.maxCards do
		cards.copies[i] = 0    --analisi doppioni
		cardimg[i] = love.graphics.newImage("assets/cards/cardimg"..i..".png")
	end

	cards:loadStats()
end


function cards:update(dt) --🔁
	for c,card in ipairs(inCampoCards) do
		if card.attacco then
			ATKr = general:getAngle(card.x+card.width/2, card.y+card.height/2, mouse.x, mouse.y) +math.pi/2
		end
	end
	for c,card in ipairs(general:union(inCampoCards,inManoCards)) do
		if general:aabb(card.x,card.y,card.width,card.height,mouse.x,mouse.y,1,1) then
			card.selezionata = true
		elseif not love.mouse.isDown(1) then
			card.selezionata = false
		end
		if card.attacco then
			attacco_R = general:getAngle(card.x+card.width/2, card.y+card.height/2, mouse.x, mouse.y) +math.pi/2
		end
	end
	for c,card in ipairs(inCampoCards2) do
		if general:aabb(card.x,card.y,card.width,card.height,mouse.x,mouse.y,1,1) then
			card.selezionata = true
		elseif not love.mouse.isDown(1) then
			card.selezionata = false
		end
	end
		--ogni carta nel campo giusto
	for c,card in ipairs(inCampoCards) do
		if card.y == campi_P_2[1].y then
			card.y = campi_P_1[1].y
        end
	end
	for c2,card2 in ipairs(inCampoCards2) do
		if card2.y == campi_P_1[1].y then
			card2.y = campi_P_2[1].y
        end
	end
	for c,card in ipairs(inManoCards) do
		card.x = 100+150*card.num
	end
end

local cardsStats = {}
local infoStats = {}
function cards:loadStats()
	cardsStats = {name,ATK,MANA,HP}
	cardsStats.name = {font,Width,Height,scale}
	cardsStats.ATK = {font,Width,Height}
	cardsStats.MANA = {font,Width,Height}
	cardsStats.HP = {font,Width,Height}

	infoStats = {classe,Tabilita1,tabilita1,Tabilita2,tabilita2,MAXWidth}
	infoStats.classe = {font,Width,Height,color}
	infoStats.Tabilita1 = {font,Width,Height}
	infoStats.tabilita1 = {font,Width,Height}
	infoStats.Tabilita2 = {font,Width,Height}
	infoStats.tabilita2 = {font,Width,Height}
end


function cards:drawStats(card) --✏️
	love.graphics.setColor(1,1,1) --🎨

	if ((hoster and (testo[1] == "sonostatoobbligato" or testo[1] == "SonoStatoObbligato" or testo[1] == "SONOSTATOOBBLIGATO"
	 or testo[1] == "sono stato obbligato" or testo[1] == "Sono Stato Obbligato" or testo[1] == "SONO STATO OBBLIGATO"))
	 or (connesso and (testo[2] == "sonostatoobbligato" or testo[2] == "SonoStatoObbligato" or testo[2] == "SONOSTATOOBBLIGATO"
	 or testo[2] == "sono stato obbligato" or testo[2] == "Sono Stato Obbligato" or testo[2] == "SONO STATO OBBLIGATO")))
	 and card.id == 8 then
		love.graphics.draw(cardimg[108], card.x,card.y)
	elseif ((hoster and (testo[1] == "Javier")) or (connesso and (testo[2] == "Javier")))
	 and (card.id == 1 or card.id == 25) then
		love.graphics.draw(cardimg[101], card.x,card.y)
	elseif ((hoster and (testo[1] == "javier")) or (connesso and (testo[2] == "javier")))
	 and (card.id == 1 or card.id == 25) then
		love.graphics.draw(cardimg[201], card.x,card.y)
	elseif ((hoster and (testo[1] == "JAVIER")) or (connesso and (testo[2] == "JAVIER")))
	 and (card.id == 1 or card.id == 25) then
		love.graphics.draw(cardimg[301], card.x,card.y)
	else
		love.graphics.draw(cardimg[card.id], card.x,card.y, 0, card.scale,card.scale)
	end
	
	love.graphics.setColor(love.math.colorFromBytes(card.color.r,card.color.g,card.color.b,255)) --🎨
		--Scritte-font
	love.graphics.setFont(font.cardName)
			--name
		cardsStats.name.font = love.graphics.getFont()
		cardsStats.name.Width = cardsStats.name.font:getWidth(card.name)
		cardsStats.name.Height = cardsStats.name.font:getHeight()/4
			--aggiustamento
		if cardsStats.name.Width*0.20 >= card.width then
			cardsStats.name.scale = card.scale*0.60
		elseif cardsStats.name.Width*0.25 >= card.width then
			cardsStats.name.scale = card.scale*0.75
		else
			cardsStats.name.scale = card.scale
		end
			--ATK
		cardsStats.ATK.font = love.graphics.getFont()
		cardsStats.ATK.Width = cardsStats.ATK.font:getWidth(card.ATK)
		cardsStats.ATK.Height = cardsStats.ATK.font:getHeight()/4
			--aggiustamento
		if cardsStats.ATK.Width > 90 then
			cardsStats.ATK.Width = 90
		end
			--MANA
		cardsStats.MANA.font = love.graphics.getFont()
		cardsStats.MANA.Width = cardsStats.MANA.font:getWidth(card.MANA)
		cardsStats.MANA.Height = cardsStats.MANA.font:getHeight()/4
			--aggiustamento

			--HP
		cardsStats.HP.font = love.graphics.getFont()
		cardsStats.HP.Width = cardsStats.HP.font:getWidth(card.HP)
		cardsStats.HP.Height = cardsStats.HP.font:getHeight()/4
			--aggiustamento
		if cardsStats.HP.Width > 90 then
			cardsStats.HP.Width = 90
		end
	
	if card.utente then --Utenti
		love.graphics.draw(TOPBOT, TOPimg, card.x,card.y)
		love.graphics.setColor(1,1,1) --🎨
		love.graphics.draw(TOPBOT, BOTimg, card.x,card.y+56)
			--ATK
		love.graphics.setColor(love.math.colorFromBytes(100,100,100,220)) --🎨
		love.graphics.rectangle("fill",card.x,card.y+card.height*0.77-cardsStats.ATK.Height/8, cardsStats.ATK.Width+20,cardsStats.ATK.Height)
		love.graphics.setColor(love.math.colorFromBytes(200,200,200,255)) --🎨
		love.graphics.print("ATK: "..card.ATK,card.x,card.y+card.height*0.77, 0, 1/4, 1/4)
			--MANA
		love.graphics.setColor(love.math.colorFromBytes(250,250,250,255)) --🎨
		love.graphics.draw(Pingimg,card.x+card.width*0.75,card.y, 0, 1/40, 1/40)
		if card.MANA < 10 then
			love.graphics.print(card.MANA,card.x+card.width*0.8,card.y+3, 0, 1/3, 1/3)
		else
			love.graphics.print(card.MANA,card.x+card.width*0.75,card.y+3, 0, 1/3, 1/3)
		end
			--HP
		love.graphics.setColor(love.math.colorFromBytes(100,100,100,220)) --🎨
		love.graphics.rectangle("fill",card.x+card.width*0.25,card.y+card.height*0.9-cardsStats.HP.Height/8, cardsStats.HP.Width,cardsStats.HP.Height)
		love.graphics.setColor(love.math.colorFromBytes(200,200,200,255)) --🎨
		love.graphics.print("HP: "..card.HP,card.x+card.width*0.25,card.y+card.height*0.9, 0, 1/4, 1/4)
	else 		-- Reazioni
		love.graphics.draw(MALTOPimg, card.x,card.y-9)
		love.graphics.setColor(1,1,1) --🎨
		love.graphics.draw(MALBOTimg, card.x,card.y-10)
			--MANA
		love.graphics.setColor(love.math.colorFromBytes(250,250,250,255)) --🎨
		love.graphics.print(card.MANA,card.x+card.width/2,card.y+card.height, 0, 1/3, 1/3, cardsStats.MANA.Width/3, cardsStats.MANA.Height*1.5)
	end
		--name
	love.graphics.setColor(1,1,1) --🎨
	love.graphics.print(card.name,card.x+card.width/2,card.y+card.height*0.65, 0, cardsStats.name.scale*card.scale,cardsStats.name.scale*card.scale,cardsStats.name.Width/2,cardsStats.name.Height/2)
end

function cards:drawInfo(card) --✏️
	love.graphics.setColor(1,1,1) --🎨
		if card.selezionata and not OSU then
			--statishe testo
		love.graphics.setFont(font.extraFont)
		infoStats.classe.font = love.graphics.getFont()
		infoStats.classe.Width  = infoStats.classe.font:getWidth(card.info.classe)
		infoStats.classe.Height = infoStats.classe.font:getHeight()
		infoStats.Tabilita1.font = love.graphics.getFont()
		infoStats.Tabilita1.Width  = infoStats.Tabilita1.font:getWidth(card.info.Tabilita1)
		infoStats.Tabilita1.Height = infoStats.Tabilita1.font:getHeight()
		infoStats.tabilita1.font = love.graphics.getFont()
		infoStats.tabilita1.Width  = infoStats.tabilita1.font:getWidth(card.info.tabilita1)
		infoStats.tabilita1.Height = infoStats.tabilita1.font:getHeight()
		infoStats.Tabilita2.font = love.graphics.getFont()
		infoStats.Tabilita2.Width  = infoStats.Tabilita2.font:getWidth(card.info.Tabilita2)
		infoStats.Tabilita2.Height = infoStats.Tabilita2.font:getHeight()
		infoStats.tabilita2.font = love.graphics.getFont()
		infoStats.tabilita2.Width  = infoStats.tabilita2.font:getWidth(card.info.tabilita2)
		infoStats.tabilita2.Height = infoStats.tabilita2.font:getHeight()
			--riga più larga
		infoStats.MAXWidth = general:greaterNumber5(infoStats.classe.Width, infoStats.Tabilita1.Width, infoStats.tabilita1.Width, infoStats.Tabilita2.Width, infoStats.tabilita2.Width)
			--scrittura e colori testi
		love.graphics.setColor(love.math.colorFromBytes(100,100,100,220))
		love.graphics.rectangle("fill", mouse.x, mouse.y, infoStats.MAXWidth, 
			-((infoStats.classe.Height*card.infoLinee.classe)+
				(infoStats.Tabilita1.Height*card.infoLinee.Tabilita1)+
				(infoStats.tabilita1.Height*card.infoLinee.tabilita1)+
				(infoStats.Tabilita2.Height*card.infoLinee.Tabilita2)+
				(infoStats.tabilita2.Height*card.infoLinee.tabilita2)))
		love.graphics.setColor(love.math.colorFromBytes(card.color.r,card.color.g,card.color.b))
		love.graphics.print(card.info.classe, mouse.x, mouse.y-infoStats.classe.Height*(card.infoLinee.tabilita2+card.infoLinee.Tabilita2+card.infoLinee.tabilita1+card.infoLinee.Tabilita1+card.infoLinee.classe))
		if card.info.Tabilita1 == "Abilità speciale" then
			love.graphics.setColor(0, 1, 0 ,1)
		elseif card.info.Tabilita1 == "Abilità a evocazione" then
			love.graphics.setColor(love.math.colorFromBytes(3, 252, 161, 255))
		elseif card.info.Tabilita1 == "Abilità passiva" then
			love.graphics.setColor(love.math.colorFromBytes(153, 255, 102, 255))
		elseif card.info.Tabilita1 == "Consiglio" then
			love.graphics.setColor(love.math.colorFromBytes(255, 204, 0, 255))
		elseif card.info.Tabilita1 == "Disabilità passiva" then
			love.graphics.setColor(love.math.colorFromBytes(204, 0, 0, 255))
		elseif card.info.Tabilita1 == "frase ad effetto" then
			love.graphics.setColor(love.math.colorFromBytes(255, 204, 0, 255))
		elseif card.info.Tabilita2 == "Abilità segreta" then
			love.graphics.setColor(0.5,0.5,0.5,0.7)
		elseif card.info.Tabilita1 == "" then
			love.graphics.setColor(0,0,0,0)
		end
		love.graphics.print(card.info.Tabilita1, mouse.x, mouse.y-infoStats.Tabilita1.Height*(card.infoLinee.tabilita2+card.infoLinee.Tabilita2+card.infoLinee.tabilita1+card.infoLinee.Tabilita1))
		love.graphics.setColor(1,1,1,1)
		love.graphics.print(card.info.tabilita1, mouse.x, mouse.y-infoStats.tabilita1.Height*(card.infoLinee.tabilita2+card.infoLinee.Tabilita2+card.infoLinee.tabilita1))
		
		if card.info.Tabilita2 == "Abilità speciale" then
			love.graphics.setColor(0, 1, 0)
		elseif card.info.Tabilita2 == "Abilità a evocazione" then
			love.graphics.setColor(love.math.colorFromBytes(3, 252, 161))
		elseif card.info.Tabilita2 == "Abilità passiva" then
			love.graphics.setColor(love.math.colorFromBytes(153, 255, 102))
		elseif card.info.Tabilita2 == "Consiglio" then
			love.graphics.setColor(love.math.colorFromBytes(255, 204, 0))
		elseif card.info.Tabilita2 == "Disabilità passiva" then
			love.graphics.setColor(love.math.colorFromBytes(204, 0, 0))
		elseif card.info.Tabilita2 == "frase ad effetto" then
			love.graphics.setColor(love.math.colorFromBytes(255, 204, 0))
		elseif card.info.Tabilita2 == "Abilità segreta" then
			love.graphics.setColor(0.5,0.5,0.5,0.7)
		elseif card.info.Tabilita2 == "" then
			love.graphics.setColor(0,0,0,0)
		end
		love.graphics.print(card.info.Tabilita2, mouse.x, mouse.y-infoStats.Tabilita2.Height*(card.infoLinee.tabilita2+card.infoLinee.Tabilita2))
		love.graphics.setColor(1,1,1,1)
		love.graphics.print(card.info.tabilita2, mouse.x, mouse.y-infoStats.tabilita2.Height*(card.infoLinee.tabilita2))
	end
end


function cards:draw() --✏️
	love.graphics.setColor(1,1,1) --🎨
		--carte nel cimitero
	for c,card in ipairs(CimiteroCards) do
		cards:drawStats(card)
	end
		--carte nei campi
	for c,card in ipairs(general:union(inCampoCards,inCampoCards2)) do
		if not card.morta then
			cards:drawStats(card) --✏️
				--se in attacco
			if card.attacco then
				love.graphics.draw(ATKimg, card.x+card.width/2, card.y+card.height/2, attacco_R, 1, 1, ATKimg:getWidth()/2, ATKimg:getHeight()/2)
			end
				--se stordita
			if card.stordito then
				love.graphics.draw(STORDITOimg, card.x , card.y, card.r)
			end
				--se avvelenata
			if card.avvelenata then
				love.graphics.draw(VELENOimg, card.x , card.y, card.r)
			end
				--se annullata
			if not card.puoabilita2 then
				love.graphics.draw(ANNULLATOimg, card.x , card.y, card.r)
			end
				--se immune
			if card.immune then
				love.graphics.draw(IMMUNEimg, card.x , card.y, card.r)
			end
			cards:drawInfo(card) --✏️
		end
	end
		--carte in mano
	for c,card in ipairs(inManoCards) do
		if card.id ~= nil then
			cards:drawStats(card) --✏️
		end
	end
	for c,card in ipairs(inManoCards) do
		if card.selezionata then
			love.graphics.setColor(1,.2,.2) --🎨
			love.graphics.setLineWidth(3)
			love.graphics.rectangle("line", card.x-5, card.y-5, card.width+10, card.height+10)
			cards:drawInfo(card) --✏️
		end
	end
		--carte nello shop
	if SHOP then
		love.graphics.setColor(love.math.colorFromBytes(174,134,61,190))
		love.graphics.rectangle("fill", shopTable.x,shopTable.y,shopTable.width,shopTable.height)
		love.graphics.setColor(1,1,1,1)
		for c,card in ipairs(shop) do
			cards:drawStats(card)
			cards:drawInfo(card)
		end
	end
end

	--per attaccare
function cards:mousepressed(x, y, button) --🖱️
	for c,card in ipairs(inCampoCards) do --attaccante
		if (COMMISSIONE_NON_PAGATA) and (card.id == 11) and (giocatore == 1) then -- Aria
			card.attacco = true
		else
			card.attacco = false
		end
		if (giocatore == 1) and (not card.attacco) and card.selezionata and card.utente and button == 2 then
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
		if card2.selezionata then
			general:danno(card2,attaccante)
			if attaccante ~= nil then
				if hoster or connesso then
	    			attaccante.puoattaccare = false
	    		end
  			end
		end
	end
	if general:aabb(player2.x,player2.y,player2.width,player2.height,mouse.x,mouse.y,1,1) then
		general:danno(player2,attaccante)
		if attaccante ~= nil then
			if hoster or connesso then
				attaccante.puoattaccare = false
	    	end
  		end
	end
end