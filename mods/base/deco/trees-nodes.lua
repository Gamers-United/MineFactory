function deco.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "", gain = 1.0}
	table.dug = table.dug or
			{name = "default_dug_node", gain = 0.25}
	table.place = table.place or
			{name = "default_place_node_hard", gain = 1.0}
	return table
end

function deco.node_sound_wood_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "deco_wood_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "deco_wood_footstep", gain = 1.0}
	deco.node_sound_defaults(table)
	return table
end

function deco.node_sound_leaves_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "deco_grass_footstep", gain = 0.45}
	table.dug = table.dug or
			{name = "deco_grass_footstep", gain = 0.7}
	table.place = table.place or
			{name = "deco_place_node", gain = 1.0}
			deco.node_sound_defaults(table)
	return table
end

--
-- Dig upwards
--

function deco.dig_up(pos, node, digger)
	if digger == nil then return end
	local np = {x = pos.x, y = pos.y + 1, z = pos.z}
	local nn = minetest.get_node(np)
	if nn.name == node.name then
		minetest.node_dig(np, nn, digger)
	end
end

function deco.sapling_on_place(itemstack, placer, pointed_thing,
	sapling_name, minp_relative, maxp_relative, interval)
-- Position of sapling
local pos = pointed_thing.under
local node = minetest.get_node_or_nil(pos)
local pdef = node and minetest.registered_nodes[node.name]

if pdef and pdef.on_rightclick and
		not (placer and placer:is_player() and
		placer:get_player_control().sneak) then
	return pdef.on_rightclick(pos, node, placer, itemstack, pointed_thing)
end

if not pdef or not pdef.buildable_to then
	pos = pointed_thing.above
	node = minetest.get_node_or_nil(pos)
	pdef = node and minetest.registered_nodes[node.name]
	if not pdef or not pdef.buildable_to then
		return itemstack
	end
end

local player_name = placer and placer:get_player_name() or ""
-- Check sapling position for protection
if minetest.is_protected(pos, player_name) then
	minetest.record_protection_violation(pos, player_name)
	return itemstack
end
-- Check tree volume for protection
if minetest.is_area_protected(
		vector.add(pos, minp_relative),
		vector.add(pos, maxp_relative),
		player_name,
		interval) then
	minetest.record_protection_violation(pos, player_name)
	-- Print extra information to explain
--		minetest.chat_send_player(player_name,
--			itemstack:get_definition().description .. " will intersect protection " ..
--			"on growth")
	minetest.chat_send_player(player_name,
		S("@1 will intersect protection on growth.",
		itemstack:get_definition().description))
	return itemstack
end

minetest.log("action", player_name .. " places node "
		.. sapling_name .. " at " .. minetest.pos_to_string(pos))

local take_item = not (creative and creative.is_enabled_for
	and creative.is_enabled_for(player_name))
local newnode = {name = sapling_name}
local ndef = minetest.registered_nodes[sapling_name]
minetest.set_node(pos, newnode)

-- Run callback
if ndef and ndef.after_place_node then
	-- Deepcopy place_to and pointed_thing because callback can modify it
	if ndef.after_place_node(table.copy(pos), placer,
			itemstack, table.copy(pointed_thing)) then
		take_item = false
	end
end

-- Run script hook
for _, callback in ipairs(minetest.registered_on_placenodes) do
	-- Deepcopy pos, node and pointed_thing because callback can modify them
	if callback(table.copy(pos), table.copy(newnode),
			placer, table.copy(node or {}),
			itemstack, table.copy(pointed_thing)) then
		take_item = false
	end
end

if take_item then
	itemstack:take_item()
end

return itemstack
end

--oak
minetest.register_node("deco:log_oak", {
	description = ("Oak Log"),
	tiles = {"deco_tree_top.png", "deco_tree_top.png", "deco_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = deco.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("deco:wood_oak", {
	description = ("Oak Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"deco_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = deco.node_sound_wood_defaults(),
})

minetest.register_node("deco:sapling_oak", {
	description = ("Oak Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"deco_sapling.png"},
	inventory_image = "deco_sapling.png",
	wield_image = "deco_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = deco.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = deco.sapling_on_place(itemstack, placer, pointed_thing,
			"deco:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 6, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("deco:leaves_oak", {
	description = ("Apple Tree Leaves"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"deco_leaves.png"},
	special_tiles = {"deco_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 3,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"deco:sapling_oak"},
				rarity = 5,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"item:sticks"},
				rarity = 2,
			}
		}
	},
	sounds = deco.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("deco:apple", {
	description = ("Apple"),
	drawtype = "plantlike",
	tiles = {"deco_apple.png"},
	inventory_image = "deco_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
	on_use = minetest.item_eat(2),
	sounds = deco.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		minetest.set_node(pos, {name = "deco:apple", param2 = 1})
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if oldnode.param2 == 0 then
			minetest.set_node(pos, {name = "deco:apple_mark"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end
	end,
})

minetest.register_node("deco:apple_mark", {
	description = ("Apple Marker"),
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {not_in_creative_inventory = 1},
	on_timer = function(pos, elapsed)
		if not minetest.find_node_near(pos, 1, "deco:leaves") then
			minetest.remove_node(pos)
		elseif minetest.get_node_light(pos) < 11 then
			minetest.get_node_timer(pos):start(200)
		else
			minetest.set_node(pos, {name = "deco:apple"})
		end
	end
})

--jungle
minetest.register_node("deco:log_jungle", {
	description = ("Jungle Tree"),
	tiles = {"deco_jungletree_top.png", "deco_jungletree_top.png",
		"deco_jungletree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = deco.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("deco:wood_jungle", {
	description = ("Jungle Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"deco_junglewood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = deco.node_sound_wood_defaults(),
})

minetest.register_node("deco:leaves_jungle", {
	description = ("Jungle Tree Leaves"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"deco_jungleleaves.png"},
	special_tiles = {"deco_jungleleaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"deco:junglesapling"}, rarity = 20},
			{items = {"deco:jungleleaves"}}
		}
	},
	sounds = deco.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("deco:sapling_jungle", {
	description = ("Jungle Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"deco_junglesapling.png"},
	inventory_image = "deco_junglesapling.png",
	wield_image = "deco_junglesapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = deco.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = deco.sapling_on_place(itemstack, placer, pointed_thing,
			"deco:junglesapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 15, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("deco:sapling_jungle_emergent", {
	description = ("Emergent Jungle Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"deco_emergent_jungle_sapling.png"},
	inventory_image = "deco_emergent_jungle_sapling.png",
	wield_image = "deco_emergent_jungle_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = deco.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = deco.sapling_on_place(itemstack, placer, pointed_thing,
			"deco:emergent_jungle_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -3, y = -5, z = -3},
			{x = 3, y = 31, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

--pine
minetest.register_node("deco:log_pine", {
	description = ("Pine Log"),
	tiles = {"deco_pine_tree_top.png", "deco_pine_tree_top.png",
		"deco_pine_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = deco.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("deco:wood_pine", {
	description = ("Pine Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"deco_pine_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = deco.node_sound_wood_defaults(),
})

minetest.register_node("deco:leaves_pine",{
	description = ("Pine Needles"),
	drawtype = "allfaces_optional",
	tiles = {"deco_pine_needles.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"deco:pine_sapling"}, rarity = 20},
			{items = {"deco:pine_needles"}}
		}
	},
	sounds = deco.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("deco:sapling_pine", {
	description = ("Pine Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"deco_pine_sapling.png"},
	inventory_image = "deco_pine_sapling.png",
	wield_image = "deco_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = deco.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = deco.sapling_on_place(itemstack, placer, pointed_thing,
			"deco:pine_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 14, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

--acacia
minetest.register_node("deco:log_acacia", {
	description = ("Acacia Tree"),
	tiles = {"deco_acacia_tree_top.png", "deco_acacia_tree_top.png",
		"deco_acacia_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = deco.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("deco:wood_acacia", {
	description = ("Acacia Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"deco_acacia_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = deco.node_sound_wood_defaults(),
})

minetest.register_node("deco:leaves_acacia", {
	description = ("Acacia Tree Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"deco_acacia_leaves.png"},
	special_tiles = {"deco_acacia_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"deco:acacia_sapling"}, rarity = 20},
			{items = {"deco:acacia_leaves"}}
		}
	},
	sounds = deco.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("deco:sapling_acacia", {
	description = ("Acacia Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"deco_acacia_sapling.png"},
	inventory_image = "deco_acacia_sapling.png",
	wield_image = "deco_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = deco.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = deco.sapling_on_place(itemstack, placer, pointed_thing,
			"deco:acacia_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 7, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})
--birch
minetest.register_node("deco:log_birch", {
	description = ("Birch Log"),
	tiles = {"deco_birch_tree_top.png", "deco_birch_tree_top.png",
		"deco_birch_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = deco.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("deco:wood_birch", {
	description = ("Birch Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"deco_birch_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = deco.node_sound_wood_defaults(),
})

minetest.register_node("deco:leaves_birch", {
	description = ("Birch Tree Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"deco_birch_leaves.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 2,
		items = {
			{items = {"deco:birch_sapling"}, rarity = 5},
			{items = {"items:sticks"}, rarity = 2}
		}
	},
	sounds = deco.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("deco:sapling_birch", {
	description = ("Birch Sapling"),
	drawtype = "plantlike",
	tiles = {"deco_birch_sapling.png"},
	inventory_image = "deco_birch_sapling.png",
	wield_image = "deco_birch_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0.5, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = deco.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = deco.sapling_on_place(itemstack, placer, pointed_thing,
			"deco:birch_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})