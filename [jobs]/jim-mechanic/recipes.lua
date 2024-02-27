Crafting = {
	Tools = {
		{ ['mechanic_tools'] = { ['iron'] = 150, } },
		{ ['toolbox'] = { ['iron'] = 150, } },
		{ ['ducttape'] = { ['plastic'] = 150, } },
		{ ['paintcan'] = { ['aluminum'] = 150, } },
		{ ['tint_supplies'] = { ['iron'] = 150, } },
		{ ['underglow_controller'] = { ['iron'] = 150, } },
		{ ['cleaningkit'] = { ['rubber'] = 150, } },

				-- Example : Delete me --
		-- Support for multiple items in recipes --
		-- Support for multiple resulting items --
		-- Support to limit items to certain job roles --
--		{ ['cleaningkit'] = { ['rubber'] = 1, ["engine2"] = 1, ['plastic'] = 1 },
--				["amount"] = 2, ["job"] = { ["mechanic"] = 4, ["tuner"] = 4, } },
				-- Example : Delete me --

	},
	Perform = {
		{ ['turbo'] = { ['steel'] = 500, } },
		{ ['car_armor'] = { ['plastic'] = 1000, } },
		{ ['engine1'] = { ['steel'] = 250, } },
		{ ['engine2'] = { ['steel'] = 500, } },
		{ ['engine3'] = { ['steel'] = 750, } },
		{ ['engine4'] = { ['steel'] = 1000, } },
		{ ['transmission1'] = { ['steel'] = 250, } },
		{ ['transmission2'] = { ['steel'] = 500, } },
		{ ['transmission3'] = { ['steel'] = 750, } },
		{ ['brakes1'] = { ['steel'] = 250, } },
		{ ['brakes2'] = { ['steel'] = 500, } },
		{ ['brakes3'] = { ['steel'] = 750, } },
		{ ['suspension1'] = { ['steel'] = 250, } },
		{ ['suspension2'] = { ['steel'] = 500, } },
		{ ['suspension3'] = { ['steel'] = 750, } },
		{ ['suspension4'] = { ['steel'] = 1000, } },
		{ ['bprooftires'] = { ['rubber'] = 1000, } },
		{ ['drifttires'] = { ['rubber'] = 500, } },
		{ ['nos'] = { ['noscan'] = 500, } },
		{ ['noscan'] = { ['steel'] = 500, } },
	},
	Cosmetic = {
		{ ['hood'] = { ['plastic'] = 250, } },
		{ ['roof'] = { ['plastic'] = 250, } },
		{ ['spoiler'] = { ['plastic'] = 250, } },
		{ ['bumper'] = { ['plastic'] = 250, } },
		{ ['skirts'] = { ['plastic'] = 250, } },
		{ ['exhaust'] = { ['iron'] = 250, } },
		{ ['seat'] = { ['plastic'] = 250, } },
		{ ['livery'] = { ['plastic'] = 250 }, },
		{ ['tires'] = { ['rubber'] = 250, } },
		{ ['horn'] = { ['plastic'] = 250, } },
		{ ['internals'] = { ['plastic'] = 250, } },
		{ ['externals'] = { ['plastic'] = 250, } },
		{ ['customplate'] = { ['steel'] = 250, } },
		{ ['headlights'] = { ['plastic'] = 250, } },
		{ ['rims'] = { ['iron'] = 250, } },
		{ ['rollcage'] = { ['steel'] = 250, } },
		{ ['noscolour'] = { ['plastic'] = 250, } },
	},
}

Stores = {
	ToolItems = {
		label = Loc[Config.Lan]["stores"].tools,
		items = {
			{ name = "mechanic_tools", price = 1000, amount = 10, info = {}, type = "item", },
			{ name = "toolbox", price = 750, amount = 10, info = {}, type = "item", },
			{ name = "ducttape", price = 100, amount = 100, info = {}, type = "item", },
			{ name = "paintcan", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "tint_supplies", price = 500, amount = 50, info = {}, type = "item", },
			{ name = "underglow_controller", price = 10000, amount = 50, info = {}, type = "item", },
			{ name = "cleaningkit", price = 100, amount = 100, info = {}, type = "item", },
		},
	},
	PerformItems = {
		label = Loc[Config.Lan]["stores"].perform,
		items = {
			{ name = "turbo", price = 25000, amount = 50, info = {}, type = "item", },
			{ name = "engine1", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "engine2", price = 4000, amount = 50, info = {}, type = "item", },
			{ name = "engine3", price = 6000, amount = 50, info = {}, type = "item", },
			{ name = "engine4", price = 12000, amount = 50, info = {}, type = "item", },
			{ name = "transmission1", price = 6000, amount = 50, info = {}, type = "item", },
			{ name = "transmission2", price = 8000, amount = 50, info = {}, type = "item", },
			{ name = "transmission3", price = 20000, amount = 50, info = {}, type = "item", },
			{ name = "brakes1", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "brakes2", price = 2000, amount = 50, info = {}, type = "item", },
			{ name = "brakes3", price = 3000, amount = 50, info = {}, type = "item", },
			{ name = "car_armor", price = 25000, amount = 50, info = {}, type = "item", },
			{ name = "suspension1", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "suspension2", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "suspension3", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "suspension4", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "bprooftires", price = 50000, amount = 50, info = {}, type = "item", },
			{ name = "drifttires", price =250, amount = 50, info = {}, type = "item", },
			{ name = "nos", price = 250000, amount = 50, info = {}, type = "item", },
		},
	},
	StoreItems = {
		label = Loc[Config.Lan]["stores"].cosmetic,
		items = {
			{ name = "hood", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "roof", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "spoiler", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "bumper", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "skirts", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "exhaust", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "seat", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "livery", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "tires", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "horn", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "internals", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "externals", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "customplate", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "headlights", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "rims", price = 1000, amount = 100, info = {}, type = "item", },
			{ name = "rollcage", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "noscolour", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "repairkit", price = 100, amount = 50, info = {}, type = "item", },
		},
	},
}

-- No Touch
	-- This is corrective code to help simplify the stores for people removing the slot info
	-- Jim shops doesn't use it but other inventories do
	-- Most people don't even edit the slots, these lines generate the slot info autoamtically
Stores.StoreItems.slots = #Stores.StoreItems.items
for k in pairs(Stores.StoreItems.items) do Stores.StoreItems.items[k].slot = k end
Stores.PerformItems.slots = #Stores.PerformItems.items
for k in pairs(Stores.PerformItems.items) do Stores.PerformItems.items[k].slot = k end
Stores.ToolItems.slots = #Stores.ToolItems.items
for k in pairs(Stores.ToolItems.items) do Stores.ToolItems.items[k].slot = k end