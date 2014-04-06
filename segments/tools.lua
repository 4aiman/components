--[[
Components
A Minetest mod by SegFault22

Details: Adds elementary components to be used by other mods. Also includes a set of unique crafting tools.
--]]

--This is the ''Tools'' segment. It includes tools necessary for the fabrication of parts.

--////////////////
-- Crafting Tools
--////////////////

-- Tools

local tools = {
	{ "components:hammer", "Hammer", "components_hammer.png" },
	{ "components:saw", "Saw", "components_saw.png" },
	{ "components:file", "File", "components_file.png" },
	{ "components:cutter", "Cutter", "components_cutter.png" },
	{ "components:drill", "Drill", "components_drill.png" },
}

for _, row in ipairs(tools) do
	local toolid = row[1]
	local toolname = row[2]
	local toolimg = row[3]

	minetest.register_craftitem(toolid, {
		description = toolname,
		inventory_image = toolimg,
		on_place_on_ground = minetest.craftitem_place_item,
	})

end

-- Crafting of said Tools

minetest.register_craft( {
	output = 'components:hammer 1',
	recipe = {
		{ 'craft "default:steel_ingot"', 'craft "default:steel_ingot"', 'craft "default:steel_ingot"' },
		{ 'craft "default:steel_ingot"', 'craft "default:steel_ingot"', 'craft "default:steel_ingot"' },
		{ '', 'craft "default:stick"', '' },
	}
})

minetest.register_craft( {
	output = 'components:saw 1',
	recipe = {
		{ 'craft "default:stick"', 'craft "default:stick"', 'craft "default:stick"' },
		{ 'craft "components:plate_steel"', 'craft "components:plate_steel"', 'craft "default:stick"' },
		{ 'craft "components:file"', 'craft "components:hammer"', '' },
	},
      replacements = {
		{'components:file', 'components:file'},
		{'components:hammer', 'components:hammer'},
	},
})

minetest.register_craft( {
	output = 'components:file 1',
	recipe = {
		{ '', 'craft "default:steel_ingot"' },
		{ 'craft "default:stick"', '' },
	}
})

minetest.register_craft( {
	output = 'components:cutter 1',
	recipe = {
		{ 'craft "components:plate_steel"', 'craft "components:file"', 'craft "components:plate_steel"' },
		{ '', 'craft "components:plate_steel"', '' },
		{ 'craft "default:stick"', '', 'craft "default:stick"' },
	},
      replacements = {
		{'components:file', 'components:file'},
	},
})

minetest.register_craft( {
	output = 'components:drill 1',
	recipe = {
		{ 'craft "default:steel_ingot"', 'craft "components:file"' },
		{ 'craft "default:stick"', '' },
	},
      replacements = {
		{'components:file', 'components:file'},
	},
})