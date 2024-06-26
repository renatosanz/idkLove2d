Car = GameObject:extend()

function Car:new(area, x, y, opts)
	self.super:new(area, x, y, opts)

	self.classWheels = "WheelCar" .. opts.controls.name
	self.classBody = "BodyCar" .. opts.controls.name
	self.area.bodyWorld:addCollisionClass(self.classBody)
	self.area.bodyWorld:addCollisionClass(self.classWheels, { ignores = { self.classBody } })
	--vars

	self.input = Input()
	self.time = Timer()
	self.isInvert = opts.isInvert
	--self.img = LoadImage(opts.img)

	self.car = {
		body = area.bodyWorld:newPolygonCollider(x, y, opts.body_data.bounds, self.isInvert),
		img = LoadImage(opts.body_data.img),
		angle = 0,
		velMax = opts.body_data.max_vel,
		maxTorque = opts.body_data.max_motor_torque,
		x1 = 0,
		y1 = 0,
		img_offset = opts.body_data.img_offset,
		img_scale = opts.body_data.scale,
	}
	self.car.body:setCollisionClass(self.classBody)
	self.car.body:setObject(self)
	self.car.body:setRestitution(0)
	self.car.body:setFriction(1)

	self.wheels = {}
	for i, w in ipairs(opts.wheels_data) do
		local auxWheel = area.bodyWorld:newCircleCollider(
			x + self:invX(w.position_joint_offset.x),
			y + w.position_joint_offset.y,
			w.radius
		)
		auxWheel:setCollisionClass(self.classWheels)
		auxWheel:setObject(self)
		auxWheel:setRestitution(w.restitution)
		auxWheel:setFriction(w.friction)
		auxWheel:setInertia(0)
		auxWheel:setGravityScale(2)

		local auxJoint = area.bodyWorld:addJoint(
			"WheelJoint",
			self.car.body,
			auxWheel,
			x + self:invX(w.position_joint_offset.x),
			y + w.position_joint_offset.y,
			1,
			1,
			false
		)
		auxJoint:setMotorEnabled(w.motor_enable)
		auxJoint:setSpringDampingRatio(w.ratio_damp)
		auxJoint:setSpringFrequency(w.spring_frec)
		auxJoint:setMaxMotorTorque(self.car.maxTorque)

		table.insert(self.wheels, {
			id = i,
			angle = 0,
			x = 0,
			y = 0,
			img = LoadImage(w.img),
			scale = w.scale,
			wheel_body = auxWheel,
			wheel_joint = auxJoint,
		})
	end

	self.input:bind(opts.controls.right, "go_right")
	self.input:bind(opts.controls.left, "go_left")
	self.input:bind(opts.controls.down, "stop")
	self.input:bind(opts.controls.up, "jump")

	--states
	self.isMoving = false
	self.isJumpEnable = true
	self.stats = {
		jump = {
			circleJump = 1,
		},
	}
end

function Car:update(dt)
	self.super:update(dt)
	self.time:update(dt)
	if self.input:down("go_right") then
		for _, w in ipairs(self.wheels) do
			w.wheel_joint:setMotorSpeed(self.car.velMax)
		end
		self.isMoving = true
	elseif self.input:down("go_left") then
		for _, w in ipairs(self.wheels) do
			w.wheel_joint:setMotorSpeed(-self.car.velMax)
		end
		self.isMoving = true
	else
		if self.input:down("stop") then
			self.isMoving = false
		end
		for _, w in ipairs(self.wheels) do
			w.wheel_joint:setMotorSpeed(0)
		end
	end

	if self.input:pressed("jump") and self.isJumpEnable then
		self.car.body:applyLinearImpulse(0, -1000)
		self.isJumpEnable = false
		self.stats.jump.circleJump = 0
		self.time:tween(1, self.stats.jump, { circleJump = 1 }, "in-out-cubic", function()
			self.isJumpEnable = true
		end)
	end

	if self.isMoving then
		for _, w in ipairs(self.wheels) do
			w.wheel_body:setFixedRotation(false)
		end
	else
		for _, w in ipairs(self.wheels) do
			w.wheel_body:setFixedRotation(true)
		end
	end
	self:UpdatePosition()
end

function Car:draw()
	love.graphics.push()
	love.graphics.translate(self.x, self.y)
	love.graphics.rotate(self.car.angle)
	love.graphics.scale(self.car.img_scale.x, self.car.img_scale.y)
	love.graphics.draw(
		self.car.img,
		self:invX(-1) * (self.car.img:getWidth() + self.car.img_offset.x) / 2,
		-(self.car.img:getHeight() + self.car.img_offset.y) / 2,
		0,
		self:invX(1),
		1
	)
	love.graphics.pop()

	for _, w in ipairs(self.wheels) do
		love.graphics.push()
		love.graphics.translate(w.x, w.y)
		love.graphics.rotate(w.angle)
		love.graphics.scale(w.scale.x, w.scale.y)
		love.graphics.draw(w.img, -w.img:getWidth() / 2, -w.img:getHeight() / 2, 0, 1, 1)
		love.graphics.pop()
	end
	self:DrawStats()
end

function Car:UpdatePosition()
	self.x, self.y = self.car.body:getWorldCenter()
	self.car.angle = self.car.body:getAngle()

	for _, w in ipairs(self.wheels) do
		w.angle = w.wheel_body:getAngle()
		w.x, w.y = w.wheel_body:getPosition()
	end
end

function Car:DrawStats()
	love.graphics.push()
	love.graphics.translate(self.x, self.y)
	love.graphics.arc("fill", "pie", -self:invX(1) * 20, -30, 10, 0, self.stats.jump.circleJump * FullCircle)
	love.graphics.pop()
end

function Car:invX(x)
	if self.isInvert then
		return -x
	else
		return x
	end
end
