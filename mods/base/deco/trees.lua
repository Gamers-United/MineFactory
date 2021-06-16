-- oak tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.01,
	biomes = {"mapgen:grassland"},
	schematic = minetest.get_modpath("deco").."/schematics/apple_tree.mts",
	replacements = {{"default:leaves","deco:leaves_oak"},{"default:apple","deco:apple"},{"default:tree","deco:log_oak"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.0007,
	biomes = {"mapgen:grassland_dry"},
	schematic = minetest.get_modpath("deco").."/schematics/apple_tree.mts",
	replacements = {{"default:leaves","deco:leaves_oak"},{"default:apple","deco:apple"},{"default:tree","deco:log_oak"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
-- birch tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.0008,
	biomes = {"mapgen:grassland"},
	schematic = minetest.get_modpath("deco").."/schematics/birch_tree.mts",
	replacements = {{"default:aspen_leaves","deco:leaves_birch"},{"default:aspen_tree","deco:log_birch"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.01,
	biomes = {"mapgen:grassland_birch"},
	schematic = minetest.get_modpath("deco").."/schematics/birch_tree.mts",
	replacements = {{"default:aspen_leaves","deco:leaves_birch"},{"default:aspen_tree","deco:log_birch"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
-- jungle tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.08,
	biomes = {"mapgen:jungle"},
	schematic = minetest.get_modpath("deco").."/schematics/jungle_tree.mts",
	replacements = {{"default:jungleleaves","deco:leaves_jungle"},{"default:jungletree","deco:log_jungle"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.0009,
	biomes = {"mapgen:jungle"},
	schematic = minetest.get_modpath("deco").."/schematics/emergent_jungle_tree.mts",
	replacements = {{"default:jungleleaves","deco:leaves_jungle"},{"default:jungletree","deco:log_jungle"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
--jungle floor
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"mapgen:jungle"},
	decoration = "deco:log_jungle",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.3,
	biomes = {"mapgen:jungle"},
	decoration = "deco:leaves_jungle",
	height_max = 2,
	spawn_by = "deco:log_jungle"
})
-- pine tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.02,
	biomes = {"mapgen:pine_forest"},
	schematic = minetest.get_modpath("deco").."/schematics/pine_tree.mts",
	replacements = {{"default:pine_needles","deco:leaves_pine"},{"default:pine_tree","deco:log_pine"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.0008,
	biomes = {"mapgen:pine_forest"},
	schematic = minetest.get_modpath("deco").."/schematics/pine_bush.mts",
	replacements = {{"default:pine_bush_needles","deco:leaves_pine"},{"default:pine_bush_stem","deco:log_pine"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.0008,
	biomes = {"mapgen:pine_forest"},
	schematic = minetest.get_modpath("deco").."/schematics/pine_log.mts",
	replacements = {{"default:pine_needles","deco:leaves_pine"},{"default:pine_tree","deco:log_pine"},{"flowers:mushroom_red","deco:mushroom_red"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.02,
	biomes = {"mapgen:pine_forest_snowy"},
	schematic = minetest.get_modpath("deco").."/schematics/pine_tree.mts",
	replacements = {{"default:pine_needles","deco:leaves_pine"},{"default:pine_tree","deco:log_pine"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.0008,
	biomes = {"mapgen:pine_forest_snowy"},
	schematic = minetest.get_modpath("deco").."/schematics/pine_bush.mts",
	replacements = {{"default:pine_bush_needles","deco:leaves_pine"},{"default:pine_bush_stem","deco:log_pine"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.0008,
	biomes = {"mapgen:pine_forest_snowy"},
	schematic = minetest.get_modpath("deco").."/schematics/pine_log.mts",
	replacements = {{"default:pine_needles","deco:leaves_pine"},{"default:pine_tree","deco:log_pine"},{"flowers:mushroom_red","deco:mushroom_red"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
-- acacia tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.005,
	biomes = {"mapgen:savanna"},
	schematic = minetest.get_modpath("deco").."/schematics/acacia_tree.mts",
	replacements = {{"default:acacia_leaves","deco:leaves_acacia"},{"default:acacia_tree","deco:log_acacia"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.003,
	biomes = {"mapgen:savanna"},
	schematic = minetest.get_modpath("deco").."/schematics/acacia_tree.mts",
	replacements = {{"default:acacia_leaves","deco:leaves_acacia"},{"default:acacia_tree","deco:log_acacia"}},
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
	rotation = "random",
})
-- grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"mapgen:grassland", "mapgen:grassland_birch", "mapgen:pine_forest", "mapgen:jungle", "mapgen:grassland_bare"},
	decoration = "deco:grass_1",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"mapgen:grassland", "mapgen:grassland_birch", "mapgen:pine_forest", "mapgen:jungle", "mapgen:grassland_bare"},
	decoration = "deco:grass_2",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"mapgen:grassland", "mapgen:grassland_birch", "mapgen:pine_forest", "mapgen:jungle", "mapgen:grassland_bare"},
	decoration = "deco:grass_3",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"mapgen:grassland", "mapgen:grassland_birch", "mapgen:pine_forest", "mapgen:jungle", "mapgen:grassland_bare"},
	decoration = "deco:grass_4",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"mapgen:grassland", "mapgen:grassland_birch", "mapgen:pine_forest", "mapgen:jungle", "mapgen:grassland_bare"},
	decoration = "deco:grass_5",
	height_max = 1,
})
-- dry grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt",
	sidelen = 8,
	fill_ratio = 0.05,
	biomes = {"mapgen:grassland_dry"},
	decoration = "deco:dry_grass_1",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt",
	sidelen = 8,
	fill_ratio = 0.05,
	biomes = {"mapgen:grassland_dry"},
	decoration = "deco:dry_grass_2",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt",
	sidelen = 8,
	fill_ratio = 0.05,
	biomes = {"mapgen:grassland_dry"},
	decoration = "deco:dry_grass_3",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt",
	sidelen = 8,
	fill_ratio = 0.05,
	biomes = {"mapgen:grassland_dry"},
	decoration = "deco:dry_grass_4",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt",
	sidelen = 8,
	fill_ratio = 0.05,
	biomes = {"mapgen:grassland_dry"},
	decoration = "deco:dry_grass_5",
	height_max = 1,
})
-- ferns
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"mapgen:jungle"},
	decoration = "deco:fern_1",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"mapgen:jungle"},
	decoration = "deco:fern_2",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.1,
	biomes = {"mapgen:jungle"},
	decoration = "deco:fern_3",
	height_max = 1,
})
-- beach grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.03,
	biomes = {"mapgen:beach"},
	decoration = "deco:marram_grass_1",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.03,
	biomes = {"mapgen:beach"},
	decoration = "deco:marram_grass_2",
	height_max = 1,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = "blocks:dirt_with_grass",
	sidelen = 8,
	fill_ratio = 0.03,
	biomes = {"mapgen:beach"},
	decoration = "deco:marram_grass_3",
	height_max = 1,
})