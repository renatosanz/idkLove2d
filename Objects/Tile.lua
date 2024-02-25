Tile = GameObject:extend()

function Tile:new(area, x, y, opts)
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
    -self.size / 2,
    -self.size / 2,
    0,
    self.size / self.img:getWidth(),
    self.size / self.img:getHeight()
  )
  love.graphics.pop()
end

function Tile:UpdatePosition()
  self.x, self.y = self.body:getPosition()
end
