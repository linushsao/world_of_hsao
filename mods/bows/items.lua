bows.register_bow("bow_wood",{
	description="Wooden bow",
	texture="bows_bow.png",
	texture_loaded="bows_bow_loaded.png",
	uses=50,
	level=1,
	craft={
		{"","group:stick","farming:cotton"},
		{"group:stick","","farming:cotton"},
		{"","group:stick","farming:cotton"}
	},
})

bows.register_bow("bow_stone",{
	description="Stone bow",
	texture="bows_bow_stone.png",
	texture_loaded="bows_bow_loaded_stone.png",
	uses=70,
	level=4,
	craft={
		{"","group:stone","farming:cotton"},
		{"group:stone","","farming:cotton"},
		{"","group:stone","farming:cotton"}
	},
})

bows.register_bow("bow_steel",{
	description="Steel bow",
	texture="bows_bow_steel.png",
	texture_loaded="bows_bow_loaded_steel.png",
	uses=140,
	level=8,
	craft={
		{"","default:steel_ingot","farming:cotton"},
		{"default:steel_ingot","","farming:cotton"},
		{"","default:steel_ingot","farming:cotton"}
	},
})

bows.register_bow("bow_bronze",{
	description="Bronze bow",
	texture="bows_bow_bronze.png",
	texture_loaded="bows_bow_loaded_bronze.png",
	uses=280,
	level=10,
	craft={
		{"","default:bronze_ingot","farming:cotton"},
		{"default:bronze_ingot","","farming:cotton"},
		{"","default:bronze_ingot","farming:cotton"}
	},
})

bows.register_bow("bow_mese",{
	description="Mese bow",
	texture="bows_bow_mese.png",
	texture_loaded="bows_bow_loaded_mese.png",
	uses=500,
	level=13,
	craft={
		{"","default:mese_crystal","farming:cotton"},
		{"default:mese_crystal","","farming:cotton"},
		{"","default:mese_crystal","farming:cotton"}
	},
})

bows.register_bow("bow_diamond",{
	description="Diamond bow",
	texture="bows_bow_diamond.png",
	texture_loaded="bows_bow_loaded_diamond.png",
	uses=800,
	level=19,
	craft={
		{"","default:diamond","farming:cotton"},
		{"default:diamond","","farming:cotton"},
		{"","default:diamond","farming:cotton"}
	},
})

bows.register_arrow("arrow",{
	description="Arrow",
	texture="bows_arrow_wood.png",
	damage=5,
	craft_count=8,
	craft={
				{"group:stick","group:stick","farming:cotton"},
				{"","",""},
				{"","",""},
			}
})

bows.register_arrow("arrow_steel",{
	description="Steel arrow",
	texture="bows_arrow_wood.png^[colorize:#FFFFFFcc",
	damage=7,
	craft_count=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:steel_ingot","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"},
	}
})

bows.register_arrow("arrow_gold",{
	description="Gold arrow",
	texture="bows_arrow_wood.png^[colorize:#d7c633cc",
	damage=7,
	craft_count=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:gold_ingot","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"},
	}
})

bows.register_arrow("arrow_mese",{
	description="Mese arrow",
	texture="bows_arrow_wood.png^[colorize:#e3ff00cc",
	damage=12,
	craft_count=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:mese_crystal","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"},
	}
})

bows.register_arrow("arrow_diamond",{
	description="Diamond arrow",
	texture="bows_arrow_wood.png^[colorize:#15d7c2cc",
	damage=15,
	craft_count=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:diamond","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"},
	}
})


bows.register_arrow("arrow_fire",{
	description="Fire arrow",
	texture="bows_arrow_wood.png^[colorize:#ffb400cc",
	damage=10,
	craft_count=8,
	on_hit_node=bows.arrow_fire,
	on_hit_object=bows.arrow_fire_object,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:torch","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"},
	}
})

bows.register_arrow("arrow_build",{
	description="Build arrow",
	texture="bows_arrow_wood.png^[colorize:#33336677",
	on_hit_node=bows.arrow_build,
	craft_count=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:obsidian_shard","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"}
	}
})

bows.register_arrow("arrow_dig",{
	description="Dig arrow",
	texture="bows_arrow_wood.png^[colorize:#333333aa",
	on_hit_node=bows.arrow_dig,
	craft_count=16,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:pick_steel","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"}
	}
})
