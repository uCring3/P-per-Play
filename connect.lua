connect = {}

function connect:load()

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

    client:on("player_name_1-2", function(text, client)
        Testo[1] = text
    end)

    giocatore = 2
    --turno.n = turno.n-1
    client:on("cambia_turno_1-2", function(p)
        cambia_turno = p
    end)

    client:on("CHIUDI_1-2", function(bool)
        chiudi = bool
    end)

    client:on("MADE_IN_HAEVEN_1-2", function(bool)
        if bool then
            LOAD_MADE_IN_HEAVEN()
        end
    end)

    connesso = true

    client:connect()
    player:scambio_nomi()                                        --🌐]
end

function connect:update(dt)
        client:update()                                     --[🌐

    if client:getState() == "connected" then
        ticks = ticks + dt
    end

    if ticks >= ticksRate then
        ticks = 0
                                                    
        if giocatore == 1 then                                                   --[🃏
            client:send("inCampoCard_2-1", bitser.dumps(inCampoCards))
            --client:send("activeCards_2-1", bitser.dumps(activeCards))
        end                                                                      --🃏]
    end                                                     --🌐]

    if chiudi then
        love.event.quit()
    end
end

function connect:draw()

    love.graphics.print(client:getState(), 5, 5)                --[🌐
    if playerNumber then
        love.graphics.print(menu.player2.text, 5, 40)
    else
        love.graphics.print("Qualcosa e' andato storto", 5, 40)
    end                                                         --🌐]
end

function LOAD_CONNECT()
    connect:load()
end

function UPDATE_CONNECT(dt)
    connect:update(dt)
end

function DRAW_CONNECT()
    connect:draw()
end