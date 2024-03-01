Config = {}


-- Minimum Police Requirement

Config.MinimumPolice = 0 -- minimum police to start heist

-- Cooldown time limit in minutes

Config.Cooldown = 60 

-- Hacking Locations

Config.FirstHack = vector3(-601.066, -1164.29, 22.17)
Config.SecondHack = vector3(1049.05, -3100.79, -38.99)

-- Set to true if you want police to be able to enter the warehouse as well

Config.PoliceCanRaid = true

-- Minigame 

Config.Blocks = "12" -- Number of correct blocks the player needs to click
Config.Attempts = "3" -- Number of incorrect blocks after which the game will fail
Config.Show = "6" -- Time in secs for which the right blocks will be shown
Config.Time = "45" -- Maximum time after timetoshow expires for player to select the right blocks

-- Set to true if you want to enable multiplayer

Config.EnableMultiplayer = true

-- Set to true if you want the locks to be triggered upon entrance

Config.EnableLocks = true

-- Items from Boxes

Config.Box1 = {
    "goldbar",
    "10kgoldchain",
    "rolex",
    "trojan_usb"
}

Config.Box2 = {
    "weapon_smg",
    "weapon_microsmg",
    "weapon_pistol50",
    "heavyarmor",
    "weapon_smokegrenade"
}

Config.Box3 = {
    "goldbar",
    "10kgoldchain",
    "rolex",
    "nitrous"
}

Config.Box4 = {
    "laptop",
    "tablet",
    "samsungphone",
    "cryptostick"
}

Config.Box5 = {
    "weapon_smg",
    "weapon_microsmg",
    "weapon_pistol50",
    "heavyarmor"

}

Config.Box6 = {
    "coke_brick",
    "xtcbaggy",
    "weed_brick",
    "cocaine_bag"
}

-- Blip Creation

Config.UseBlip = true

Config.BlipLocation = {
    {title="Secured Warehouse", colour=18, id=473, x = -619.93060302734, y = -1130.2767333984, z = 22.178251266479},
} 

-- Box Spawns

Config.LootLocations = {
    [1] 	= vector4(1052.95, -3110.31, -39.9, 180.0),
    [2] 	= vector4(1055.56, -3110.31, -39.9, 180.0),
    
    [3] 	= vector4(1067.44, -3102.73, -39.9, 0.0),
    [4] 	= vector4(1053.06, -3102.73, -39.9, 0.0),

    [5] 	= vector4(1055.64, -3095.97, -39.99, 0.0),
    [6] 	= vector4(1065.20, -3095.57, -39.9, 342.39),
}

Config.WarehouseLoot = {
    [1] = "ex_prop_crate_closed_bc",
}

Config.RandomLocations = {
    [1] 	= vector4(1067.68, -3095.57, -39.9, 342.39),
    [2] 	= vector4(1062.73, -3095.57, -39.9, 342.39),
    [3] 	= vector4(1060.37, -3095.57, -39.9, 342.39),
    [4] 	= vector4(1057.95, -3095.57, -39.9, 342.39),
    [5] 	= vector4(1053.13, -3095.97, -39.99, 0.0),
    [6] 	= vector4(1067.68, -3095.57, -39.9, 342.39),

    [7] 	= vector4(1055.49, -3102.62, -39.9, 342.39),
    [8]	    = vector4(1057.93, -3102.62, -39.9, 342.39),
    [9] 	= vector4(1060.19, -3102.62, -39.9, 342.39),
    [10] 	= vector4(1062.71, -3102.62, -39.9, 342.39),
    [11] 	= vector4(1065.19, -3102.62, -39.9, 342.39),

    [12] 	= vector4(1065.13, -3109.71, -39.9, 342.39),
    [13] 	= vector4(1062.70, -3109.71, -39.9, 342.39),
    [14]	= vector4(1060.24, -3109.71, -39.9, 342.39),
    [15]	= vector4(1057.76, -3109.71, -39.9, 342.39),
    [16] 	= vector4(1067.69, -3109.71, -39.9, 342.39),
}

Config.WarehouseObjects = {
    [1] = "prop_boxpile_05a",
    [2] = "prop_boxpile_04a",
    [3] = "prop_boxpile_06b",
    [4] = "prop_boxpile_02c",
    [5] = "prop_boxpile_02b",
    [6] = "prop_boxpile_01a",
    [7] = "prop_boxpile_08a",
}

-- Starting Ped

Config.StartingPed = true

Config.Peds = {
    {
        type = 'boss',
        position = vector4(49.85, -1453.52, 29.31, 54.43)
    },
}

-- Guards in the Warehouse

Config.SpawnGuards = true

Config.Guards = {
    [1] = {
        pos = {1060.23, -3100.3, -39.0, 268.8}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_PISTOL', -- guards weapon
        health = 1000, -- guards health
        range = 2, -- guards range
        accuracy = 50, -- guards accuracy
        aggresiveness = 2, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 1, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 50 -- guards armor 
    },  
    [2] = {
        pos = {1050.08, -3096.73, -39.0, 258.21}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_PISTOL', -- guards weapon
        health = 1000, -- guards health
        range = 2, -- guards range
        accuracy = 50, -- guards accuracy
        aggresiveness = 2, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 1, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 50 -- guards armor 
    },  
    [3] = {
        pos = {1050.78, -3107.06, -39.0, 281.02}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_PUMPSHOTGUN', -- guards weapon
        health = 1000, -- guards health
        range = 2, -- guards range
        accuracy = 50, -- guards accuracy
        aggresiveness = 2, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 1, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 50 -- guards armor 
    }, 
    [4] = {
        pos = {1061.74, -3104.44, -39.0, 268.33}, -- guards position
        ped = 's_m_m_prisguard_01', -- guards hash
        weapon = 'WEAPON_PISTOL', -- guards weapon
        health = 1000, -- guards health
        range = 2, -- guards range
        accuracy = 50, -- guards accuracy
        aggresiveness = 2, -- guards aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 1, -- guards alertness 3 is the highest one - values from 0 to 3.
        armor = 50 -- guards armor 
    }, 

}
