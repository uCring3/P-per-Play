text_anim = {}

function text_anim:load(testo,x,y,scalax,scalay,sec_per_lettera,sec_passati,lettera_corrente)
    text_anim.text = testo
    text_anim.x = x
    text_anim.y = y
    text_anim.scalax = scalax
    text_anim.scalay = scalay
    time_per_letter = sec_per_lettera
    time_passed = sec_passati
    current_letter = lettera_corrente
end

function text_anim:update(dt)
    time_passed = time_passed + dt
    
    if time_passed >= time_per_letter then
        time_passed = 0
        current_letter = current_letter + 1
    end
end

function text_anim:draw()
    testo_animato_da_disegnare = text_anim.text:sub(1, current_letter)
    love.graphics.print(testo_animato_da_disegnare, text_anim.x, text_anim.y, 0, text_anim.scalax, text_anim.scalay)      
end


function LOAD_TEXT_ANIM(testo,x,y,scalax,scalay,sec_per_lettera,sec_passati,lettera_corrente)
    text_anim:load(testo,x,y,scalax,scalay,sec_per_lettera,sec_passati,lettera_corrente)
end

function UPDATE_TEXT_ANIM(dt)
    text_anim:update(dt)
end

function DRAW_TEXT_ANIM()
    text_anim:draw()
end