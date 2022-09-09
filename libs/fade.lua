fade = {}


function LOAD_FADE()
	fade.setColor(red,green,blue)
	fade.duoTimer = -1
	fade.alpha = 0
	fade.direction = "none"
end


function fade.into(seconds)
	local speed =  255 / seconds 
	fade.direction = "in"
	fade.alpha = 255
	fade.setColor(red,green,blue)
	if speed ~= nil then
		fade.speed = speed
	else 
		fade.speed = 255
	end
end


function fade.out(seconds)
	local speed =  255 / seconds 
	fade.direction = "out"
	fade.alpha = 0
	fade.setColor(red,green,blue)
	if speed ~= nil then
		fade.speed = speed
	else 
		fade.speed = 255
	end
end


function fade.inOut(seconds, pause,red,green,blue)
	local speed =  255 / seconds 
	fade.direction = "out"
	fade.duoTimer = 255 / speed
	fade.alpha = 0
	fade.setColor(red,green,blue)
	if pause ~= nil then
		fade.pause = pause
	else
		fade.pause = 0.1
	end

	if speed ~= nil then
		fade.speed = speed
	else 
		fade.speed = 255
	end
end


function fade.setColor(red,green,blue)
	if red ~= nil then
		fade.red = red
	else
		fade.red = 0
	end

	if green ~= nil then
		fade.green = green
	else
		fade.green = 0
	end

	if blue ~= nil then
		fade.blue = blue
	else
		fade.blue = 0
	end
end


function UPDATE_FADE(dt)
	if fade.direction == "out" then
		if fade.duoTimer > 0 and fade.duoTimer - dt > 0 then
			fade.duoTimer = fade.duoTimer - dt
		elseif fade.duoTimer > 0 and fade.duoTimer - dt < 0 then
			fade.duoTimer = -1
			fade.direction = "pause"
		end
		if fade.alpha < 255 and fade.alpha + fade.speed * dt < 255 then
			fade.alpha = fade.alpha + fade.speed * dt
		elseif fade.alpha < 255 and fade.alpha + fade.speed * dt > 255 then
			fade.alpha = 255
		end
	elseif fade.direction == "pause" then
		if fade.pause > 0 and fade.pause - dt > 0 then
			fade.pause = fade.pause - dt
		elseif fade.pause > 0 and fade.pause - dt < 0 then
			fade.pause = -1
			fade.direction = "in"
		end
	elseif fade.direction == "in" then
		if fade.alpha > 0 and fade.alpha - fade.speed * dt > 0 then
			fade.alpha = fade.alpha - fade.speed * dt
		elseif fade.alpha > 0 and fade.alpha - fade.speed * dt < 0 then
			fade.alpha = 0
		end
	end
end


function DRAW_FADE()
	love.graphics.setColor(fade.red, fade.green,fade.blue,fade.alpha)
	love.graphics.rectangle("fill",0,0,window.width,window.height)
	--love.graphics.setColor(1,1,1)
end