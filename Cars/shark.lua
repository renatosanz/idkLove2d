Shark = {
	body_data = {
		bounds = { 0, 6, 28, 2, 59, 16, 40, 26, 30, 26, 2, 22 },
		max_vel = 100,
		max_motor_torque = 20000,
		img = "Assets/shark/body.png",
		img_offset = { x = -2, y = 0 },
		scale = { x = 2, y = 2 },
	},
	wheels_data = {
		{
			img = "Assets/s1/w1.png",
			radius = 14,
			position_joint_offset = { x = 14, y = 24 },
			ratio_damp = 0.7,
			spring_frec = 5,
			motor_enable = true,
			restitution = 0.4,
			friction = 1,
			scale = { x = 2, y = 2 },
		},
		{
			img = "Assets/s1/w2.png",
			radius = 8,
			position_joint_offset = { x = 46, y = 24 },
			ratio_damp = 0.7,
			spring_frec = 5,
			motor_enable = false,
			restitution = 0.4,
			friction = 1,
			scale = { x = 2, y = 2 },
		},
	},
}
