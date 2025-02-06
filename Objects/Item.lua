Item = GameObject:extend()

function Item:new(area, x, y, opts)
	self.super:new(area, x, y, opts)
	--vars
	self.conf = opts
	self.size = opts.size or 10
	self.input = Input()
	if opts.img then
		self.img = LoadImage(opts.img)
		print("hay img", self.img)
	end
	self.body = area.bodyWorld:newRectangleCollider(x, y, (self.size + 0.5), (self.size + 0.5))
	self.body:setObject(self)
	self.body:setCollisionClass("Item")
	self.body:setRestitution(opts.restitution)
	self.joint = false
end

function Item:update(dt)
	self.super:update(dt)
	self:updatePosition()
end

function Item:draw()
	love.graphics.push()
	love.graphics.translate(self.x, self.y)
	love.graphics.rotate(self.body:getAngle())
	if self.img then
		love.graphics.draw(self.img, -self.img:getWidth() / 2, -self.img:getHeight() / 2, 0, self.scale, self.scale)
	else
		love.graphics.rectangle("fill", -self.size / 2, -self.size / 2, self.size, self.size)
	end
	love.graphics.pop()
end

function Item:updatePosition()
	self.x, self.y = self.body:getPosition()
end
