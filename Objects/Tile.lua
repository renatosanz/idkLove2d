
Tile = Object:extend()

function Tile:new(area, x, y, opts)
	self:super(area, x, y, opts)
end

function Tile:update(dt)
	self.super(dt)
end

function Tile:draw() end
