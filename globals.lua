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
	body_data = {
		bounds = { 0, 0, 0, 20, 40, 20 },
		max_vel = 10000,
		max_motor_torque = 10000,
	},
	wheels_data = {
		{
			img = "Objects/assets/cars/s1/w1.png",
			radius = 14,
			position_joint_offset = { x = 0, y = 20 },
			ratio_damp = 0.5,
			spring_frec = 7,
			motor_enable = true,
		},
		{
			img = "Objects/assets/cars/s1/w2.png",
			radius = 8,
			position_joint_offset = { x = 40, y = 20 },
			ratio_damp = 0.5,
			spring_frec = 7,
			motor_enable = false,
		},
	},
}

Controls_p1 = {
	left = "a",
	right = "d",
	up = "w",
	down = "s",
}

Controls_p2 = {
	left = "left",
	right = "right",
	up = "up",
	down = "down",
}

Colors = {
	black = { 29 / 255, 32 / 255, 33 / 255, 1 },
	gray1 = { 40 / 255, 40 / 255, 40 / 255, 1 },
	gray2 = { 50 / 255, 48 / 255, 47 / 255, 1 },
	gray3 = { 60 / 255, 56 / 255, 54 / 255, 1 },
	gray4 = { 80 / 255, 73 / 255, 69 / 255, 1 },
	gray5 = { 102 / 255, 92 / 255, 84 / 255, 1 },
	gray6 = { 124 / 255, 111 / 255, 100 / 255, 1 },
	gray7 = { 146 / 255, 131 / 255, 116 / 255, 1 },
	gray8 = { 146 / 255, 131 / 255, 116 / 255, 1 },
	cream1 = { 249 / 255, 245 / 255, 215 / 255, 1 },
	cream2 = { 253 / 255, 244 / 255, 193 / 255, 1 },
	cream3 = { 242 / 255, 229 / 255, 188 / 255, 1 },
	cream4 = { 235 / 255, 219 / 255, 178 / 255, 1 },
	cream5 = { 213 / 255, 196 / 255, 161 / 255, 1 },
	cream6 = { 189 / 255, 174 / 255, 147 / 255, 1 },
	cream7 = { 168 / 255, 153 / 255, 132 / 255, 1 },
	cream8 = { 168 / 255, 153 / 255, 132 / 255, 1 },
	red1 = { 251 / 255, 73 / 255, 52 / 255, 1 },
	green1 = { 184 / 255, 187 / 255, 38 / 255, 1 },
	yellow1 = { 250 / 255, 189 / 255, 47 / 255, 1 },
	green2 = { 131 / 255, 165 / 255, 152 / 255, 1 },
	pink1 = { 211 / 255, 134 / 255, 155 / 255, 1 },
	green3 = { 142 / 255, 192 / 255, 124 / 255, 1 },
	orange1 = { 254 / 255, 128 / 255, 25 / 255, 1 },
	red2 = { 204 / 255, 36 / 255, 29 / 255, 1 },
	green4 = { 152 / 255, 151 / 255, 26 / 255, 1 },
	orange2 = { 215 / 255, 153 / 255, 33 / 255, 1 },
	blue1 = { 69 / 255, 133 / 255, 136 / 255, 1 },
	pink2 = { 177 / 255, 98 / 255, 134 / 255, 1 },
	green5 = { 104 / 255, 157 / 255, 106 / 255, 1 },
	orange3 = { 214 / 255, 93 / 255, 14 / 255, 1 },
	red3 = { 157 / 255, 0 / 255, 6 / 255, 1 },
	green6 = { 121 / 255, 116 / 255, 14 / 255, 1 },
	orange4 = { 181 / 255, 118 / 255, 20 / 255, 1 },
	blue2 = { 7 / 255, 102 / 255, 120 / 255, 1 },
	pink3 = { 143 / 255, 63 / 255, 113 / 255, 1 },
	green7 = { 66 / 255, 123 / 255, 88 / 255, 1 },
	orange5 = { 175 / 255, 58 / 255, 3 / 255, 1 },
}
