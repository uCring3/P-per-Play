host = {}

function host:load() --💾

		-- how often an update is sent out
    ticksRate = 1/60
    ticks = 0

	server = sock.newServer(host.IP, 69420, 1)	  --IP
    server:setSerialization(bitser.dumps, bitser.loads)	

        -- Players are being indexed by peer index here, definitely not a good idea
        -- for a larger game, but it's good enough for this application.
    server:on("connect", function(data, client)
        -- tell the peer what their index is
        client:send("playerNum", client:getIndex())
    end)
    server:on("iniziamo", function(bool, client)
        player.puopassare = true
        if bool then
            general:scambioNomiPlayers()
        end
    end)
                                                            --[🃏
    server:on("inCampoCard_2-1", function(data, client)
        inCampoCards2 = bitser.loads(data)
    end)
    server:on("inCampoCard2_2-1", function(data, client)
        inCampoCards = bitser.loads(data)
    end)
                                                             --🃏]
    server:on("playerHP_2-1", function(HP, client)
        player2.HP = HP
    end)

    server:on("playerHP2_2-1", function(HP, client)
        player.HP = HP
    end)

    server:on("player_name_2-1", function(text, client)
        testo[2] = text
    end)

    server:on("cambia_turno_2-1", function(bool, client)
        if bool then
            abilita:cambiaTurno()
        end
    end)

    server:on("CHIUDI_2-1", function(bool, client)
        chiudi = bool
    end)

    server:on("WALL_2-1", function(tavola, client)
        wall = bitser.loads(tavola)
    end)

    server:on("MADE_IN_HAEVEN_2-1", function(bool, client)
        if bool then
            LOAD_MADE_IN_HEAVEN(119.5)
        end
    end)

    hoster = true
    giocatore = 1
    --general:scambioNomiPlayers() --🌐]
end

function host:update(dt) --🔁
    if hoster then
    	server:update() --🔁

    	ticks = ticks + dt

        if ticks >= ticksRate then
            ticks = 0

            if giocatore == 1 then                                                   --[🃏
                server:sendToAll("inCampoCard_1-2", bitser.dumps(inCampoCards))
            end                                                                      --🃏]
        end

        if chiudi then
            love.event.quit()
        end
    end
end

function host:draw() --✏️
    love.graphics.setColor(0,0,0)
    if hoster then
        love.graphics.setFont(font.verdana)
        love.graphics.print("server ON", 5, 20)
        love.graphics.print(menu.player.text, 5, 45)
    end
end