Donut_map = {
	name = "Donut",
	bg_img = "Assets/maps/donut/bg_img.png",
	p1_coors = { x = 150, y = 30 },
	p2_coors = { x = Gw - 150, y = 30 },
	circles = {
		{
			x = 110,
			y = Gh / 2,
			radius = 40,
			type = "static",
		},
		{
			x = Gw - 110,
			y = Gh / 2,
			radius = 40,
			type = "static",
		},
	},
	polygons = {
		{
			vertices = { 0, 0, 0, -100, 12.5, -62.5, 62.5, -12.5, 100, 0 },
			x = 0,
			y = Gh,
			type = "static",
		},
		{
			vertices = { 0, 0, 0, -100, -12.5, -62.5, -62.5, -12.5, -100, 0 },
			x = Gw,
			y = Gh,
			type = "static",
		},
		{
			vertices = { 0, 0, 0, 100, -12.5, 62.5, -62.5, 12.5, -100, 0 },
			x = Gw,
			y = 0,
			type = "static",
		},
		{
			vertices = { 0, 0, 0, 100, 12.5, 62.5, 62.5, 12.5, 100, 0 },
			x = 0,
			y = 0,
			type = "static",
		},
	},
	rects = {
		{
			x = 110,
			y = Gh / 2 - 40,
			h = Gw - 220,
			w = 80,
			type = "static",
		},
	},
}
