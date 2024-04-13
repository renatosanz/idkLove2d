MonsterTruck = {
	body_data = {
		bounds = { 0, 14, 28, 2, 42, 2, 80, 14, 80, 32, 0, 32 },
		max_vel = 10000,
		max_motor_torque = 50000,
		img = "Assets/body_cars/monster_truck/body.png",
		img_offset = { x = 0, y = 0 },
		scale = { x = 2, y = 2 },
	},
	wheels_data = {
		{
			img = "Assets/wheels/monster_truck/w.png",
			radius = 20,
			position_joint_offset = { x = 12, y = 40 },
			ratio_damp = 0.3,
			spring_frec = 4,
			friction = 1,
			motor_enable = true,
			restitution = 0.5,
			scale = { x = 2, y = 2 },
		},
		{
			img = "Assets/wheels/monster_truck/w.png",
			radius = 20,
			position_joint_offset = { x = 66, y = 40 },
			ratio_damp = 0.3,
			spring_frec = 4,
			friction = 1,
			motor_enable = true,
			restitution = 0.5,
			scale = { x = 2, y = 2 },
		},
	},
}
