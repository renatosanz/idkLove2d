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
}
Tile_blue = {
	size = 3,
	img = "Objects/assets/blue_tile.png",
	corn = 4,
	scale = 2,
}
Tile_orange = {
	size = 3,
	img = "Objects/assets/orange_tile.png",
	corn = 1,
	scale = 2,
}
Tile_green = {
	size = 3,
	img = "Objects/assets/green_tile.png",
	corn = 2,
	scale = 2,
}
