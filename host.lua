host = {}

function host:load()

		-- how often an update is sent out					   --[🌐
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
        Testo[2] = text
    end)

    server:on("cambia_turno_2-1", function(p, client)
        cambia_turno = p
    end)

    server:on("CHIUDI_2-1", function(bool, client)
        chiudi = bool
    end)

    server:on("MADE_IN_HAEVEN_2-1", function(bool, client)
        if bool then
            LOAD_MADE_IN_HEAVEN()
        end
    end)

    hoster = true
    player:scambio_nomi()											    --🌐]
end

function host:update(dt)
	server:update()										      --[🌐

	ticks = ticks + dt

    if ticks >= ticksRate then
        ticks = 0

        if giocatore == 1 then                                                   --[🃏
            server:sendToAll("inCampoCard_1-2", bitser.dumps(inCampoCards))
        end                                                                      --🃏]
    end 												        --🌐] 

    if chiudi then
        love.event.quit()
    end
end

function host:draw()                                            --✏️
	love.graphics.print("server ON", 5, 30)
    love.graphics.print(menu.player1.text, 5, 45)

end

function LOAD_HOST()
	host:load()
end

function UPDATE_HOST(dt)
	host:update(dt)
end

function DRAW_HOST()                                            --✏️
    love.graphics.setColor(love.math.colorFromBytes(255,255,255,255))                                               --🎨
    love.graphics.setFont(Font.menu2)
	host:draw()
end