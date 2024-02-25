Hand = GameObject:extend()

function Hand:new(area, x, y, opts)
	self.super:new(area, x, y, opts)
	--vars
	self.size = opts.size
	self.input = Input()
	self.img = LoadImage("Objects/assets/tilebox.png")
	self.body = area.bodyWorld:newRectangleCollider(x, y, self.size, self.size)
	self.body:setObject(self)
	self.body:setCollisionClass("Tile")
	self.body:setRestitution(0.8)
end

function Hand:update(dt)
	self.super:update(dt)
	self:UpdatePosition()
end

function Hand:draw()
	love.graphics.push()
	love.graphics.draw(self.img, self.x, self.y, 0, 1.4, 1.4)
	love.graphics.pop()
end

function Hand:UpdatePosition()
	self.x, self.y = self.body:getPosition()
	self.x, self.y = self.x - self.size / 2, self.y - self.size / 2
end
