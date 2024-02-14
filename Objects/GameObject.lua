GameObject = Object:extend()

function GameObject:new(area, x, y, opts)
	self.area = area
	self.img = nil
	self.x, self.y = x, y
	self.id = UUID()
	self.dead = false
	self.timer = Timer()
end

function GameObject:update(dt)
	if self.timer then
		self.timer:update(dt)
	end
end

function GameObject:draw() end
