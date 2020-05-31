--import multiblock structure
local multiblock = dofile(minetest.get_modpath("multiblock") .. "/multiblock.lua")
--assembly machines 1
minetest.register_node("assembly_buildings:assembly_machine_1", {
    description = "Machine Part, Multiblock Structure Component",
    tiles = {"assembly_buildings_assembly_machine_1_top.png","assembly_buildings_assembly_machine_1_bottom.png","assembly_buildings_assembly_machine_1_right.png",
             "assembly_buildings_assembly_machine_1_left.png","assembly_buildings_assembly_machine_1_back.png","assembly_buildings_assembly_machine_1_front.png"},
	groups = {crumbly=0, soil=0},
	drop = 'blocks:machinepart',
})
local assembly_machine_1_pattern = {
    size = {x=3, y= 2, z = 3},
    center = {x=2, y = 2, z = 2},
    pattern =  {
        "blocks:machinepart","blocks:machinepart","blocks:machinepart",
        "blocks:machinepart","blocks:machinepart","blocks:machinepart",
        "blocks:machinepart","blocks:machinepart","blocks:machinepart",
        --level 2
        "blocks:machinepart","blocks:machinepart","blocks:machinepart",
        "blocks:machinepart","assembly_buildings:assembly_machine_1","blocks:machinepart",
        "blocks:machinepart","blocks:machinepart","blocks:machinepart",
    },
}
