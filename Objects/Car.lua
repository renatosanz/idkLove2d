Car = GameObject:extend()

function Car:new(area, x, y, opts)
	self.super:new(area, x, y, opts)
	--vars

	self.input = Input()
	self.time = Timer()
	self.isInvert = opts.isInvert
	--self.img = LoadImage(opts.img)

	self.car = { body = area.bodyWorld:newPolygonCollider(x, y, opts.body_data.bounds, self.isInvert) }
	self.car.body:setCollisionClass("BodyCar")
	self.car.body:setObject(self)
	self.car.body:setRestitution(0)
	self.car.body:setFriction(1)
	self.velMax = opts.body_data.max_vel
	self.maxTorque = opts.body_data.max_motor_torque

	self.wheels = {}
	for i, w in ipairs(opts.wheels_data) do
		local auxWheel = area.bodyWorld:newCircleCollider(
			x + self:invX(w.position_joint_offset.x),
			y + w.position_joint_offset.y,
			w.radius
		)
		auxWheel:setCollisionClass("WheelCar")
		auxWheel:setObject(self)
		auxWheel:setRestitution(0)
		auxWheel:setFriction(1)
		auxWheel:setInertia(1)

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
		auxJoint:setMaxMotorTorque(self.maxTorque)

		table.insert(self.wheels, {
			id = i,
			angle = 0,
			x = 0,
			y = 0,
			img = LoadImage(w.img),
			wheel_body = auxWheel,
			wheel_joint = auxJoint,
		})
	end

	self.input:bind(opts.controls.right, "go_right")
	self.input:bind(opts.controls.left, "go_left")
	self.input:bind(opts.controls.down, "stop")
	self.isMoving = false
end

function Car:update(dt)
	self.super:update(dt)
	self.time:update(dt)
	if self.input:down("go_right") then
		for _, w in ipairs(self.wheels) do
			w.wheel_joint:setMotorSpeed(self.velMax)
		end
		self.isMoving = true
	elseif self.input:down("go_left") then
		for _, w in ipairs(self.wheels) do
			w.wheel_joint:setMotorSpeed(-self.velMax)
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
	for _, w in ipairs(self.wheels) do
		love.graphics.push()
		love.graphics.translate(w.x, w.y)
		love.graphics.rotate(w.angle)
		love.graphics.scale(2, 2)
		love.graphics.draw(w.img, -w.img:getWidth() / 2, -w.img:getHeight() / 2, 0, 1, 1)
		love.graphics.pop()
	end
end

function Car:UpdatePosition()
	self.x, self.y = self.car.body:getPosition()

	for _, w in ipairs(self.wheels) do
		w.angle = w.wheel_body:getAngle()
		w.x, w.y = w.wheel_body:getPosition()
	end
end

function Car:invX(x)
	if self.isInvert then
		return -x
	else
		return x
	end
end
