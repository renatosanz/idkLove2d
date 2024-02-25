BG_color_light = { 250 / 255, 235 / 255, 215 / 255 }
BG_color_dark = { 0 / 255, 0 / 255, 0 / 255 }

function LoadImage(path)
	local info = love.filesystem.getInfo(path)
	if info then
		return love.graphics.newImage(path)
	end
end
