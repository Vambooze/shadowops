Config = {}

Config.setupMenu = 'qb-menu' -- qb-menu / nh-context

Config.vehicleList = {
    { name = "Bison", model = "bison", price = 300 },
    { name = "Futo", model = "Futo", price = 250 },
    { name = "Coach", model = "coach", price = 400 },
    { name = "Tour bus", model = "tourbus", price = 600 },
    { name = "Taco", model = "taco", price = 420 },
    { name = "Limo", model = "stretch", price = 1250 },
    { name = "Hearse", model = "romero", price = 1300 },
    { name = "Clown Car", model = "speedo2", price = 2850 },
    { name = "Festival Bus", model = "pbus2", price = 4500 },
}


-- Blips 
Config.Locations = {
    ["rentalstations"] = {
        [1] = {label = "Rental Stations", coords = vector4(-1026.29, -2743.89, 20.17, 52.64)},
        [2] = {label = "Rental Stations", coords = vector4(109.46, -1089.13, 29.30, 333.25)},
        [3] = {label = "Rental Stations", coords = vector4(-1442.49, -673.65, 26.53, 288.07)},
        [4] = {label = "Rental Stations", coords = vector4(1224.63, 2728.56, 38.01, 181.86)},
    },
}

Config.vehicleSpawn = {
    --- Airport
	[1] = { 
		workSpawn = {
			coords = vector3(-1027.53, -2733.63, 20.08),
			heading = 234.35,
		},
	},
    --- Davis 
    [2] = { 
		workSpawn = {
			coords = vector3(111.37, -1080.81, 29.19),
			heading = 159.01,
		},
	},
 --- Marathon Avenue
    [3] = { 
		workSpawn = {
			coords = vector3(-1444.12, -680.25, 26.39),
			heading = 122.5,
		},
	},
 --- Harmony   
    [4] = { 
		workSpawn = {
			coords = vector3(1213.44, 2723.28, 38.00),
			heading = 173.12,
		},
	},
}


-- Addding Exports to your QB-Target Can be found at client.lua
