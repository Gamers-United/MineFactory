-- oak tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt",
	sidelen = 16,
    noise_params = {
		offset = 0.01,
		scale = 0.002,
 		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"mapgen:dry"},
	schematic = minetest.get_modpath("deco").."/schematics/apple_tree.mts",
	rotation = random,
	-- Note that place_center_y is set to false. This is because we want the cuboids to appear as if they lie "on" the surface..
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 16,
    noise_params = {
		offset = 0.01,
		scale = 0.0045,
 		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"mapgen:grassland"},
	schematic = minetest.get_modpath("deco").."/schematics/apple_tree.mts",
	rotation = random,
	-- Note that place_center_y is set to false. This is because we want the cuboids to appear as if they lie "on" the surface..
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
})
-- bush
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 16,
    noise_params = {
		offset = 0.01,
		scale = 0.002,
 		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"mapgen:grassland"},
	schematic = minetest.get_modpath("deco").."/schematics/bush.mts",
	rotation = random,
	-- Note that place_center_y is set to false. This is because we want the cuboids to appear as if they lie "on" the surface..
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
})
-- blueberry bush
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 16,
    noise_params = {
		offset = 0.01,
		scale = 0.00005,
 		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"mapgen:grassland"},
	schematic = minetest.get_modpath("deco").."/schematics/blueberry_bush.mts",
	rotation = random,
	-- Note that place_center_y is set to false. This is because we want the cuboids to appear as if they lie "on" the surface..
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
})
-- aspen tree biome
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 16,
    noise_params = {
		offset = 0.01,
		scale = 0.0001,
 		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"mapgen:grassland_aspen"},
	schematic = minetest.get_modpath("deco").."/schematics/apple_tree.mts",
	rotation = random,
	-- Note that place_center_y is set to false. This is because we want the cuboids to appear as if they lie "on" the surface..
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 16,
    noise_params = {
		offset = 0.01,
		scale = 0.001,
 		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"mapgen:grassland_aspen"},
	schematic = minetest.get_modpath("deco").."/schematics/aspen_tree.mts",
	rotation = random,
	-- Note that place_center_y is set to false. This is because we want the cuboids to appear as if they lie "on" the surface..
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 16,
    noise_params = {
		offset = 0.01,
		scale = 0.001,
 		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"mapgen:grassland_aspen"},
	schematic = minetest.get_modpath("deco").."/schematics/aspen_tree_from_sapling.mts",
	rotation = random,
	-- Note that place_center_y is set to false. This is because we want the cuboids to appear as if they lie "on" the surface..
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
})