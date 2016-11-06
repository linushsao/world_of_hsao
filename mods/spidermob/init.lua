dofile(minetest.get_modpath("spidermob").."/api.lua")

minetest.register_craftitem("spidermob:meat", {
	description = "Cooked Meat",
	inventory_image = "spidermob_meat.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craftitem("spidermob:meat_raw", {
	description = "Raw Meat",
	inventory_image = "spidermob_meat_raw.png",
})

minetest.register_craft({
	type = "cooking",
	output = "spidermob:meat",
	recipe = "spidermob:meat_raw",
})

spidermob:register_mob("spidermob:spider", {
	type = "monster",
--	hp_min = 15,
--	hp_max = 30,
	hp_min = 35,
	hp_max = 50,

	collisionbox = {-0.9, -0.01, -0.7, 0.7, 0.6, 0.7},
	textures = {"spidermob_spider.png"},
	visual_size = {x=7,y=7},
	visual = "mesh",
	mesh = "spider_model.x",
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
    armor = 200,
	damage = 4,
	drops = {
		{name = "farming:string",
		chance = 2,
		min = 1,
		max = 3,},
		{name = "spidermob:meat_raw",
		chance = 4,
		min = 1,
		max = 2,},

	},
    light_resistant = true,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 1,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		punch_start = 50,
		punch_end = 90,
	},
	jump = true,
	step = 1,
	blood_texture = "spidermob_blood.png",
	sounds = {
		war_cry = "mobs_eerie",
		death = "mobs_howl",
		attack = "mobs_oerkki_attack",
	},
})

spidermob:register_spawn("spidermob:spider", {"default:junglegrass", "default:jungleleaves", "default:jungletree"}, 20, -10, 7500, 3, 31000)
