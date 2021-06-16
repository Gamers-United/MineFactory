--
-- Seed math.random
--
math.randomseed(os.time())

--functions
blocks = {}

function blocks.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "", gain = 1.0}
	table.dug = table.dug or
			{name = "default_dug_node", gain = 0.25}
	table.place = table.place or
			{name = "default_place_node_hard", gain = 1.0}
	return table
end

function blocks.node_sound_stone_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_hard_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "default_hard_footstep", gain = 1.0}
		blocks.node_sound_defaults(table)
	return table
end

function blocks.node_sound_dirt_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_dirt_footstep", gain = 0.4}
	table.dug = table.dug or
			{name = "default_dirt_footstep", gain = 1.0}
	table.place = table.place or
			{name = "default_place_node", gain = 1.0}
		blocks.node_sound_defaults(table)
	return table
end

function blocks.node_sound_sand_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_sand_footstep", gain = 0.12}
	table.dug = table.dug or
			{name = "default_sand_footstep", gain = 0.24}
	table.place = table.place or
			{name = "default_place_node", gain = 1.0}
		blocks.node_sound_defaults(table)
	return table
end

function blocks.node_sound_gravel_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_gravel_footstep", gain = 0.4}
	table.dug = table.dug or
			{name = "default_gravel_footstep", gain = 1.0}
	table.place = table.place or
			{name = "default_place_node", gain = 1.0}
		blocks.node_sound_defaults(table)
	return table
end

function blocks.node_sound_wood_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_wood_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "default_wood_footstep", gain = 1.0}
		blocks.node_sound_defaults(table)
	return table
end

function blocks.node_sound_leaves_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_grass_footstep", gain = 0.45}
	table.dug = table.dug or
			{name = "default_grass_footstep", gain = 0.7}
	table.place = table.place or
			{name = "default_place_node", gain = 1.0}
		blocks.node_sound_defaults(table)
	return table
end

function blocks.node_sound_glass_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_glass_footstep", gain = 0.3}
	table.dig = table.dig or
			{name = "default_glass_footstep", gain = 0.5}
	table.dug = table.dug or
			{name = "default_break_glass", gain = 1.0}
		blocks.node_sound_defaults(table)
	return table
end

function blocks.node_sound_metal_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_metal_footstep", gain = 0.4}
	table.dig = table.dig or
			{name = "default_dig_metal", gain = 0.5}
	table.dug = table.dug or
			{name = "default_dug_metal", gain = 0.5}
	table.place = table.place or
			{name = "default_place_node_metal", gain = 0.5}
		blocks.node_sound_defaults(table)
	return table
end

function blocks.node_sound_water_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_water_footstep", gain = 0.2}
		blocks.node_sound_defaults(table)
	return table
end

function blocks.node_sound_snow_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_snow_footstep", gain = 0.2}
	table.dig = table.dig or
			{name = "default_snow_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "default_snow_footstep", gain = 0.3}
	table.place = table.place or
			{name = "default_place_node", gain = 1.0}
		blocks.node_sound_defaults(table)
	return table
end

-- Load other files
minetest.register_node("blocks:stone", {
	description = "Stone",
	tiles ={"blocks_stone.png"},
	groups = {cracky=3},
	drop = 'blocks:cobble',
	sounds = blocks.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("blocks:dirt_with_grass", {
	description = "Grass Block",
	tiles ={"blocks_grass.png", "blocks_dirt.png",
		{name = "blocks_dirt.png^blocks_grass_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
	drop = 'blocks:dirt',
})

minetest.register_node("blocks:machinepart", {
	description = "Machine Block",
	tiles = "blocks_machinepart.png",
	groups = {crumbly=0, soil=0},
	drop = 'blocks:machinepart',
})

minetest.register_node("blocks:dirt_with_grass_footsteps", {
	description = "Grass block Footsteps",
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

minetest.register_node("blocks:red_sand", {
	description = "Red Sand",
	tiles ={"blocks_red_sand.png"},
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


--liquid water
minetest.register_node("blocks:water_flowing", {
	description = "Water (flowing)",
	drawtype = "flowingliquid",
	tiles = {"blocks_water.png"},
	special_tiles = {
		{name = "blocks_water.png", backface_culling = false},
		{name = "blocks_water.png", backface_culling = true},
	},
	alpha = 191,
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
	liquid_viscosity = 1,
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
	alpha = 191,
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
	liquid_viscosity = 1,
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
	liquid_range = 10,
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
	liquid_range = 10,
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

minetest.register_node("blocks:snow", {
	description = "Snow",
	tiles = {"blocks_snow.png"},
	inventory_image = "blocks_snowball.png",
	wield_image = "blocks_snowball.png",
	paramtype = "light",
	buildable_to = true,
	floodable = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -6 / 16, 0.5},
		},
	},
	groups = {crumbly = 3, falling_node = 1, snowy = 1},
	sounds = blocks.node_sound_snow_defaults(),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "blocks:dirt_with_grass" then
			minetest.set_node(pos, {name = "blocks:dirt_with_snow"})
		end
	end,
})

minetest.register_node("blocks:snowblock", {
	description = "Snow Block",
	tiles = {"blocks_snow.png"},
	groups = {crumbly = 3, cools_lava = 1, snowy = 1},
	sounds = blocks.node_sound_snow_defaults(),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "blocks:dirt_with_grass" then
			minetest.set_node(pos, {name = "blocks:dirt_with_snow"})
		end
	end,
})

-- import abms
dofile(minetest.get_modpath("blocks") .. "/abm.lua")
