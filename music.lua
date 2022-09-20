music = {osu={}}

function LOAD_MUSIC()
	music.kazotsky_kick = love.audio.newSource("sound/music/kazotsky_kick.mp3", "stream")
	music.Red_Sun = love.audio.newSource("sound/music/Red_Sun.mp3", "stream")
	music.inGame = love.audio.newSource("sound/music/inGame.mp3", "stream")
	music.menu = love.audio.newSource("sound/music/menu.mp3", "stream")
	Bad_Millie = love.graphics.newVideo("sound/music/Bad_Millie.ogv")
	SummerEgg = love.graphics.newVideo("assets/achievement/SummerEgg.ogv")
	music.osu[1] = love.audio.newSource("sound/music/alien-wolves.mp3", "stream")
	music.osu[2] = love.audio.newSource("sound/music/begin-your-journey.mp3", "stream")
	music.osu[3] = love.audio.newSource("sound/music/digestive-biscuit-no-copyright-8-bit-music.mp3", "stream")
end

function UPDATE_MUSIC()
	if not (music.inGame:isPlaying() or music.kazotsky_kick:isPlaying() or music.Red_Sun:isPlaying() or Bad_Millie:isPlaying() or music.osu[1]:isPlaying() or music.osu[2]:isPlaying() or music.osu[3]:isPlaying() or music.osu[4]:isPlaying()) then
		music.inGame:seek( 23, "seconds" )
		love.audio.play(music.inGame)
	end
end