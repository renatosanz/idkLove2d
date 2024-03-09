-------------------------------------------
--Libreries
WF = require("libs/windfield/init")
Object = require("libs/classic/classic")
Timer = require("libs/hump/timer")
Input = require("libs/boipushy/Input")
Moses = require("libs/moses/moses")
ButtonManager = require("libs.Simple-Button.simplebutton")
-------------------------------------------
--Load all objects
require("globals")
--basics objects
require("Objects/Room")
require("Objects/Area")
require("Objects/GameObject")

require("Objects/Tile")

-------------------------------------------
function love.load()
	love.math.setRandomSeed(os.time())
	love.graphics.setDefaultFilter("nearest", "nearest")

	MyFont = love.graphics.newFont("fonts/PixelifySans-VariableFont_wght.ttf", 12)
	MyFont:setFilter("nearest", "nearest")
	love.graphics.setFont(MyFont)
	love.graphics.setLineStyle("rough")

	MainTimer = Timer()
	MainTimer:every(1, function()
		print("Before collection: " .. collectgarbage("count") / 1024)
		collectgarbage()
		print("Before collection: " .. collectgarbage("count") / 1024)
	end)
	CurrentRoom = Room()
end

function love.update(dt)
	MainTimer:update(dt)
	if CurrentRoom then
		CurrentRoom:update(dt)
	end
end

function love.draw()
	if CurrentRoom then
		CurrentRoom:draw()
	end
end

function GotoRoom(room_type, ...)
	CurrentRoom = _G[room_type](...)
end

function Resize(s)
	love.window.setMode(s * Gw, s * Gh)
	Sx, Sy = s, s
end

function UUID()
	local fn = function(x)
		local r = math.random(16) - 1
		r = (x == "x") and (r + 1) or (r % 4) + 9
		return ("0123456789abcdef"):sub(r, r)
	end
	return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
end
