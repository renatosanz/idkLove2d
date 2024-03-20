Tile = GameObject:extend()

function Tile:new(area, x, y, opts)
	self.super:new(area, x, y, opts)
	--vars
	self.conf = opts
	self.size = opts.size
	self.scale = opts.scale
	self.input = Input()
	self.img = LoadImage(opts.img)
	--to let the tiles fit with themselves, they need a extra gap of 0.5*scale
	self.body =
		area.bodyWorld:newRectangleCollider(x, y, (self.size + 0.5) * self.scale, (self.size + 0.5) * self.scale)
	self.body:setObject(self)
	self.body:setCollisionClass("Tile")
	self.body:setRestitution(0.9)
	self.joint = false
end

function Tile:update(dt)
	self.super:update(dt)

	self:UpdatePosition()
end

function Tile:draw()
	love.graphics.push()
	love.graphics.translate(self.x, self.y)
	love.graphics.rotate(self.body:getAngle())
	love.graphics.draw(
		self.img,
		-self.img:getWidth() / 2 * self.scale,
		-self.img:getHeight() / 2 * self.scale,
		0,
		self.scale,
		self.scale
	)
	love.graphics.pop()
end

function Tile:UpdatePosition()
	self.x, self.y = self.body:getPosition()
end

function Tile:getSide()
	local ang = math.deg(self.body:getAngle()) % 360
	if ang < 45 and ang > 315 then
		return 0
	elseif ang < 135 and ang > 45 then
		return 90
	elseif ang < 225 and ang > 135 then
		return 180
	elseif ang < 315 and ang > 225 then
		return 270
	end
end
