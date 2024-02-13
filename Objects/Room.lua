Room = Object:extend()

function Room:new()
	self.area = Area(self)
	self.main_canvas = love.graphics.newCanvas(Gw, Gh)
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
