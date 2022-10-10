achievement = {img,titolo,sottotitolo}
achievementSbloccati = {}

function achievement:load() --💾
	achievementSbloccati[1] = false --rotellina
	achievementSbloccati[2] = false --3 AM
	achievementSbloccati[3] = false --Crediti
	achievementSbloccati[4] = false --video
	achievementSbloccati[5] = false --troll
	achievementSbloccati[6] = false --volume
	achievementSbloccati[7] = false --Pepone Speed

	achievement_sbloccato = false
	achievement_salendo = false
	ScorrimentoAchievement = 0
end

function achievement:sblocca(nome,sottonome,numero)
	if not achievementSbloccati[numero] then
		achievement.img = {img,width,height}
		achievement.img.img = love.graphics.newImage("assets/achievement/FurryLord.png")
		achievement.img.width = achievement.img.img:getWidth()
		achievement.img.height = achievement.img.img:getHeight()
		achievement.titolo = nome
		achievement.sottotitolo = sottonome
		achievement_sbloccato = true
		achievement_salendo = true
		achievementSbloccati[numero] = true
	end
end

function achievement:update(dt) --🔁 --DA RIPARARE🚧 per ora sta inpastato in main.lua
		--animazione achievement
	if achievement_sbloccato and achievement_salendo then
		ScorrimentoAchievement = ScorrimentoAchievement+80*dt
		if ScorrimentoAchievement >= 160 then
			ScorrimentoAchievement = 160
			Timer.after(6, function() --⏱️
				achievement_salendo = false
			end)
		end
	elseif achievement_sbloccato and not achievement_salendo then
		ScorrimentoAchievement = ScorrimentoAchievement-140*dt
		if ScorrimentoAchievement <= -1 then
			ScorrimentoAchievement = 0
			achievement_sbloccato = false
		end
	end	
	if Bad_Millie:tell( ) >= 142 then
		achievement:sblocca("*applausi*","adoro questo video",4)
		Timer.after(3, function() --⏱️
			Bad_Millie:rewind()
		end)
		Bad_Millie_Bool = false
		if gamestate.current() == menU then
			music.menu:play()
		elseif gamestate.current() == inGamE then
			music.inGame:play()
		end
	end
end

function achievement:draw() --✏️ --DA RIPARARE🚧 per ora sta inpastato in main.lua
	love.graphics.setFont(font.arial)
	if achievement_sbloccato then
		love.graphics.setColor(1,1,1) --🎨
		love.graphics.draw((achievement.img.img),(window.width-(achievement.img.width/4.5)-5),(window.height-ScorrimentoAchievement),0,1/4.5,1/4.5)
		love.graphics.print((achievement.titolo),(window.width-(achievement.img.width/4.5)-5)+5,(window.height-ScorrimentoAchievement)+85,0,.2,.2)
		love.graphics.print((achievement.sottotitolo),(window.width-(achievement.img.width/4.5)-5)+6,(window.height-ScorrimentoAchievement)+123,0,1/6,1/6)
		--love.graphics.setFont(font.Digi)
	end
end

function achievement:loadJumpscare() --💾
	jumpscare = {bool,img}
	jumpscare.bool = {a=false,b=false}
	jumpscare.img = {img,width,height}
	jumpscare.img.img = love.graphics.newImage("assets/achievement/jumpscare.png")
	jumpscare.img.width = jumpscare.img.img:getWidth()
	jumpscare.img.height = jumpscare.img.img:getHeight()
end

 --[🚧
--local ora_esatta --🕒
function achievement:updateJumpscare(dt) --🔁 --DA RIPARARE🚧 per ora sta inpastato in main.lua
	ora_esatta = (os.date('*t')) --🕒
	if ora_esatta.hour == 3 then
		achievement:sblocca("VA A DORMIRE","THE LAST OF PEPO\n AT 3 AM????????????",2)
		Timer.after(4, function() --⏱️
			jumpscare.bool.a = true
		end)
		Timer.after(6, function() --⏱️
			jumpscare.bool.a = false
		end)
		Timer.after(10, function() --⏱️
			jumpscare.bool.b = true
		end)
	end
end

function achievement:drawJumpscare() --✏️ --DA RIPARARE🚧 per ora sta inpastato in main.lua
	if jumpscare.bool.a and not jumpscare.bool.b then
		love.graphics.draw(jumpscare.img.img, 0, 0, 0, window.width/jumpscare.img.width, window.height/jumpscare.img.height)
	end
end
 --🚧]