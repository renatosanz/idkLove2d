Car = GameObject:extend()

function Car:new(area, x, y, opts)
	self.super:new(area, x, y, opts)
	--vars
	self.conf = opts

	self.input = Input()
	self.time = Timer()
	--self.img = LoadImage(opts.img)
	self.body = area.bodyWorld:newRectangleCollider(x, y, self.conf.w, self.conf.h)
	self.wheel1 = area.bodyWorld:newCircleCollider(x, y + 10, self.conf.w1_radius)
	self.joint1 = area.bodyWorld:addJoint("WheelJoint", self.body, self.wheel1, x, y + self.conf.h, 0, 1, false)
	self.wheel2 = area.bodyWorld:newCircleCollider(x + 20, y + 10, self.conf.w2_radius)
	self.joint1 =
		area.bodyWorld:addJoint("WheelJoint", self.body, self.wheel2, x + self.conf.w, y + self.conf.h, 0, 1, false)
	self.body:setCollisionClass("BodyCar")
	self.wheel2:setCollisionClass("WheelCar")
	self.wheel1:setCollisionClass("WheelCar")

	self.body:setRestitution(0)
	self.wheel1:setRestitution(0.8)
	self.wheel2:setRestitution(0.8)

	self.wheel1:setFriction(1)
	self.wheel2:setFriction(1)
	self.body:setFriction(1)

	self.body:setObject(self)

	self.w1_x = 0
	self.w1_y = 0
	self.w2_x = 0
	self.w2_y = 0

	self.input:bind("d", "go_right")
	self.input:bind("a", "go_left")
	self.isMoving = false
	self.velocity_x = 0
	self.velocity_y = 0

	self.velMax = self.conf.max_vel
end

function Car:update(dt)
	self.super:update(dt)
	if self.input:down("go_right") then
		self.wheel1:applyAngularImpulse(self.velMax, 0)
		self.wheel2:applyAngularImpulse(self.velMax, 0)
	elseif self.input:down("go_left") then
		self.wheel1:applyAngularImpulse(-self.velMax, 0)
		self.wheel2:applyAngularImpulse(-self.velMax, 0)
	else
	end
	self:UpdatePosition()
end

function Car:draw() end

function Car:UpdatePosition()
	self.x, self.y = self.body:getPosition()
	self.w1_x, self.w1_y = self.body:getPosition()
	self.w2_x, self.w2_y = self.body:getPosition()
	self.velocity_x, self.velocity_y = self.body:getLinearVelocity()
end
