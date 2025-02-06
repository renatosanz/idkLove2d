Particle = GameObject:extend()

function Particle:new(area, x, y, opts)
	self.super:new(area, x, y, opts)
	--vars
	self.size = opts.size or love.math.random(0.2, 1.5)
	self.body = area.bodyWorld:newCircleCollider(x, y, self.size)
	self.body:setObject(self)
	self.body:setCollisionClass("Particle")
	self.body:setRestitution(0.3)
	self.body:setFriction(0.1)
	self.body:applyLinearImpulse(0, -4)

	self.timer = Timer()
	self.timer:tween(0.5, self, { size = 0 }, "linear", function()
		self.dead = true
	end)
end

function Particle:update(dt)
	self.super:update(dt)
	self.timer:update(dt)
	self:updatePosition()
end

function Particle:draw()
	love.graphics.circle("fill", self.x, self.y, self.size)
end

function Particle:updatePosition()
	self.x, self.y = self.body:getPosition()
end
