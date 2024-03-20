BG_color_light = { 203 / 255, 219 / 255, 252 / 255 }
BG_color_dark = { 0 / 255, 0 / 255, 0 / 255 }

function LoadImage(path)
	local info = love.filesystem.getInfo(path)
	if info then
		return love.graphics.newImage(path)
	end
end

--Tile types
Tile_red = {
	size = 3,
	img = "Objects/assets/red_tile.png",
	offsetX = 1,
	scale = 2,
	color = "red",
}
Tile_blue = {
	size = 3,
	img = "Objects/assets/blue_tile.png",
	corn = 4,
	scale = 2,
	color = "blue",
}
Tile_orange = {
	size = 3,
	img = "Objects/assets/orange_tile.png",
	corn = 1,
	scale = 2,
	color = "orange",
}
Tile_green = {
	size = 3,
	img = "Objects/assets/green_tile.png",
	corn = 2,
	scale = 2,
	color = "green",
}

--Cars
Car_small = {
	h = 10,
	w = 20,
	w1_radius = 5,
	w2_radius = 5,
	max_vel = 5,
}
