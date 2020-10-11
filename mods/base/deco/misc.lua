--
-- cactus
--

minetest.register_node("deco:cactus", {
	description = "Cactus",
	tiles ={"blocks_cactus_top.png", "blocks_cactus_top.png", "blocks_cactus_side.png"},
    groups = {snappy=2,choppy=3},
    damage_per_second = 1,
    on_construct = function(pos)
        local xp = {x=pos.x+1, y=pos.y, z=pos.z}
        local xn = {x=pos.x-1, y=pos.y, z=pos.z}
        local zp = {x=pos.x, y=pos.y, z=pos.z+1}
        local zn = {x=pos.x, y=pos.y, z=pos.z-1}
        local below = {x=pos.x, y=pos.y-1, z=pos.z}
        -- check if the blocks above/below/left/right are air to allow placement
        if minetest.get_node(xp).name ~= "air" then
            minetest.remove_node(pos)
        end
        if minetest.get_node(xn).name ~= "air" then
            minetest.remove_node(pos)
        end
        if minetest.get_node(zp).name ~= "air" then
            minetest.remove_node(pos)
        end
        if minetest.get_node(zn).name ~= "air" then
            minetest.remove_node(pos)
        end
        -- check for sand/red-sand below
        if minetest.get_node(below).name ~= "blocks:red_sand" and minetest.get_node(below).name ~= "blocks:sand" and minetest.get_node(below).name ~= "deco:cactus" then
            minetest.remove_node(pos)
        end
    end,
    on_place = function(itemstack, placer, pointed_thing)
        local pos = pointed_thing.above
        local xp = {x=pos.x+1, y=pos.y, z=pos.z}
        local xn = {x=pos.x-1, y=pos.y, z=pos.z}
        local zp = {x=pos.x, y=pos.y, z=pos.z+1}
        local zn = {x=pos.x, y=pos.y, z=pos.z-1}
        local below = {x=pos.x, y=pos.y-1, z=pos.z}
        -- check if the blocks above/below/left/right are air to allow placement
        if minetest.get_node(xp).name == "air" and minetest.get_node(xn).name == "air" and minetest.get_node(zp).name == "air" and minetest.get_node(zn).name == "air" then
            if minetest.get_node(below).name == "blocks:sand" or minetest.get_node(below).name == "blocks:red_sand" then
                minetest.set_node(pos, {name=itemstack:get_name()})
                itemstack:take_item()
            end
        end
        return itemstack
    end,
    after_destruct = function(pos, oldnode)
        local above = {x=pos.x, y=pos.y+1, z=pos.z}
        local drop_x = math.random(-0.5, 0.5)
        local drop_z = math.random(-0.5, 0.5)
        local drop_location = {x=pos.x+drop_x, y=pos.y+0.6, z=pos.z+drop_z}
        if minetest.get_node(above).name == "deco:cactus" then
            minetest.remove_node(above)
            minetest.add_item(drop_location, {name="deco:cactus"})
        end
    end,
    after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

minetest.register_abm({
    nodenames = {"deco:cactus"},
	interval = 10,
	chance = 80,
    action = function(pos, node)
        -- checks for above
        local above = {x=pos.x, y=pos.y+1, z=pos.z}
        local above_xplus = {x=pos.x+1, y=pos.y+1, z=pos.z}
        local above_xneg = {x=pos.x-1, y=pos.y+1, z=pos.z}
        local above_zplus = {x=pos.x, y=pos.y+1, z=pos.z+1}
        local above_zneg = {x=pos.x, y=pos.y+1, z=pos.z-1}
        -- checks for below
        local below_2 = {x=pos.x, y=pos.y-2, z=pos.z}
        local below = {x=pos.x, y=pos.y-1, z=pos.z}
        local below_3 = {x=pos.x, y=pos.y-3, z=pos.z}
        -- nodes, math
        local drop_x = math.random(-0.5, 0.5)
        local drop_z = math.random(-0.5, 0.5)
        local drop_location = {x=pos.x+drop_x, y=pos.y+0.6, z=pos.z+drop_z}
        -- ensure that only top part of cactus is processing
        if minetest.get_node(above).name ~= "air" then
            return
        end
        -- check if cactus is too tall
        if minetest.get_node(below_2).name == "deco:cactus" then
            local nothing = "do"
        -- check if cactus needs to be dropped rather than placed due to obstructions
        elseif minetest.get_node(above_xplus).name ~= "air" then
            minetest.add_item(drop_location, {name="deco:cactus"})
        elseif minetest.get_node(above_xneg).name ~= "air" then
            minetest.add_item(drop_location, {name="deco:cactus"})
        elseif minetest.get_node(above_zplus).name ~= "air" then
            minetest.add_item(drop_location, {name="deco:cactus"})
        elseif minetest.get_node(above_zneg).name ~= "air" then
            minetest.add_item(drop_location, {name="deco:cactus"})
        -- otherwise grow the cactus
        else
            minetest.set_node(above, {name="deco:cactus"})
        end
    end
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = "blocks:sand",
    sidelen = 16,
    fill_ratio = 0.004,
    biomes = {"mapgen:desert", "mapgen:red_desert"},
    decoration = "deco:cactus",
    height = 1,
    height_max = 3,
})
-- reeds
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:sand",
	sidelen = 16,
    noise_params = {
		offset = 0.01,
		scale = 0.001,
 		spread = {x = 100, y = 100, z = 100},
		seed = 2,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"mapgen:beach"},
	schematic = minetest.get_modpath("deco").."/schematics/papyrus.mts",
	rotation = random,
	spawn_by = "blocks:water_source",
	-- Note that place_center_y is set to false. This is because we want the cuboids to appear as if they lie "on" the surface..
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt",
	sidelen = 16,
    noise_params = {
		offset = 0.01,
		scale = 0.0005,
 		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"mapgen:dry"},
	schematic = minetest.get_modpath("deco").."/schematics/papyrus.mts",
    rotation = random,
    spawn_by = "blocks:water_source",
	-- Note that place_center_y is set to false. This is because we want the cuboids to appear as if they lie "on" the surface..
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
})
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "blocks:dirt_with_grass",
	sidelen = 16,
    noise_params = {
		offset = 0.01,
		scale = 0.00001,
 		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"mapgen:grasslands"},
	schematic = minetest.get_modpath("deco").."/schematics/papyrus.mts",
    rotation = random,
    spawn_by = "blocks:water_source",
	-- Note that place_center_y is set to false. This is because we want the cuboids to appear as if they lie "on" the surface..
	flags = {place_center_x = true, place_center_y = false, place_center_z = true},
})