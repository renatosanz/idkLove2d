Room = Object:extend()

function Room:new()
	self.area = Area(self)
	self.main_canvas = love.graphics.newCanvas(Gw, Gh)

	self.current_map = Donut_map
	self.area:ChargeMap(self.current_map)

	self.p1_ops = Cyber
	self.p1_ops.controls = Controls_p1
	self.p1_ops.isInvert = false
	self.area:addGameObject("Car", self.current_map.p1_coors.x, self.current_map.p1_coors.y, self.p1_ops)

	self.p2_ops = FishCar
	self.p2_ops.controls = Controls_p2
	self.p2_ops.isInvert = true
	self.area:addGameObject("Car", self.current_map.p2_coors.x, self.current_map.p2_coors.y, self.p2_ops)
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
