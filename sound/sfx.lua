sfx = {}

function LOAD_SFX()

	sfx.megalovenia_short = love.audio.newSource("sound/sfx/megalovenia_short.wav", "static")

	love.audio.setEffect("Reverb", {type="reverb"})

end
