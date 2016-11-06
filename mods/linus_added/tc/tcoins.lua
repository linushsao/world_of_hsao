--bitcoins by MilesDyson@DistroGeeks.com
--Modified by Krock
--License: WTFPL

-- Node definitions


minetest.register_craftitem("tc:tcoin", {
	description = "TCoin",
	inventory_image = "tc_tcoin.png",
    stack_max = 30000,
})
minetest.register_craftitem("tc:ibu_coin", {
	description = "EBuCoin",
	inventory_image = "tc_ibu.png",
    stack_max = 30000,
})
minetest.register_craftitem("tc:picachu_coin", {
	description = "PICACHUcoin",
	inventory_image = "tc_picachu.png",
    stack_max = 30000,
})
