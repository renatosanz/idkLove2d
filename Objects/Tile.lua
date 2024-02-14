Tile = GameObject:extend()

function Tile:new(area, x, y, opts)
	self.super:new(area, x, y, opts)
	--vars
	self.size = opts.size
	self.input = Input()
	self.img = LoadImage("Objects/assets/tilebox.png")
	self.body = area.bodyWorld:newRectangleCollider(x, y, self.size, self.size)
	self.body:setObject(self)
	self.body:setRestitution(0.8)
end

function Tile:update(dt)
	self.super:update(dt)
	self:UpdatePosition()
end

function Tile:draw()
	love.graphics.draw(self.img, self.x, self.y)
end

function Tile:UpdatePosition()
	self.x, self.y = self.body:getPosition()
	self.x, self.y = self.x - self.size / 2, self.y - self.size / 2
end
