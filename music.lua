music = {}

function LOAD_MUSIC()
	
	music.kazotsky_kick = love.audio.newSource("sound/music/kazotsky_kick.mp3", "stream")
	music.inGame = love.audio.newSource("sound/music/inGame.mp3", "stream")
	music.menu = love.audio.newSource("sound/music/menu.mp3", "stream")

	Bad_Millie = love.graphics.newVideo("sound/music/Bad_Millie.ogv")

end

function UPDATE_MUSIC()
	if not music.inGame:isPlaying( ) and not Bad_Millie:isPlaying() then
		music.inGame:seek( 23, "seconds" )
		love.audio.play(music.inGame)
	end
end