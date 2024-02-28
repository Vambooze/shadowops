Config = {}
-------------------------------------------------------------------------------------------------------------------------------------------------------
-- _      _____                                                   _   _             
--| |    / ____|      /\                                         | | (_)            
--| |   | |   ______ /  \   _ __ ___  _ __ ___  _   _ _ __   __ _| |_ _  ___  _ __  
--| |   | |  |______/ /\ \ | '_ ` _ \| '_ ` _ \| | | | '_ \ / _` | __| |/ _ \| '_ \ 
--| |___| |____    / ____ \| | | | | | | | | | | |_| | | | | (_| | |_| | (_) | | | |
--|______\_____|  /_/    \_\_| |_| |_|_| |_| |_|\__,_|_| |_|\__,_|\__|_|\___/|_| |_|
																				  
--Make sure to join the discord for support https://discord.gg/VbArb64C56																			  

-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Only Enable One
Config.Renewed = false
Config.QBManagement = true

-- If set true you can set commision bonuses, if not true all money goes to the worked
Config.Commision = true
Config.BusinessComission = 0.1 -- How much the business gets from each transaction
Config.PlayerCommision = 0.9 -- How much the player gets from each transaction

Config.MaxBill = 10000 -- The maximum a seller can bill someone


-------------------------------------------------------------------------------------------------------------------------------------------------------
-- If true, when a user is crafted the serial number will be registered to the person that crafted it. 
--When its added to the stock it will be removed from the MDT. On sale it will generate a new serial and issue it into the mdt to the purchased player

Config.PSMDT = true -- make sure to set the line below
Config.ImageURL = "https://cfx-nui-qb-inventory/html/images" -- Make sure in qb-core/shared/items your weapon name is the same as the image or it wont work.

Config.MDTTable = {
	["weapon_pistol"] = { 
		class = 1
	}
}





-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Deliveries

Config.VehicleModel = "kuruma2" -- What delivery vehicle you want to use
Config.FuelExport = "ps-fuel" -- This is what Fuel You Use in your server for the delivery Vans
Config.FuelLevel = 100 -- How much fuel should be put into the Vehicle

--Where they have to go to pickup stock
Config.PickupStock = vector3(32.05, -1148.11, 29.4)

-- You can change what you want the rewards to be on each delivery
Config.Rewards = {
	["pistol_parts"] = 5,
	["smg_parts"] = 3,
	["rifle_parts"] = 1,
	["shotgun_parts"] = 2,
}

-------------------------------------------------------------------------------------------------------------------------------------------------------

Config.Debug = false

-- These are crafting recipes for the employees
Config.Recipes = {
    ["weapon_pistol"] = {
        label = "Pistol",
        desc = "5x Pistol Parts",
        items_required = {
            ["pistol_parts"] = 1,
        },
    },
}

-- Configure it so the user needs a weapons license or not
Config.SaleProducts = {
	["weapon_pistol"] = {license_required = true, label = "Pistol"},
	["weapon_snspistol"] = {license_required = true, label = "SNS Pistol"},
	["pistol_ammo"] = {license_required = false, label = "Pistol Ammo"}
}

-- Used for Weapon Showcase
Config.WeaponModels = {
	['weapon_pistol'] = 'w_pi_pistol',
	['weapon_ceramicpistol'] = 'w_pi_ceramic_pistol',
	['weapon_combatpistol'] = 'w_pi_combatpistol',
	['weapon_snspistol'] = 'w_pi_sns_pistol',
	['weapon_pumpshotgun'] = 'w_sg_pumpshotgun',
	['weapon_marksmanrifle'] = 'w_sr_marksmanrifle',
	['pistol_ammo'] = 'prop_ld_ammo_pack_01',
	['shotgun_ammo'] = 'prop_ld_ammo_pack_02',
	['rifle_ammo'] = 'prop_ld_ammo_pack_03',
	['smg_ammo'] = 'prop_ld_ammo_pack_01',
}

Config.Shops = {
	[1] = {
		-------------------
		stash_location = vector3(4.24, -1105.52, 29.8), 
		stash_size = 100000, 
		stash_slots = 100, 
		-------------------
		blip_location = vector3(19.12, -1111.31, 29.8), 
		blip_sprite = 110, 
		blip_size = 0.6, 
		blip_color = 1, 
		blip_label = "Ammunation", 
		-------------------
		crafting_location = vector3(6.48, -1100.23, 29.8), 
		-------------------
		sale_position = vector3(18.09, -1108.52, 29.92), 
		-------------------
		showcase_postition = vector3(17.84, -1109.5, 29.8), 
		showcase_heading = 250.31, 
		-------------------
		shop_location = vector3(23.69, -1106.46, 29.92),
		-------------------
		job_name = "ammunation1",
		-------------------
		delivery_start =  vector3(12.57, -1105.85, 29.8),
		vehicle_pickup = vector3(11.28, -1116.5, 28.83),
		vehicle_spawn = vector4(7.51, -1115.91, 28.77, 76.48),
		deliver_stock = vector3(20.56, -1104.11, 29.8),
	}
}



Config.ShopItems = {
    label = "Ammunation Store",
    slots = 7,
    items = {
        [1] = {
            name = "pistol_ammo",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "smg_ammo",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "shotgun_ammo",
            price = 5,
            amount = 1000,
            info = {},
            type = "item",
            slot = 3,
        },
	}
}