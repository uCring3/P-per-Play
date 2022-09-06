--require "main"

function love.conf(t)
    t.title = "H VS W"                -- The title of the window the game is in (string)
    t.window.icon = "assets/icona.png"
    t.author = "u/Cring3_Crimson"                    -- The author of the game (string)
    t.url = nil                         -- The website of the game (string)
    t.identity = "identity"             -- The name of the save directory (string)
    t.version = "11.4"                -- The LÖVE version this game was made for (string)
    t.console = false 
    t.release = false                   -- Enable release mode (boolean)
    t.window.width = 1300               -- The window width (number)
    t.window.height = 860               -- The window height (number)
    t.window.resizable = false          -- Let the window be user-resizable (boolean)
    t.window.fullscreen = false         -- Enable fullscreen (boolean)
    t.window.vsync = false              -- Enable vertical sync (boolean)
    t.window.fullscreentype = "desktop" -- Standard fullscreen or desktop fullscreen mode (string)
    t.window.fsaa = 0                   -- The number of FSAA-buffers (number)
    t.modules.audio = true              -- Enable the audio module (boolean)
    t.modules.event = true              -- Enable the event module (boolean)
    t.modules.graphics = true           -- Enable the graphics module (boolean)
    t.modules.image = true              -- Enable the image module (boolean)
    t.modules.joystick = false          -- Enable the joystick module (boolean)
    t.modules.keyboard = true           -- Enable the keyboard module (boolean)
    t.modules.math = true               -- Enable the math module (boolean)
    t.modules.mouse = true              -- Enable the mouse module (boolean)
    t.modules.physics = true            -- Enable the physics module (boolean)
    t.modules.sound = true              -- Enable the sound module (boolean)
    t.modules.system = true             -- Enable the system module (boolean)
    t.modules.timer = true              -- Enable the timer module (boolean)
    t.modules.window = true             -- Enable the window module (boolean)
end