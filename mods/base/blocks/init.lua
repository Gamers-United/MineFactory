
WATER_ALPHA = 160
WATER_VISC = 1
LAVA_VISC = 7
LIGHT_MAX = 14

--
-- Seed math.random
--
math.randomseed(os.time())

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

minetest.register_abm({
	nodenames = {"blocks:dirt_with_grass"},
	interval = 2,
	chance = 200,
	action = function(pos, node)
		local b_xplus = {x=pos.x+1, y=pos.y, z=pos.z}
		local b_xneg = {x=pos.x-1, y=pos.y, z=pos.z}
		local b_zplus = {x=pos.x, y=pos.y, z=pos.z+1}
		local b_zneg = {x=pos.x, y=pos.y, z=pos.z-1}
		local b_xplus_down = {x=pos.x+1, y=pos.y-1, z=pos.z}
		local b_xneg_down = {x=pos.x-1, y=pos.y-1, z=pos.z}
		local b_zplus_down = {x=pos.x, y=pos.y-1, z=pos.z+1}
		local b_zneg_down = {x=pos.x, y=pos.y-1, z=pos.z-1}
		local b_xplus_up = {x=pos.x+1, y=pos.y+1, z=pos.z}
		local b_xneg_up = {x=pos.x-1, y=pos.y+1, z=pos.z}
		local b_zplus_up = {x=pos.x, y=pos.y+1, z=pos.z+1}
		local b_zneg_up = {x=pos.x, y=pos.y+1, z=pos.z-1}
		--
		-- Extra high
		--
		local b_xplus_up2 = {x=pos.x+1, y=pos.y+2, z=pos.z}
		local b_xneg_up2 = {x=pos.x-1, y=pos.y+2, z=pos.z}
		local b_zplus_up2 = {x=pos.x, y=pos.y+2, z=pos.z+1}
		local b_zneg_up2 = {x=pos.x, y=pos.y+2, z=pos.z-1}		

		local select = math.random(1,12)
		if select == 1 and minetest.get_node(b_xplus).name == "blocks:dirt" and minetest.get_node(b_xplus_up).name == "air" then
			minetest.set_node(b_xplus, {name = "blocks:dirt_with_grass"})
		end
		if select == 2 and minetest.get_node(b_xneg).name == "blocks:dirt" and minetest.get_node(b_xneg_up).name == "air" then
			minetest.set_node(b_xneg, {name = "blocks:dirt_with_grass"})
		end
		if select == 3 and minetest.get_node(b_zplus).name == "blocks:dirt" and minetest.get_node(b_zplus_up).name == "air" then
			minetest.set_node(b_zplus, {name = "blocks:dirt_with_grass"})
		end
		if select == 4 and minetest.get_node(b_zneg).name == "blocks:dirt" and minetest.get_node(b_zneg_up).name == "air" then
			minetest.set_node(b_zneg, {name = "blocks:dirt_with_grass"})
		end
		if select == 5 and minetest.get_node(b_xplus_down).name == "blocks:dirt" and minetest.get_node(b_xplus).name == "air" then
			minetest.set_node(b_xplus_down, {name = "blocks:dirt_with_grass"})
		end
		if select == 6 and minetest.get_node(b_xneg_down).name == "blocks:dirt" and minetest.get_node(b_xneg).name == "air" then
			minetest.set_node(b_xneg_down, {name = "blocks:dirt_with_grass"})
		end
		if select == 7 and minetest.get_node(b_zplus_down).name == "blocks:dirt" and minetest.get_node(b_zplus).name == "air" then
			minetest.set_node(b_zplus_down, {name = "blocks:dirt_with_grass"})
		end
		if select == 8 and minetest.get_node(b_zneg_down).name == "blocks:dirt" and minetest.get_node(b_zneg).name == "air" then
			minetest.set_node(b_zneg_down, {name = "blocks:dirt_with_grass"})
		end
		if select == 9 and minetest.get_node(b_xplus_up).name == "blocks:dirt" and minetest.get_node(b_xplus_up2).name == "air" then
			minetest.set_node(b_xplus_up, {name = "blocks:dirt_with_grass"})
		end
		if select == 10 and minetest.get_node(b_xneg_up).name == "blocks:dirt" and minetest.get_node(b_xneg_up2).name == "air" then
			minetest.set_node(b_xneg_up, {name = "blocks:dirt_with_grass"})
		end
		if select == 11 and minetest.get_node(b_zplus_up).name == "blocks:dirt" and minetest.get_node(b_zplus_up2).name == "air" then
			minetest.set_node(b_zplus_up, {name = "blocks:dirt_with_grass"})
		end
		if select == 12 and minetest.get_node(b_zneg_up).name == "blocks:dirt" and minetest.get_node(b_zneg_up2).name == "air" then
			minetest.set_node(b_zneg_up, {name = "blocks:dirt_with_grass"})
		end
	end
})
