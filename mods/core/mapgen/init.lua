--
-- Aliases for map generator outputs
--


minetest.register_alias("mapgen_stone", "blocks:stone")
minetest.register_alias("mapgen_dirt", "blocks:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "blocks:dirt_with_grass")
minetest.register_alias("mapgen_sand", "blocks:sand")
minetest.register_alias("mapgen_water_source", "blocks:water_source")
minetest.register_alias("mapgen_river_water_source", "blocks:river_water_source")
minetest.register_alias("mapgen_lava_source", "blocks:lava_source")
minetest.register_alias("mapgen_gravel", "blocks:gravel")

minetest.register_alias("mapgen_cobble", "blocks:cobble")


--
-- Ore generation
--


-- Blob ore first to avoid other ores inside blobs

minetest.register_ore({ 
	ore_type         = "blob",
	ore              = "blocks:clay",
	wherein          = {"blocks:sand"},
	clust_scarcity   = 24*24*24,
	clust_size       = 7,
	y_min            = -15,
	y_max            = 0,
	noise_threshold = 0,
	noise_params     = {
		offset=0.35,
		scale=0.2,
		spread={x=5, y=5, z=5},
		seed=-316,
		octaves=1,
		persist=0.5
	},
})

--
-- Register biomes for biome API
--

minetest.register_biome({
	name = "blocks:grassland",
	--node_dust = "",
	node_top = "blocks:dirt_with_grass",
	depth_top = 1,
	node_filler = "blocks:dirt",
	depth_filler = 1,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	y_min = 5,
	y_max = 31000,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "blocks:grassland_ocean",
	--node_dust = "",
	node_top = "blocks:sand",
	depth_top = 1,
	node_filler = "blocks:sand",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	y_min = -31000,
	y_max = 4,
	heat_point = 50,
	humidity_point = 50,
})

