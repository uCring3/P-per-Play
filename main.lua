io.stdout:setvbuf("no")

enet = require "enet" --[🌐
sock = require "libs/sock"
bitser = require "libs/bitser"
require"host"
require"connect" --🌐]
class = require"libs/hump.class"
gamestate = require"libs/hump.gamestate"
menU = {}
inventariO = {}
inGamE = {}
Timer = require"libs/hump.timer" --⏱️
flux = require"libs/flux"
InputField = require"libs/InputField" --📄
field = InputField("Initial text.")
anim8 = require "libs/anim8"
Konami = require"libs/konami"
require"libs/text_anim" --💬
require"menu"
require"stanza" --🏙️
require"inventario"
require"cards"
require"abilita"
require"gui"
require"font" --🔠
require"cursor" --⬉
require"achievement" --🏆
require"music" --[🎵
require"sfx" --🎵]
require"draw_order"
require"tutorial" --📔
require"hamachi" --📔🌐
require"general"
require"player"
require"player2"

function love.load() --💾
	font:load() --🔠
	text_anim:load("",0,0,0,0,0,0,0) --💬
	cursor:load() --⬉
	achievement:load() --🏆
	achievement:loadJumpscare()
	music:load() --[🎵
	sfx:load() --🎵]
	love.audio.setVolume(.5)
	Konami.setWaitTime(1.5)
    	--premi 6 9 del tastierino numerico 69 volte
    Konami.newCode({"kp6", "kp9", "kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6", "kp9","kp6"}, function() love.system.openURL("https://www.reddit.com/user/Cring3_Crimson") end)
	host.IP = testo[3] --[🌐-💬
	connect.IP = testo[4] --🌐-💬]
	general.load()
	gamestate.registerEvents()
	gamestate.switch(menU)
end

function love.update(dt) --🔁
	mouse.x,mouse.y = love.mouse.getPosition() --🖱️
	Timer.update(dt)
	flux.update(dt)
	field:update(dt) --📄
	Konami.update(dt)
	text_anim:update(dt) --💬
	--[🚧
	--achievement:update(dt) --🏆--DA RIPARARE🚧
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
		if gamestate.current() == inGamU then
			music.menu:play()
		elseif gamestate.current() == inGamE then
			music.inGame:play()
		end
	end
	--achievement:updateJumpscare(dt)--DA RIPARARE🚧
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
	end --🚧]
	general:update(dt)
end

function love.draw() --✏️
end

function love.keypressed(key, scancode, isRepeat) --⌨️
	field:keypressed(key, isRepeat) --📄
	general.keypressed(key, scancode, isRepeat)
end

function love.keyreleased(key) --⌨️
end

function love.mousepressed(x, y, button) --🖱️
	field:mousepressed(x-FIELD_INNER_X, y-FIELD_INNER_Y, button, pressCount) --📄
	general:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button) --🖱️
	field:mousereleased(x-FIELD_INNER_X, y-FIELD_INNER_Y, button) --📄
end

function love.mousemoved(x, y, dx, dy) --🖱️
	field:mousemoved(x-FIELD_INNER_X, y-FIELD_INNER_Y) --📄
end

function love.wheelmoved(dx, dy) --🖱️
	field:wheelmoved(dx, dy) --📄
	if menu.credits.Y ~= nil then
		if dy > 0 then
			menu.credits.Y = menu.credits.Y+15
		elseif dy < 0 then
			menu.credits.Y = menu.credits.Y-15
		end
	end
	if inventario.wheel then
		for c,card in ipairs(inventarioCards) do
			card.y = card.y + dy*10
		end
	end
end

function love.textinput(text) --⌨️
	field:textinput(text) --📄
end


	--gamestate == menU
function menU:enter() --💾
	menu.load()
	music.menu:setLooping(true) --[🎵
	music.menu:play()			--🎵]
	--tutorial:load() --📔
	--hamachi:load() --📔🌐
	font:loadField(50,menu.player.x,menu.player.y,272,62,24,testo[1]) --📄
end

function menU:update(dt) --🔁
	menu:update(dt)
end

function menU:draw() --✏️
	menu:draw()
	--[🚧
	--achievement:draw() --🏆--DA RIPARARE🚧
	if achievement_sbloccato then
		love.graphics.setFont(font.arial)
		love.graphics.setColor(1,1,1) --🎨
		love.graphics.draw((achievement.img.img),(window.width-(achievement.img.width/4.5)-5),(window.height-ScorrimentoAchievement),0,1/4.5,1/4.5)
		love.graphics.print((achievement.titolo),(window.width-(achievement.img.width/4.5)-5)+5,(window.height-ScorrimentoAchievement)+85,0,1/4.5,1/4.5)
		love.graphics.print((achievement.sottotitolo),(window.width-(achievement.img.width/4.5)-5)+6,(window.height-ScorrimentoAchievement)+123,0,1/6,1/6)
		love.graphics.setFont(font.Digi)
	end
	--achievement:drawJumpscare()--DA RIPARARE🚧
	if jumpscare.bool.a and not jumpscare.bool.b then
		love.graphics.draw(jumpscare.img.img, 0, 0, 0, window.width/jumpscare.img.width, window.height/jumpscare.img.height)
	end --🚧]
	font:draw()
	general:draw()
	--print(achievement.update)--per prove sul menu🚧
end

function menU:mousepressed(x, y, button) --🖱️
	menu:mousepressed(x, y, button)
	hamachi:mousepressed(x, y, button) --📔🌐
end

function menU:keypressed(key, scancode, isRepeat) --⌨️
	menu:keypressed(key, scancode, isRepeat)
end


	--gamestate == inventariO
function inventariO:enter() --💾
	cards:load()
	inventario:load()
end

function inventariO:update(dt) --🔁
	if hoster then --[🌐
		host:update(dt)
	elseif connesso then
		connect:update(dt)
	end --🌐]
	inventario:update(dt)
	cards:update(dt)
	--general:update(dt)
end

function inventariO:draw() --✏️
	inventario:draw()
	cards:draw()
	host:draw()
	connect:draw()
	achievement:draw() --🏆
	achievement:drawJumpscare()
	font:draw()
	general:draw()
end

function inventariO:keypressed(key, scancode, isRepeat) --⌨️
	inventario:keypressed(key, scancode, isRepeat)
end

function inventariO:mousepressed(x, y, button) --🖱️
	inventario:mousepressed(x, y, button)
end

function inventariO:mousemoved(x, y, dx, dy) --🖱️
	inventario:mousemoved(x, y, dx, dy)
end


	--gamestate == inGamE
function inGamE:enter() --💾
	music.menu:stop()
	music.inGame:play()
	stanza:load()
	abilita:load()
	gui:load()
	player:load()
	player2:load()
end

function inGamE:update(dt) --🔁
	if hoster then --[🌐
		host:update(dt)
	elseif connesso then
		connect:update(dt)
	end --🌐]
	stanza:update(dt)
	cards:update(dt)
	music:update(dt)--🎵
	tutorial:update(dt)
	abilita:update(dt)
	gui:update(dt)
	player:update(dt)
	player2:update(dt)
	--general:update(dt)
end

function inGamE:draw() --✏️
	stanza:draw()
	host:draw()
	connect:draw()
	cards:draw()
	tutorial:draw()
	abilita:draw()
	general:drawDanno()
	gui:draw()
	achievement:draw() --🏆
	achievement:drawJumpscare()
	font:draw()
	player:draw()
	player2:draw()
	general:draw()
end

function inGamE:keypressed(key, scancode, isRepeat) --⌨️
end

function inGamE:mousepressed(x, y, button) --🖱️
	stanza:mousepressed(x, y, button)
	cards:mousepressed(x, y, button)
	player:mousepressed(x, y, button)
	tutorial:mousepressed(x, y, button) --📔
	abilita:mousepressed(x, y, button)
	gui:mousepressed(x, y, button)
end

function inGamE:mousereleased(x, y, button) --🖱️
	player:mousereleased(x, y, button)
	abilita:mousereleased(x, y, button)
end

function inGamE:mousemoved(x, y, dx, dy)
	gui:mousemoved(x, y, dx, dy)
end