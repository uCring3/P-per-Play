achievement = {}

function ACHIEVEMENT(nome,sottonome)
	achievement = {img,titolo,sottotitolo}
	achievement.img = {img,width,height}
	achievement.img.img = love.graphics.newImage("assets/achievement/FurryLord.png")
	achievement.img.width = achievement.img.img:getWidth()
	achievement.img.height = achievement.img.img:getHeight()
	achievement.titolo = nome
	achievement.sottotitolo = sottonome
	achievement_sbloccato = true
	achievement_salendo = true
end

function LOAD_ACHIEVEMENT()
	achievementSbloccati_a = false --rotellina
	achievementSbloccati_b = false --3 AM
	achievementSbloccati_c = false --Crediti
	achievementSbloccati_d = false --video

	achievement_sbloccato = false
	achievement_salendo = false
	ScorrimentoAchievement = 0
end

function UPDATE_ACHIEVEMENT(dt)
	--animazione achievement
	if achievement_sbloccato and achievement_salendo then
		ScorrimentoAchievement = ScorrimentoAchievement+80*dt
		if ScorrimentoAchievement >= 160 then
			ScorrimentoAchievement = 160
			tick.delay(function () achievement_salendo = false end , 6)
		end
	elseif achievement_sbloccato and not achievement_salendo then
		ScorrimentoAchievement = ScorrimentoAchievement-140*dt
		if ScorrimentoAchievement <= -1 then
			ScorrimentoAchievement = 0
			achievement_sbloccato = false
		end
	end	

	if Bad_Millie:tell( ) >= 142 and not achievementSbloccati_d then
		ACHIEVEMENT("*applausi*","adoro questo video")
		achievementSbloccati_d = true --video
		tick.delay(function () Bad_Millie:rewind() end , 3) 
		Bad_Millie_Bool = false
	end
end

function DRAW_ACHIEVEMENT()
	if achievement_sbloccato then
		love.graphics.setFont(Font.arial)
		love.graphics.draw((achievement.img.img),(window.width-(achievement.img.width/4.5)-5),(window.height-ScorrimentoAchievement),0,1/4.5,1/4.5)
		love.graphics.print((achievement.titolo),(window.width-(achievement.img.width/4.5)-5)+5,(window.height-ScorrimentoAchievement)+85,0,1/4.5,1/4.5)
		love.graphics.print((achievement.sottotitolo),(window.width-(achievement.img.width/4.5)-5)+6,(window.height-ScorrimentoAchievement)+123,0,1/6,1/6)
	end
end

function LOAD_JUMPSCARE()
	JUMPSCARE = {a,b} 
	JUMPSCARE.a = false
	jumpscare = {}
	jumpscare.img = {img,width,height}
	jumpscare.img.img = love.graphics.newImage("assets/achievement/jumpscare.png")
	jumpscare.img.width = jumpscare.img.img:getWidth()
	jumpscare.img.height = jumpscare.img.img:getHeight()
end

function UPDATE_JUMPSCARE(dt)
	if not achievementSbloccati_b then
		if ora_esatta.hour == 3 then
			ACHIEVEMENT("VA A DORMIRE",
[[THE LAST OF PEPO
AT 3 AM????????????]])
			tick.delay(function () JUMPSCARE.a = true end , 4)
			tick.delay(function () JUMPSCARE.a = false end , 7)
			--tick.delay(function () achievementSbloccati.b = true end , 8)
			achievementSbloccati_b = true
			print(achievementSbloccati_b)
			
		end
	end
	
end

function DRAW_JUMPSCARE()
	if (JUMPSCARE.a) then
		love.graphics.draw(jumpscare.img.img, 0, 0, 0, window.width/jumpscare.img.width, window.height/jumpscare.img.height)
	end
end