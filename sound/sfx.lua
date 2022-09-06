sfx = {}

function LOAD_SFX()

	sfx.megalovenia_short = love.audio.newSource("sound/sfx/megalovenia_short.wav", "static")
	sfx.AAA = love.audio.newSource("sound/sfx/AAA.wav", "static")

	love.audio.setEffect("Reverb", {type="reverb"})

end
