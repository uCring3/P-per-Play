music = {osu={}}

function music:load()
	music.kazotsky_kick = love.audio.newSource("assets/sound/music/kazotsky_kick.mp3", "stream")
	music.Red_Sun = love.audio.newSource("assets/sound/music/Red_Sun.mp3", "stream")
	music.inGame = love.audio.newSource("assets/sound/music/inGame.mp3", "stream")
	music.menu = love.audio.newSource("assets/sound/music/menu.mp3", "stream")
	Bad_Millie = love.graphics.newVideo("assets/sound/music/Bad_Millie.ogv")
	SummerEgg = love.graphics.newVideo("assets/achievement/SummerEgg.ogv")
	music.osu[1] = love.audio.newSource("assets/sound/music/alien-wolves.mp3", "stream")
	music.osu[2] = love.audio.newSource("assets/sound/music/begin-your-journey.mp3", "stream")
	music.osu[3] = love.audio.newSource("assets/sound/music/digestive-biscuit-no-copyright-8-bit-music.mp3", "stream")
end

function music:update(dt)
	if not (music.inGame:isPlaying() or music.kazotsky_kick:isPlaying() or music.Red_Sun:isPlaying() or Bad_Millie:isPlaying() or music.osu[1]:isPlaying() or music.osu[2]:isPlaying() or music.osu[3]:isPlaying()) then
		music.inGame:seek( 23, "seconds" )
		love.audio.play(music.inGame)
	end
end