-- A stripped dye mod to make dyes with seacoral


local dyelocal = {}


-- CRAFTITEMS


dyelocal.dyes = {
	{"cyan",       "Cyan dye",      {dye=1, basecolor_cyan=1,    excolor_cyan=1,      unicolor_cyan=1}},
	{"magenta",    "Magenta dye",   {dye=1, basecolor_magenta=1, excolor_red_violet=1,unicolor_red_violet=1}},
}

for _, row in ipairs(dyelocal.dyes) do
	local name = row[1]
	local description = row[2]
	local groups = row[3]
	local item_name = "seadye:"..name
	local item_image = "dye_"..name..".png"				-- causes a dependency on the dye mod
	minetest.register_craftitem(item_name, {
		inventory_image = item_image,
		description = description,
		groups = groups
	})
	minetest.register_craft({
		type = "shapeless",
		output = item_name.." 4",
		recipe = {"group:seacoral,basecolor_"..name},		-- same as flower and color work for the dye mod
	})
end


dyelocal.dyes = {
	{"lime",       "Lime Dye",      { dye=1, excolor_lime=1, unicolor_lime=1 }},
	{"aqua",       "Aqua Dye",      { dye=1, excolor_aqua=1, unicolor_aqua=1 }},
	{"skyblue",       "Sky-blue Dye",      { dye=1, excolor_sky_blue=1, unicolor_sky_blue=1 }},
	{"redviolet",       "Red-violet Dye",      { dye=1, excolor_red_violet=1, unicolor_red_violet=1 }},
}

for _, row in ipairs(dyelocal.dyes) do
	local name = row[1]
	local description = row[2]
	local groups = row[3]
	local item_name = "seadye:"..name
	local item_image = "unifieddyes_"..name..".png" 		-- causes a dependency on the unifieddyes mod
	minetest.register_craftitem(item_name, {
		inventory_image = item_image,
		description = description,
		groups = groups
	})
	minetest.register_craft({
		type = "shapeless",
		output = item_name.." 4",
		recipe = {"group:seacoral,excolor_"..name},		-- same as flower and color work for the dye mod
	})
end