-------------------------------------------------------------------------------
-- Mob Framework Mod by Sapier
--
-- You may copy, use, modify or do nearly anything except removing this
-- copyright notice.
-- And of course you are NOT allow to pretend you have written it.
--
--! @file init.lua
--! @brief npc implementation
--! @copyright Sapier
--! @author Sapier
--! @date 2013-01-27
--
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------

-- Boilerplate to support localized strings if intllib mod is installed.
-- Austin's TC ratio = 9.22 (2016.10.25)



local S
if (minetest.get_modpath("intllib")) then
  dofile(minetest.get_modpath("intllib").."/intllib.lua")
  S = intllib.Getter(minetest.get_current_modname())
else
  S = function ( s ) return s end
end

--minetest.log("action","MOD: mob_npc mod loading ...")



local version = "0.2.1"
local npc_groups = {
						not_in_creative_inventory=1
					}

local modpath = minetest.get_modpath("mob_npc")

--dofile (modpath .. "/spawn_building.lua")

--[[
local npc_prototype = {
		name="npc",
		modname="mob_npc",

		factions = {
			member = {
				"npc",
				}
			},

		generic = {
					description="NPC",
					base_health=40,
					kill_result="",
					armor_groups= {
						fleshy=90,
					},
					groups = npc_groups,
					envid="simple_air",
					population_density=0,
				},
		movement =  {
					min_accel=0.3,
					max_accel=0.7,
					max_speed=1.5,
					min_speed=0.01,
					pattern="stop_and_go",
					canfly=false,
					},
		states = {
				{
				name = "walking",
				movgen = "probab_mov_gen",
				typical_state_time = 180,
				chance = 0.50,
				animation = "walk",
				},
				{
				name = "default",
				movgen = "none",
				typical_state_time = 180,
				chance = 0.00,
				animation = "stand",
				graphics_3d = {
					visual = "mesh",
					mesh = "npc_character_.b3d",
					textures = {"zombie.png"},
					collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
					visual_size= {x=1, y=1},
					},
				},
			},
		animation = {
				walk = {
					start_frame = 168,
					end_frame   = 187,
					},
				stand = {
					start_frame = 0,
					end_frame   = 79,
					},
			},
		}
--]]

local npc_trader_prototype = {
		name="npc_trader_tc",
		modname="mob_npc",

		factions = {
			member = {
				"npc",
				}
			},

		generic = {
					description= S("Trader"),
					base_health=200,
					kill_result="",
					armor_groups= {
						fleshy=60,
					},
					groups = npc_groups,
					envid="simple_air",
					custom_on_activate_handler=mob_inventory.init_trader_inventory,
					population_density=0,
				},
		movement =  {
					min_accel=0.3,
					max_accel=0.7,
					max_speed=1.5,
					min_speed=0.01,
					pattern="stop_and_go",
					canfly=false,
					},
		states = {
				{
				name = "default",
				movgen = "none",
				chance = 0,
				animation = "stand",
				graphics = {
					visual = "upright_sprite",
					sprite_scale={x=1.5,y=2},
					sprite_div = {x=1,y=1},
					visible_height = 2,
					visible_width = 1,
					},
				graphics_3d = {
					visual = "mesh",
					mesh = "npc_character.b3d",
					textures = {"mob_npc_trader_mesh1.png"},
					collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
					visual_size= {x=1, y=1},
					},
				},
			},
		animation = {
				walk = {
					start_frame = 168,
					end_frame   = 187,
					},
				stand = {
					start_frame = 0,
					end_frame   = 79,
					},
			},
		attention = {
				hear_distance = 3,
				hear_distance_value = 0.5,
				view_angle = nil,
				own_view_value = 0,
				remote_view = false,
				remote_view_value = 0,
				attention_distance_value = 0.2,
				watch_threshold = 2,
				attack_threshold = nil,
				attention_distance = 7.5,
				attention_max = 10,
		},
		sound = {
			inventory_open = {
				name="mob_npc_letstrade",
				gain = 0.75,
				max_hear_distance = 5,
			}
		},
		trader_inventory = {
				goods = {
          { "tc:tcoin 105","","tc:picachu_coin 10"},
          { "tc:picachu_coin 10","","tc:tcoin 92"},
          { "tc:tcoin 1","","tc:ibu_coin 1"},
          { "tc:ibu_coin 1","","tc:tcoin 1"},
          { "tc:nc_coin15 1","","tc:nc_coin 15"},
          { "tc:nc_coin30 1","tc:nc_coin15 2","tc:nc_coin 30"},
          { "tc:nc_coin60 1","tc:nc_coin15 4","tc:nc_coin30 2"},
						},
				random_names = { "Hans","Franz","Xaver","Fritz","Thomas","Martin"},
			}
		}

--[[
mobf_spawner_register("npc_trader_spawner_1",
				npc_trader_prototype.modname .. ":" .. npc_trader_prototype.name,
	{
	spawnee = building_spawner.spawnfunc,
	spawn_interval = 120,
	spawn_inside = { "air" },

	absolute_height =
	{
		min = 0,
	},

	mapgen =
	{
		enabled = true,
		retries = 20,
		spawntotal = 1,
	},

	light_around =
	{
		{ type="TIMED_MIN", distance = 0, threshold=LIGHT_MAX +1,time=0.5 },
	},

	cyclic_spawning = false,
	custom_check = building_spawner.spawn_check,
	})
--]]

--register with animals mod
minetest.log("action","\tadding mob "..npc_trader_prototype.name)
mobf_add_mob(npc_trader_prototype)
--[[
minetest.log("action","\tadding mob "..npc_prototype.name)
mobf_add_mob(npc_prototype)
minetest.log("action","MOD: mob_npc mod                version " .. version .. " loaded")
--]]
