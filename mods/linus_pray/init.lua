

-- 內湖劉小妹妹，願往生善處
minetest.register_node("linus_pray:pray_neihu_liu_girl", {
	description = "pray_neihu_liu_girl",
	drawtype = "signlike",
	tiles = {"neihu_liu_girl_s.png"},
	visual_scale = 3.0,
	inventory_image = "neihu_liu_girl_s.png",
	wield_image = "neihu_liu_girl_s.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = groups,

})

minetest.register_craft({
	output = 'linus_pray:pray_neihu_liu_girl',
	recipe = {
		{'', 'glowtest:red_crystal_1',''},
		{'flowers:rose', '','flowers:rose'},
		{'', '',''},
	}
})

