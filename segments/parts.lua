--[[
Components
A Minetest mod by SegFault22

Details: Adds elementary components to be used by other mods. Also includes a set of unique crafting tools.
--]]

--This is the ''Parts'' segment. It includes parts used to make stuff.

--////////
-- Parts
--////////

local parts = {
	--Plates
    { "components:plate_steel", "Steel Plate", "components_plate_steel.png" },
    { "components:plate_gold", "Gold Plate", "components_plate_gold.png" },
	--Rods
    { "components:rod_steel", "Steel Rod", "components_rod_steel.png" },
    { "components:rod_gold", "Gold Rod", "components_rod_gold.png" },
	--Wafers
    { "components:wafer_steel", "Steel Wafer", "components_wafer_steel.png" },
    { "components:wafer_gold", "Gold Wafer", "components_wafer_gold.png" },
	--Rings
    { "components:ring_steel", "Steel Ring", "components_ring_steel.png" },
    { "components:ring_gold", "Gold Ring", "components_ring_gold.png" },
	--Gears
    { "components:gear_steel", "Steel Gear", "components_gear_steel.png" },
    { "components:gear_gold", "Gold Gear", "components_gear_gold.png" },
}

for _, row in ipairs(parts) do
	local partid = row[1]
	local partname = row[2]
	local partimg = row[3]

	minetest.register_craftitem(partid, {
		description = partname,
		inventory_image = partimg,
		on_place_on_ground = minetest.craftitem_place_item,
	})
end


--///////////////
-- Part Crafting
--///////////////

-- Plates

local platecraft = {
	{ "default:steel_ingot", "components:plate_steel" },
	{ "default:gold_ingot", "components:plate_gold" },
}

for _, row in ipairs(platecraft) do
	local platein = row[1]
	local plateout = row[2]

	minetest.register_craft( {
		output = plateout..'',
		recipe = {
			{ 'craft "components:hammer"' },
			{ platein },
		},
      	replacements = {
			{'components:hammer', 'components:hammer'},
		},
    })
end

-- Rods

local rodcraft = {
	{ "default:steel_ingot", "components:rod_steel 2" },
	{ "default:gold_ingot", "components:rod_gold 2" },
}

for _, row in ipairs(rodcraft) do
	local rodin = row[1]
	local rodout = row[2]

	minetest.register_craft( {
		output = rodout..'',
		recipe = {
			{ 'craft "components:saw"' },
			{ rodin },
		},
      	replacements = {
			{'components:saw', 'components:saw'},
		},
    })
end

-- Wafers

local wafercraft = {
	{ "default:steel_ingot", "components:wafer_steel 4" },
	{ "default:gold_ingot", "components:wafer_gold 4" },
}

for _, row in ipairs(wafercraft) do
	local waferin = row[1]
	local waferout = row[2]

	minetest.register_craft( {
		output = waferout..'',
		recipe = {
			{ waferin, 'craft "components:saw"' },
		},
      	replacements = {
			{'components:saw', 'components:saw'},
		},
    })
end

-- Rings

local ringcraft = {
	{ "components:wafer_steel", "components:ring_steel" },
	{ "components:wafer_gold", "components:ring_gold" },
}

for _, row in ipairs(ringcraft) do
	local ringin = row[1]
	local ringout = row[2]

	minetest.register_craft( {
		output = ringout..'',
		recipe = {
			{ ringin, 'craft "components:drill"' },
		},
      	replacements = {
			{'components:drill', 'components:drill'},
		},
    })
end

-- Gears

local gearcraft = {
	{ "components:wafer_steel", "components:gear_steel" },
	{ "components:wafer_gold", "components:gear_gold" },
}

for _, row in ipairs(gearcraft) do
	local gearin = row[1]
	local gearout = row[2]

	minetest.register_craft( {
		output = gearout..'',
		recipe = {
			{ gearin, 'craft "components:file"' },
		},
      	replacements = {
			{'components:file', 'components:file'},
		},
    })
end