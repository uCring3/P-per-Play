connect = {}

function connect:load() --💾

    -- how often an update is sent out                      --[🌐
    ticksRate = 1/60
    ticks = 0

    client = sock.newClient(connect.IP, 69420)
    client:setSerialization(bitser.dumps, bitser.loads)
    client:setSchema("playerState", {
        "index",
        "player",
    })

    -- store the client's index
    -- playerNumber is nil otherwise
    client:on("playerNum", function(num)
        playerNumber = num
    end)

    -- receive info on where the players are located
    client:on("playerState", function(data)
        local index = data.index
        local player = data.player

        -- only accept updates for the other player
        if playerNumber and index ~= playerNumber then
            players[index] = player
        end
    end)
                                                        --[🃏
    client:on("inCampoCard_1-2", function(data)
        inCampoCards2 = bitser.loads(data)
    end)
    client:on("inCampoCard2_1-2", function(data)
        inCampoCards = bitser.loads(data)
    end)
                                                        --🃏]
    client:on("playerHP_1-2", function(HP)
        player2.HP = HP
    end)

    client:on("playerHP2_1-2", function(HP)
        player.HP = HP
    end)

    client:on("player_name_1-2", function(text)
        testo[1] = text
    end)

    client:on("cambia_turno_1-2", function(bool)
        if bool then
            abilita:cambiaTurno()
        end
    end)

    client:on("CHIUDI_1-2", function(bool)
        chiudi = bool
    end)

    client:on("WALL_1-2", function(tavola)
        wall = bitser.loads(tavola)
    end)

    client:on("MADE_IN_HAEVEN_1-2", function(bool)
        if bool then
            LOAD_MADE_IN_HEAVEN(119.5)
        end
    end)

    connesso = true
    giocatore = 2
    client:connect()
    --general:scambioNomiPlayers() --🌐]
end

function connect:update(dt) --🔁
    if connesso then
        client:update() --🔁

        if client:getState() == "connected" then
            ticks = ticks + dt
        end

        if ticks >= ticksRate then
            ticks = 0
                                                        
            if giocatore == 1 then                                                   --[🃏
                client:send("inCampoCard_2-1", bitser.dumps(inCampoCards))
            end                                                                      --🃏]
        end

        if chiudi then
            love.event.quit()
        end
    end
end

function connect:draw() --✏️
    if connesso then
        love.graphics.setFont(font.verdana)
        love.graphics.print(client:getState(), 5, 20)
        if playerNumber then
            love.graphics.print(menu.player2.text, 5, 45)
        else
            love.graphics.print(
[[QUALCOSA E' ANDATO STORTO
    >SPEGNI E RIACCENDI IL GIOCO SEGUENDO IL TUTORIAL
    >ASSICURATI CHE L'HOST (L'ALTRO GIOCATORE)
     SIA GIA' NELL'INVENTARIO PRIMA CHE TU ENTRI
    >ASSICURATI CHE HAMACHI FUNZIONI CORRETTAMENTE
    >CONTATTA PING
]], 5, 45)
        end
    end
end