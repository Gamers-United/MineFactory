--[[
Sprint mod for Minetest by GunshipPenguin

To the extent possible under law, the author(s)
have dedicated all copyright and related and neighboring rights 
to this software to the public domain worldwide. This software is
distributed without any warranty. 
]]

--Configuration variables, these are all explained in README.md
SPRINT_SPEED = 1.7
SPRINT_JUMP = 1.15
SPRINT_TIMEOUT = 1 --Only used if SPRINT_METHOD = 0
SPRINT_STAMINA = 30
SPRINT_HUDBARS_USED = true

dofile(minetest.get_modpath("sprint") .. "/wsprint.lua")
dofile(minetest.get_modpath("sprint") .. "/esprint.lua")
