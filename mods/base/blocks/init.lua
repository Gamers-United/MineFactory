
WATER_ALPHA = 160
WATER_VISC = 1
LAVA_VISC = 7
LIGHT_MAX = 14

-- Load other files
minetest.register_node("blocks:stone", {
	description = "Stone",
	tiles ={"blocks_stone.png"},
	groups = {cracky=3},
	drop = 'blocks:cobble',
	legacy_mineral = true,
})
minetest.register_node("blocks:dirt_with_grass", {
	description = "Dirt with grass",
	tiles ={"blocks_grass.png", "blocks_dirt.png",
		{name = "blocks_dirt.png^blocks_grass_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
	drop = 'blocks:dirt',
})

minetest.register_node("blocks:machinepart", {
	description = "Machine Part, Multiblock Structure Component",
	tiles = "blocks_machinepart.png",
	groups = {crumbly=0, soil=0},
	drop = 'blocks:machinepart',
})

minetest.register_node("blocks:dirt_with_grass_footsteps", {
	description = "Dirt with grass and footsteps",
	tiles ={"blocks_grass_footsteps.png", "blocks_dirt.png",
		{name = "blocks_dirt.png^blocks_grass_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
	drop = 'blocks:dirt',
})

minetest.register_node("blocks:dirt", {
	description = "Dirt",
	tiles ={"blocks_dirt.png"},
	groups = {crumbly=3, soil=1},
})

minetest.register_node("blocks:sand", {
	description = "Sand",
	tiles ={"blocks_sand.png"},
	groups = {crumbly=3, falling_node=1},
})

minetest.register_node("blocks:gravel", {
	description = "Gravel",
	tiles ={"blocks_gravel.png"},
	groups = {crumbly=2, falling_node=1},
})

minetest.register_node("blocks:sandstone", {
	description = "Sandstone",
	tiles ={"blocks_sandstone.png"},
	groups = {crumbly=2,cracky=2},
	drop = 'blocks:sand',
})

minetest.register_node("blocks:clay", {
	description = "Clay",
	tiles ={"blocks_clay.png"},
	groups = {crumbly=3},
	drop = 'blocks:clay_lump 4',
})
minetest.register_node("blocks:cactus", {
	description = "Cactus",
	tiles ={"blocks_cactus_top.png", "blocks_cactus_top.png", "blocks_cactus_side.png"},
	groups = {snappy=2,choppy=3},
})

minetest.register_node("blocks:water_flowing", {
	description = "Water (flowing)",
	drawtype = "flowingliquid",
	tiles = {"blocks_water.png"},
	special_tiles = {
		{name = "blocks_water.png", backface_culling = false},
		{name = "blocks_water.png", backface_culling = true},
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "blocks:water_flowing",
	liquid_alternative_source = "blocks:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	groups = {water = 3, liquid = 3},
})

minetest.register_node("blocks:water_source", {
	description = "Water",
	drawtype = "liquid",
	tiles = {"blocks_water.png"},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{name = "blocks_water.png", backface_culling = false},
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "blocks:water_flowing",
	liquid_alternative_source = "blocks:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	groups = {water = 3, liquid = 3},
})

minetest.register_node("blocks:river_water_source", {
	description = "River Water Source",
	drawtype = "liquid",
	tiles = {"blocks_river_water.png"},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{name = "blocks_river_water.png", backface_culling = false},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "blocks:river_water_flowing",
	liquid_alternative_source = "blocks:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
})

minetest.register_node("blocks:river_water_flowing", {
	description = "Flowing River Water",
	drawtype = "flowingliquid",
	tiles = {"blocks_river_water.png"},
	special_tiles = {
		{name = "blocks_river_water.png", backface_culling = false},
		{name = "blocks_river_water.png", backface_culling = true},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "blocks:river_water_flowing",
	liquid_alternative_source = "blocks:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
})

minetest.register_node("blocks:cobble", {
	description = "Cobble",
	tiles ={"blocks_cobble.png"},
	is_ground_content = false,
	groups = {cracky=3},
})

minetest.register_abm({
	nodenames = {"blocks:dirt"},
	interval = 2,
	chance = 200,
	action = function(pos, node)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none"
				and (minetest.get_node_light(above) or 0) >= 13 then
			if name == "blocks:snow" or name == "blocks:snowblock" then
				minetest.set_node(pos, {name = "blocks:dirt_with_snow"})
			else
				minetest.set_node(pos, {name = "blocks:dirt_with_grass"})
			end
		end
	end
})

minetest.register_abm({
	nodenames = {"blocks:dirt_with_grass"},
	interval = 2,
	chance = 20,
	action = function(pos, node)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef
				and not ((nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "blocks:dirt"})
		end
	end
})
--