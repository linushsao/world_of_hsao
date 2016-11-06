
-- Ninja


mobs:register_arrow("pmobs:shuriken", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"mobs_shuriken.png"},
	velocity = 6,
	drop = true,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
		full_punch_interval=1.0,
		damage_groups = {fleshy=3},
		}, 0)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
		full_punch_interval=1.0,
		damage_groups = {fleshy=3},
		}, 0)
	end,

	hit_node = function(self, pos, node)
	end,
})

-- shuriken throwing item

local shuriken_GRAVITY=9
local shuriken_VELOCITY=19

--Shoot shuriken
local mobs_shoot_shuriken=function (item, player, pointed_thing)
	local playerpos=player:getpos()
	local obj=minetest.add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, "pmobs:shuriken")
	local dir=player:get_look_dir()
	obj:get_luaentity().velocity = shuriken_VELOCITY -- needed for api internal timing
	obj:setvelocity({x=dir.x*shuriken_VELOCITY, y=dir.y*shuriken_VELOCITY, z=dir.z*shuriken_VELOCITY})
	obj:setacceleration({x=dir.x*-3, y=-shuriken_GRAVITY, z=dir.z*-3})
	item:take_item()
	return item
end

-- shuriken item
minetest.register_craftitem("pmobs:shuriken", {
description = "Shuriken",
	inventory_image = "mobs_shuriken.png",
	on_use = function(item, player)
		if mobs_shoot_shuriken(item, player, pointed_thing) then
			if not minetest.setting_getbool("creative_mode") then
				item:add_wear(65535/50)
			end
		end
		return item
	end,
})

-- recipe
minetest.register_craft({
	output = "pmobs:shuriken 16",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"", "default:steel_ingot", ""},
	}
})

