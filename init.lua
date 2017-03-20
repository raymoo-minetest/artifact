
artifact = {}

local modpath = minetest.get_modpath("artifact") .. "/"
local function load_script(subpath)
	dofile(modpath .. subpath)
end

load_script("material.lua")
