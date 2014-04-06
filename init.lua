--[[
Components
A Minetest mod by SegFault22

Details: Adds elementary components to be used by other mods. Also includes a set of unique crafting tools.
--]]

--/////////
--Segments
--/////////

dofile(minetest.get_modpath("components").."/segments/tools.lua")
--Tools segment; inclused registry and crafting of speciial tools

dofile(minetest.get_modpath("components").."/segments/parts.lua")
--Parts segment; includes simple parts - plates, rods, and stuff like that.