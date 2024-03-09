Room = Object:extend()

function Room:new()
	self.area = Area(self)
	self.main_canvas = love.graphics.newCanvas(Gw, Gh)
	ButtonManager.default.width = 100
	ButtonManager.default.height = 40
	ButtonManager.default.alignment = "center"
	self.playButton = ButtonManager.new("Play", 113, 20, 30, 20)
	self.playButton:setFont("fonts/PixelifySans-VariableFont_wght.ttf")
	self.playButton.onClick = function()
		print("boton")
	end
end

function Room:update(dt)
	self.area:update(dt)
	ButtonManager.update(dt)
end

function Room:draw()
	love.graphics.setCanvas(self.main_canvas)
	love.graphics.clear()
	ButtonManager.draw()

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
