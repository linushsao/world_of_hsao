-- Count the number of pictures.
local function get_picture(number)
	local filename	= minetest.get_modpath("gemalde").."/textures/gemalde_"..number..".png"
	local file		= io.open(filename, "r")
	if file ~= nil then io.close(file) return true else return false end
end

local N = 1

while get_picture(N) == true do
	N = N + 1
end

N = N - 1

-- register for each picture
for n=1, N do

local groups = {choppy=2, dig_immediate=3, picture=1, not_in_creative_inventory=1}
if n == 1 then
	groups = {choppy=2, dig_immediate=3, picture=1}
end

-- node
minetest.register_node("gemalde:node_"..n.."", {
	description = "Picture 3x3#"..n.."",
	drawtype = "signlike",
	tiles = {"gemalde_"..n..".png"},
	visual_scale = 3.0,
	inventory_image = "gemalde_node.png",
	wield_image = "gemalde_node.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = groups,

})

end

--map of wasteland
minetest.register_node("gemalde:node_wasteland_map", {
	description = "Wasteland map",
	drawtype = "signlike",
	tiles = {"gemalde_wasteland_map.png"},
	visual_scale = 3.0,
	inventory_image = "gemalde_node.png",
	wield_image = "gemalde_node.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = groups,

})

--map of LOTR
minetest.register_node("gemalde:node_LOTR_map", {
	description = "LOTR map",
	drawtype = "signlike",
	tiles = {"gemalde_LOTR_map.png"},
	visual_scale = 3.0,
	inventory_image = "gemalde_node.png",
	wield_image = "gemalde_node.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = groups,

})






-- initial craft

--recipe of 地藏菩薩
minetest.register_craft({
	output = 'gemalde:node_2',
	recipe = {
		{'', 'glowtest:yellow_crystal_1',''},
		{'', 'gemalde:node_1',''},
		{'', 'default:mese_crystal',''},
	}
})

--recipe of 文殊菩薩
minetest.register_craft({
	output = 'gemalde:node_3',
	recipe = {
		{'', 'glowtest:red_crystal_1',''},
		{'', 'gemalde:node_1',''},
		{'', 'default:mese_crystal',''},
	}
})

--recipe of 普賢菩薩
minetest.register_craft({
	output = 'gemalde:node_4',
	recipe = {
		{'', 'glowtest:green_crystal_1',''},
		{'', 'gemalde:node_1',''},
		{'', 'default:mese_crystal',''},
	}
})

--recipe of 千光眼菩薩
minetest.register_craft({
	output = 'gemalde:node_5',
	recipe = {
		{'', 'glowtest:blue_crystal_1',''},
		{'', 'gemalde:node_1',''},
		{'', 'default:mese_crystal',''},
	}
})

--recipe of 彌勒菩薩
minetest.register_craft({
	output = 'gemalde:node_6',
	recipe = {
		{'', 'glowtest:pink_crystal_1',''},
		{'', 'gemalde:node_1',''},
		{'', 'default:mese_crystal',''},
	}
})
