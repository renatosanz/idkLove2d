Car_small = {
	body_data = {
		bounds = { 0, 0, 0, 20, 40, 20 },
		max_vel = 10000,
		max_motor_torque = 50000,
		img = "Assets/s1/body.png",
		img_offset = { x = -3, y = 4 },
		scale = { x = 2, y = 2 },
	},
	wheels_data = {
		{
			img = "Assets/s1/w1.png",
			radius = 14,
			position_joint_offset = { x = 0, y = 20 },
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
			position_joint_offset = { x = 40, y = 20 },
			ratio_damp = 0.7,
			spring_frec = 5,
			motor_enable = true,
			restitution = 0.4,
			friction = 1,
			scale = { x = 2, y = 2 },
		},
	},
}
