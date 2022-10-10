sfx = {}

function sfx:load()
	sfx.megalovenia_short = love.audio.newSource("assets/sound/sfx/megalovenia_short.wav", "static")
	sfx.AAA = love.audio.newSource("assets/sound/sfx/AAA.wav", "static")
	sfx.perry = love.audio.newSource("assets/sound/sfx/perry.wav", "static")
	love.audio.setEffect("Reverb", {type="reverb"})
end
