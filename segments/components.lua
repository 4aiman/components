--[[
Components
A Minetest mod by SegFault22

Details: Adds elementary components to be used by other mods. Also includes a set of unique crafting tools.
--]]

--This is the ''Components'' segment. It includes components made up of multiple parts.

--[[

The code beyond here has not yet been formatted. Please wait until next release for relevant content.

--////////
-- Plates
--////////

-- Plates

local plates = {
    { "components:plate_steel", "Steel Plate", "components_plate_steel.png" },
    { "components:plate_gold", "Gold Plate", "components_plate_gold.png" },
}

for _, row in ipairs(plates) do
	local plateid = row[1]
	local platename = row[2]
	local plateimg = row[3]

	minetest.register_craftitem(plateid, {
		description = platename,
		inventory_image = plateimg,
		on_place_on_ground = minetest.craftitem_place_item,
	})

end

-- Crafting of said Plates

local platecraft = {
	{ "default:steel_ingot", "components:plate_steel" },
	{ "default:gold_ingot", "components:plate_gold" },
}

for _, row in ipairs(platecraft) do
	local ingotin = row[1]
	local plateout = row[2]

	minetest.register_craft( {
		output = plateout..'',
		recipe = {
			{ 'components:hammer' },
			{ ingotin },
      	},
      	replacements = {
			{'components:hammer', 'components:hammer'},
		},
    })

end
--]]