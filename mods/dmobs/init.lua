
-- dmobs by D00Med

mobs:register_mob("dmobs:panda", {
	type = "animal",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 12,
	hp_max = 22,
	armor = 130,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	mesh = "panda.b3d",
	textures = {
		{"dmobs_panda.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	replace_rate = 10,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "ethereal:bamboo"},
	replace_with = "air",
	follow = {"default:papyrus"},
	view_range = 14,
	animation = {
		speed_normal = 5,
		speed_run = 10,
		walk_start = 3,
		walk_end = 13,
		stand_start = 20,
		stand_end = 26,
		run_start = 3,
		run_end = 13,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("dmobs:panda", {"default:dirt_with_grass","ethereal:bamboo_dirt"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("dmobs:panda", "Panda", "default_papyrus.png", 1)

mobs:register_mob("dmobs:hedgehog", {
	type = "animal",
	passive = true,
	hp_min = 12,
	hp_max = 22,
	armor = 130,
	collisionbox = {-0.1, -0.1, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "hedgehog.b3d",
	textures = {
		{"dmobs_hedgehog.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = true,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	follow = {"farming:bread"},
	animation = {
		speed_normal = 5,
		speed_run = 10,
		walk_start = 1,
		walk_end = 10,
		stand_start = 1,
		stand_end = 10,
		run_start = 1,
		run_end = 10,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("dmobs:hedgehog", {"default:dirt_with_grass","default:pine_needles"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("dmobs:hedgehog", "Hedgehog", "wool_brown.png", 1)

mobs:register_mob("dmobs:owl", {
	type = "animal",
	passive = true,
	hp_min = 12,
	hp_max = 22,
	armor = 130,
	collisionbox = {-0.3, -0.5, -0.3, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "owl.b3d",
	textures = {
		{"dmobs_owl.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = false,
	walk_velocity = 0,
	run_velocity = 0,
	jump = false,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	view_range = 1,
	animation = {
		speed_normal = 5,
		walk_start = 1,
		walk_end = 20,

	},
})

mobs:register_spawn("dmobs:owl", {"default:leaves","default:tree"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("dmobs:owl", "Owl", "default_tree.png", 1)


mobs:register_mob("dmobs:elephant", {
	type = "animal",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 12,
	hp_max = 22,
	armor = 130,
	collisionbox = {-0.9, -1.2, -0.9, 0.9, 0.9, 0.9},
	visual = "mesh",
	mesh = "elephant.b3d",
	textures = {
		{"dmobs_elephant.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = false,
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	replace_rate = 10,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "ethereal:bamboo"},
	replace_with = "air",
	follow = {"farming:wheat"},
	view_range = 14,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	animation = {
		speed_normal = 5,
		speed_run = 10,
		walk_start = 3,
		walk_end = 19,
		stand_start = 20,
		stand_end = 30,
		run_start = 3,
		run_end = 19,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("dmobs:elephant", {"default:dirt_with_dry_grass","default:desert_sand"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("dmobs:elephant", "Elephant", "default_dry_grass.png", 1)

mobs:register_mob("dmobs:orc", {
	type = "monster",
	passive = false,
	reach = 1,
--	damage = 2,
    damage = 5,
	attack_type = "dogfight",
--	hp_min = 12,
--	hp_max = 22,
	hp_min = 82,
	hp_max = 132,
	armor = 130,
	collisionbox = {-0.4, -1.3, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "orc.b3d",
	textures = {
		{"dmobs_orc.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 14,
	animation = {
		speed_normal = 10,
		speed_run = 20,
		walk_start = 2,
		walk_end = 18,
		stand_start = 30,
		stand_end = 40,
		run_start = 2,
		run_end = 18,
		punch_start = 20,
		punch_end = 30,

	},
})

mobs:register_spawn("dmobs:orc", {"default:snow","default:snow_block", "default:desert_sand"}, 20, 10, 15000, 2, 31000)

mobs:register_egg("dmobs:orc", "Orc", "default_desert_sand.png", 1)

local l_skins = {
		{"dmobs_dragon.png"},
		{"dmobs_dragon.png^[colorize:blue:150"},
		{"dmobs_dragon.png^[colorize:purple:150"},
		{"dmobs_dragon.png^[colorize:green:150"},
		{"dmobs_dragon.png^[colorize:black:150"},
		{"dmobs_dragon.png^[colorize:white:150"},
	}

mobs:register_mob("dmobs:dragon", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 8,
   reach = 2,
   attack_type = "shoot",
   shoot_interval = 2.5,
   arrow = "dmobs:fire",
   shoot_offset = 1,
   hp_min = 30,
   hp_max = 45,
   armor = 80,
   collisionbox = {-0.6, -0.9, -0.6, 0.6, 0.6, 0.6},
   visual = "mesh",
   mesh = "dragon2.b3d",
   textures = l_skins,
   blood_texture = "mobs_blood.png",
   visual_size = {x=3, y=3},
   makes_footstep_sound = true,
   sounds = {
      shoot_attack = "mobs_fireball",
   },
   walk_velocity = 3,
   run_velocity = 5,
   jump = true,
   fly = true,
   rotate = 180,
   drops = {
      {name = "mobs:lava_orb", chance = 1, min = 1, max = 1},
   },
   fall_speed = 0,
   stepheight = 10,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 11,
      walk_end = 21,
      stand_start = 11,
      stand_end = 21,
      run_start = 11,
      run_end = 21,
      punch_start = 21,
      punch_end = 31,
   },
})

mobs:spawn_specific("dmobs:dragon", {"air"}, {"default:stone"}, 20, 10, 300, 15000, 2, -100, 11000)

mobs:register_egg("dmobs:dragon", "Dragon", "default_apple.png", 1)

--Thanks to Tenplus1
mobs:register_arrow("dmobs:fire", {
   visual = "sprite",
   visual_size = {x = 0.5, y = 0.5},
   textures = {"dmobs_fire.png"},
   velocity = 8,
   tail = 1, -- enable tail
   tail_texture = "dmobs_fire.png",

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 8},
      }, nil)
   end,

   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 8},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      mobs:explosion(pos, 2, 1, 1)
   end,
})
