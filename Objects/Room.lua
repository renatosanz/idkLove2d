Room = Object:extend()

function Room:new()
	self.area = Area(self)
	self.main_canvas = love.graphics.newCanvas(Gw, Gh)

	local p1_ops = MonsterTruck
	p1_ops.controls = Controls_p1
	p1_ops.isInvert = false
	self.area:addGameObject("Car", 30, 20, p1_ops)

	local p2_ops = MonsterTruck
	p2_ops.controls = Controls_p2
	p2_ops.isInvert = true
	self.area:addGameObject("Car", 200, 20, p2_ops)
end

function Room:update(dt)
	self.area:update(dt)
end

function Room:draw()
	love.graphics.setCanvas(self.main_canvas)
	love.graphics.clear()

	--draw all my things
	self.area:draw()

	love.graphics.setCanvas()

	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.setBlendMode("alpha", "premultiplied")
	love.graphics.draw(self.main_canvas, 0, 0, 0, Sx, Sy)
	love.graphics.setBlendMode("alpha")
end

function love.mousepressed(x, y, msbutton, istouch, presses)
	ButtonManager.mousepressed(x / Sx, y / Sy, msbutton)
end

function love.mousereleased(x, y, msbutton, istouch, presses)
	ButtonManager.mousereleased(x / Sx, y / Sy, msbutton)
end
