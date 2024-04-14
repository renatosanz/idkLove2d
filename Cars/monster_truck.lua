MonsterTruck = {
	body_data = {
		bounds = { 0, 14, 22, 2, 34, 2, 61, 14, 62, 30, 0, 30 },
		max_vel = 10000,
		max_motor_torque = 20000,
		img = "Assets/monster_truck/body.png",
		img_offset = { x = 0, y = 3 },
		scale = { x = 2, y = 2 },
	},
	wheels_data = {
		{
			img = "Assets/monster_truck/w.png",
			radius = 12,
			position_joint_offset = { x = 12, y = 32 },
			ratio_damp = 0.7,
			spring_frec = 4,
			friction = 1,
			motor_enable = true,
			restitution = 0,
			scale = { x = 2, y = 2 },
		},
		{
			img = "Assets/monster_truck/w.png",
			radius = 12,
			position_joint_offset = { x = 50, y = 32 },
			ratio_damp = 0.7,
			spring_frec = 4,
			friction = 1,
			motor_enable = true,
			restitution = 0,
			scale = { x = 2, y = 2 },
		},
	},
}
