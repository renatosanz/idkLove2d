Area = Object:extend()

function Area:new(room)
	self.room = room
	self.game_objects = {}

	self.bodyWorld = WF.newWorld(0, 500)
	self.bodyWorld:addCollisionClass("Ground")
	self.bodyWorld:addCollisionClass("Tile")
	self.bodyWorld:addCollisionClass("WheelCar")
	self.bodyWorld:addCollisionClass("BodyCar", { ignores = { "WheelCar" } })

	self.floor = self.bodyWorld:newRectangleCollider(0, Gh, Gw, 1)
	self.roof = self.bodyWorld:newRectangleCollider(0, 0, Gw, 1)
	self.wall_left = self.bodyWorld:newRectangleCollider(0, 0, 1, Gh)
	self.wall_right = self.bodyWorld:newRectangleCollider(Gw, 0, 1, Gh)

	self.floor:setCollisionClass("Ground")
	self.roof:setCollisionClass("Ground")
	self.wall_left:setCollisionClass("Ground")
	self.wall_right:setCollisionClass("Ground")

	self.floor:setFriction(1)
	self.roof:setFriction(1)
	self.wall_left:setFriction(1)
	self.wall_right:setFriction(1)

	self.floor:setType("static")
	self.roof:setType("static")
	self.wall_left:setType("static")
	self.wall_right:setType("static")

	self.timer = Timer()

	self.isMouseVisible = false
	love.mouse.setVisible(self.isMouseVisible)
	love.graphics.setBackgroundColor(BG_color_light)
	self.input = Input()
	self.input:bind("1", "leave_game")
	Resize(2)
end

function Area:update(dt)
	self.timer:update(dt)
	self.bodyWorld:update(dt)

	for i, game_object in ipairs(self.game_objects) do
		if not game_object.dead then
			game_object:update(dt)
		else
			if game_object.body then
				game_object.body:destroy()
			end
			table.remove(self.game_objects, i)
		end
	end
	if self.input:pressed("leave_game") then
		love.event.quit()
	end
end

function Area:draw()
	self.bodyWorld:draw()
	for _, game_object in ipairs(self.game_objects) do
		game_object:draw()
	end
	self:draw_mouse()
end

function Area:addGameObject(game_object_type, x, y, opts)
	local optss = opts or {}
	local game_object = _G[game_object_type](self, x or 0, y or 0, optss)
	table.insert(self.game_objects, game_object)
	return game_object
end

function Area:draw_mouse()
	love.graphics.push()
	love.graphics.setColor(BG_color_dark)
	local mouse_x, mouse_y = love.mouse.getPosition()
	love.graphics.line({ mouse_x / Sx, mouse_y / Sy, mouse_x / Sx + 2, mouse_y / Sy + 2 })
	love.graphics.line({ mouse_x / Sx, mouse_y / Sy, mouse_x / Sx - 2, mouse_y / Sy + 2 })
	love.graphics.line({ mouse_x / Sx, mouse_y / Sy, mouse_x / Sx + 2, mouse_y / Sy - 2 })
	love.graphics.line({ mouse_x / Sx, mouse_y / Sy, mouse_x / Sx - 2, mouse_y / Sy - 2 })
	love.graphics.pop()
end

function Area:getNearestItem(x, y, radius)
	local nearItem = nil
	local nearestLengthSquared = radius * radius

	for _, obj in ipairs(self.game_objects) do
		if obj.type == "Item" and not obj.dead then
			local dx = x - obj.x
			local dy = y - obj.y
			local distanceSquared = dx * dx + dy * dy

			if distanceSquared < nearestLengthSquared then
				nearItem = obj
				nearestLengthSquared = distanceSquared
			end
		end
	end
	return nearItem
end
