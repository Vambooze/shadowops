Config = Config or {}
--[[
    Author: JDev17#8160
    TRANSLATION:
        To create a new translation file, copy an existing one and rename it to e.g. es (spanish), then translate it and change the imported file in the fxmanifest under shared_scripts.
    GARAGE CONFIGURATION EXAMPLE:
    ['somegarage'] = {
        ['Zone'] = {
            ['Shape'] = { -- Create a polyzone by using '/pzcreate poly', '/pzadd' and '/pzfinish' or '/pzcancel' to cancel it. the newly created polyzone will be in txData/QBCoreFramework_******.base/polyzone_created_zones.txt
            vector2(-1030.4713134766, -3016.3388671875),
            vector2(-970.09686279296, -2914.7397460938),
            vector2(-948.322265625, -2927.9030761718),
            vector2(-950.47174072266, -2941.6584472656),
            vector2(-949.04180908204, -2953.9467773438),
            vector2(-940.78369140625, -2957.2941894532),
            vector2(-943.88732910156, -2964.5512695312),
            vector2(-897.61529541016, -2990.0505371094),
            vector2(-930.01025390625, -3046.0695800782),
            vector2(-942.36407470704, -3044.7858886718),
            vector2(-952.97467041016, -3056.5122070312),
            vector2(-957.11712646484, -3057.0900878906)
            },
            ['minZ'] = 12.5,  -- min height of the parking zone, cannot be the same as maxZ, and must be smaller than maxZ
            ['maxZ'] = 20.0,  -- max height of the parking zone
            -- Important: Make sure the parking zone is high enough - higher than the tallest vehicle and touches the ground (turn on debug to see)
        },
        label = 'Hangar', -- label displayed on phone
        type = 'public', -- 'public', 'job', 'depot' or 'gang'
        showBlip = true, -- optional, when not defined, defaults to false
        blipName = 'Police', -- otional
        blipNumber = 90, -- optional, numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipColor = 69, -- optional, defaults to 3 (Blue), numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipcoords = vector3(-972.66, -3005.4, 13.32), -- blip coordinates
        job = 'police', -- optional, everyone can use it when not defined
        -- job = {'police', 'ambulance'), -- optional, multi job support
        useVehicleSpawner = true, uses the configured job vehicles, make sure to have the job attribute set! (job = 'police')                                                           <---    NEW
        jobGarageIdentifier = 'pd1', required when using vehicle spawner, references the JobVehicles down below, make sure this matches what you used in the JobVehicles table          <---    NEW
        gang = 'vagos', -- optional, same as job but for gangs, do not use both
        -- gang = {'vagos', 'gsf'}, -- optional, multi gang support
        jobVehiclesIndex = 'pd1', -- the corresponding index (JobVehicles)
        vehicleCategories = {'helicopter', 'plane'}, -- categories defined in VehicleCategories
        drawText = 'Hangar', -- the drawtext text, shown when entering the polyzone of that garage
        ParkingDistance = 10.0 -- Optional ParkingDistance, to override the global ParkingDistance
        SpawnDistance = 5.0 -- Optional SpawnDistance, to override the global SpawnDistance
        debug = false -- will show the polyzone and the parking spots, helpful when creating new garages. If too many garages are set to debug, it will not show all parking lots
        ExitWarpLocations: { -- Optional, Used for e.g. Boat parking, to teleport the player out of the boat to the closest location defined in the list.
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        }
    },
]]

-- NEW ---
-- There is a new clientside export called 'TrackVehicleByPlate' that can be used to track vehicles by plate, this is useful for other scripts that want to track vehicles by plate (e.g. exports['qb-garages']:TrackVehicleByPlate(plate))
-- And the clientside event 'qb-garages:client:TrackVehicleByPlate'(e.g. TriggerEvent('qb-garages:client:TrackVehicleByPlate', plate))

Config.TrackVehicleByPlateCommand = 'trackvehicle'
Config.EnableTrackVehicleByPlateCommand = true -- Allow players to track their vehicles by plate using /trackvehicle <plate>
Config.TrackVehicleByPlateCommandPermissionLevel = 'god' -- Permission level required to use /trackvehicle <plate>, false for anyone / everyone

-- NEW --



Config.SharedHouseGarage = true -- Allow shared house garages, if false, the player can only access their own vehicles
Config.SharedGangGarages = false -- Allow shared gang garages, if false, the player can only access their own vehicles
-- for specific gangs, use this:
-- Config.SharedGangGarages = {
--     ['vagos'] = true, -- Allow shared gang garages, if false, the player can only access their own vehicles
--     ['gsf'] = true, -- Allow shared gang garages, if false, the player can only access their own vehicles
-- }
-- NEW ---

Config.AllowParkingAnyonesVehicle = false -- Allow anyones vehicle to be stored in the garage, if false, only vehicles you own can be stored in the garage (supports only public garages)
Config.AllowParkingFromOutsideVehicle = true -- Allow parking from outside the vehicle, if false, you have to be inside the vehicle to park it
Config.VehicleParkDistance = 2.0 -- Distance from the player to the vehicle to park it, radial option will dissapear beyond this distance
Config.GlobalParking = false -- if true, you can access your cars from any garage, if false, you can only access your cars from the garage you stored them in
Config.SpawnVehiclesServerside = true -- REQUIRES THE ABSOLUTE LATEST VERSION OF QBCORE, OR MAKE SURE YOU HAVE THESE: https://github.com/qbcore-framework/qb-core/blob/81ffd872319d2eb8e496c3b3faaf37e791912c84/server/events.lua#L252
-- Only relevant if AllowSpawningFromAnywhere = false
Config.SpawnAtFreeParkingSpot = false -- Will spawn at the closest free parking spot if you walk up to a occupied parking spot (basically you have to walk up close to a parking lot but it does not matter if there is a vehicle blocking the spawn as it will spawn at the closest free parking spot)
Config.EnableParkingSpots = false
Config.StoreParkinglotAccuratly = false  -- store the last parking lot in the DB, if set to true, make sure to apply / run patch1.sql, I recommend applying the tracking snippet for qb-phone from the ReadMe to the phone so you can track the vehicle to the exact parking lot
Config.SpawnAtLastParkinglot = false -- spawn the vehicle at the last parked location if StoreParkinglotAccuratly = true, if set to true, make sure to apply / run patch1.sql
Config.GarageNameAsBlipName = true -- if set to true, the blips name will match the garage name
Config.FuelScript = 'ps-fuel' -- change to lj-fuel / ps-fuel if you use lj-fuel / ps-fuel or something else if you use any other LegcyFuel compatible script
Config.AllowSpawningFromAnywhere = true -- if set to true, the car can be spawned from anywhere inside the zone on the closest parking lot, if set to false you will have to walk up to a parking lot 
Config.AutoRespawn = true --True == auto respawn cars that are outside into your garage on script restart, false == does not put them into your garage and players have to go to the impound
Config.WarpPlayerIntoVehicle = false -- True == Will Warp Player Into their vehicle after pulling it out of garage. False It will spawn on the parking lot / in front of them  (Global, can be overriden by each garage)
Config.HouseParkingDrawText = 'Parking' -- text when driving on to the HOUSE parking lot
Config.ParkingDistance = 2.0 -- Distance to the parking lot when trying to park the vehicle  (Global, can be overriden by each garage)
Config.SpawnDistance = 4.5 -- The maximum distance you can be from a parking spot, to spawn a car (Global, can be overriden by each garage)
Config.DepotPrice = 60.0 -- The price to take out a despawned vehicle from impound.
Config.DrawTextPosition = 'left' -- location of drawtext: left, top, right

--[[ 
    Job Vehicles Configuration

    Every job-specific garage is identified by a unique jobGarageIdentifier.
    
    For each garage:
    - `label` provides a descriptive name for the garage.
    - `vehicles` is a grade-based list of vehicles available for that grade.

    For each vehicle:
    - `model` is the internal name of the vehicle.
    - `label` is the display name for the vehicle.
    - `configName` (optional) is a unique configuration identifier.
    - `job` (optional) restricts the vehicle to a specific job if multiple have access to this garage. If omitted, it's available for all jobs that have access to this sepecific garage.
    - with multi job restriction:  {"police", "swat"} --> If, for instance, 'ambulance' had access to this garage too, they wouldn't see this vehicle, only police and swat (in this example). 
    ---- NOTE: If you want the same vehicle with different liveries, create two entries with distinct configurations. 

    -- set useVehicleSpawner = true for each garage that has type job and should use the vehicle spawner instead of personal vehicles
]]

Config.UseIMG = true
Config.CustomIMG = {
    ["skyline"] = "https://i.ytimg.com/vi/tdVNr5B5iC4/maxresdefault.jpg",
    ["r35"] = "https://gtacarmods.com/wp-content/uploads/2021/08/271590_20210818160759_1.jpg"
}
Config.BFakePlates = false --If you use Brazzers-FakePlates change this to true

Config.JobVehicles = {
	['Davissheriff'] = { -- <-- jobGarageIdentifier
        label = "Police Vehicles",
        vehicles = {
            -- Grade 0
            [0] = {

                [1] = { label = "buffalosxpol", model = "buffalosxpol", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [2] = { label = "dnscout", model = "dnscout", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [3] = { label = "lssdbuffalosx", model = "lssdbuffalosx", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [4] = { label = "nkcoquette", model = "nkcoquette", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [5] = { label = "nkgauntlet4", model = "nkgauntlet4", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [6] = { label = "nktorrence", model = "nktorrence", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [7] = { label = "umkalamo", model = "umkalamo", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
            },
            -- Grade 1
            [1] = {
                [1] = { label = "buffalosxpol", model = "buffalosxpol", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [2] = { label = "dnscout", model = "dnscout", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [3] = { label = "lssdbuffalosx", model = "lssdbuffalosx", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [4] = { label = "nkcoquette", model = "nkcoquette", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [5] = { label = "nkgauntlet4", model = "nkgauntlet4", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [6] = { label = "nktorrence", model = "nktorrence", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [7] = { label = "umkalamo", model = "umkalamo", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job

            },
            -- Grade 2
            [2] = {
                [1] = { label = "buffalosxpol", model = "buffalosxpol", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [2] = { label = "dnscout", model = "dnscout", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [3] = { label = "lssdbuffalosx", model = "lssdbuffalosx", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [4] = { label = "nkcoquette", model = "nkcoquette", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [5] = { label = "nkgauntlet4", model = "nkgauntlet4", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [6] = { label = "nktorrence", model = "nktorrence", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [7] = { label = "umkalamo", model = "umkalamo", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
            },
            -- Grade 3
            [3] = {
                [1] = { label = "buffalosxpol", model = "buffalosxpol", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [2] = { label = "dnscout", model = "dnscout", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [3] = { label = "lssdbuffalosx", model = "lssdbuffalosx", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [4] = { label = "nkcoquette", model = "nkcoquette", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [5] = { label = "nkgauntlet4", model = "nkgauntlet4", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [6] = { label = "nktorrence", model = "nktorrence", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [7] = { label = "umkalamo", model = "umkalamo", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
            },
            -- Grade 4
            [4] = {
                [1] = { label = "buffalosxpol", model = "buffalosxpol", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [2] = { label = "dnscout", model = "dnscout", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [3] = { label = "lssdbuffalosx", model = "lssdbuffalosx", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [4] = { label = "nkcoquette", model = "nkcoquette", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [5] = { label = "nkgauntlet4", model = "nkgauntlet4", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [6] = { label = "nktorrence", model = "nktorrence", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [7] = { label = "umkalamo", model = "umkalamo", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
            },
            [5] = {
                [1] = { label = "buffalosxpol", model = "buffalosxpol", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [2] = { label = "dnscout", model = "dnscout", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [3] = { label = "lssdbuffalosx", model = "lssdbuffalosx", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [4] = { label = "nkcoquette", model = "nkcoquette", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [5] = { label = "nkgauntlet4", model = "nkgauntlet4", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [6] = { label = "nktorrence", model = "nktorrence", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [7] = { label = "umkalamo", model = "umkalamo", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
            },
            [6] = {
                [1] = { label = "buffalosxpol", model = "buffalosxpol", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [2] = { label = "dnscout", model = "dnscout", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [3] = { label = "lssdbuffalosx", model = "lssdbuffalosx", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [4] = { label = "nkcoquette", model = "nkcoquette", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job 
                [5] = { label = "nkgauntlet4", model = "nkgauntlet4", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [6] = { label = "nktorrence", model = "nktorrence", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
                [7] = { label = "umkalamo", model = "umkalamo", configName = "default", job = "bcso" }, -- job is optional, leave it away if this garage will only be accessed by the same job
            }
        }
    }
}

Config.VehicleSettings = {
    ['default'] = { -- configName
        ["livery"] = 1,
        ["extras"] = {
            ["1"] = true, -- on/off
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
            ["13"] = true,
        },
    }
}

-- '/restorelostcars <destination_garage>' allows you to restore cars that have been parked in garages which no longer exist in the config (garage renamed or removed). The restored cars get sent to the destination garage or if left empty to a random garage in the list.
-- NOTE: This may also send helis and boats to said garaga so choose wisely
Config.RestoreCommandPermissionLevel = 'god' -- sets the permission level for the above mentioned command

-- THESE VEHICLE CATEGORIES ARE NOT RELATED TO THE ONES IN shared/vehicles.lua
-- Here you can define which category contains which vehicle class. These categories can then be used in the garage config
-- All vehicle classes can be found here: https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.VehicleCategories = {
    ['car'] = { 0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12 },
    ['motorcycle'] = { 8 },
    ['other'] = { 13 }, -- cycles: 13 - you can move cycles to cars if you want and have anything else like military vehicles in this category
    ['boat'] = { 14 },
    ['helicopter'] = { 15 },
    ['plane'] = { 16 },
    ['service'] = { 17 },
    ['emergency'] = { 18 },
    ['military'] = { 19 },
    ['commercial'] = { 20 },
    -- you can also create new / delete or update categories, and use them below in the config.
}

Config.HouseGarageCategories = {'car', 'motorcycle', 'other'} -- Which categories are allowed to be parked at a house garage


Config.VehicleHeading = 'driverside' -- only used when NO parking spots are defined in the garage config
--[[^^^^^^^^
    'forward' = will face the sameway as the ped
    'driverside' = will put the driver door closets to the ped
    'hood' = will face the hood towards ped
    'passengerside' = will put the passenger door closets to the ped
]]

Config.SharedJobGarages = { -- define the job garages which are shared
    --'pdgarage',
}

Config.Garages = {
    --[[
        types:
        - public
        - job
        - depot
        vehicleCategories:
        - car
        - motorcycle
        - boat
        - helicopter
        - plane
        - other
    ]]
    ['pillboxgarage'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(75.48, -576.16),
                vector2(63.96, -572.52),
                vector2(55.68, -570.44),
                vector2(48.57, -568.98),
                vector2(38.42, -567.4),
                vector2(31.73, -566.63),
                vector2(20.83, -566.22),
                vector2(19.61, -569.19),
                vector2(15.02, -567.57),
                vector2(3.76, -598.58),
                vector2(23.77, -605.67),
                vector2(7.99, -648.6),
                vector2(21.81, -653.62),
                vector2(20.7, -657.82),
                vector2(32.76, -662.45),
                vector2(34.63, -661.22),
                vector2(48.2, -666.25),
                vector2(78.06, -584.13),
                vector2(73.72, -582.12),
            },
            ['minZ'] = 30.6,  -- min height of the parking zone
            ['maxZ'] = 32.6,  -- max height of the parking zone
        },
        label = 'Pillbox Garage',
        showBlip = true,
        blipcoords = vector3(37.08, -616.99, 34.19),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other',},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(48.46, -600.58, 31.05, 339.83),
            vector4(45.27, -598.81, 31.05, 337.94),
            vector4(41.67, -597.67, 31.05, 340.45),
            vector4(38.56, -596.16, 31.05, 338.12),
            vector4(34.99, -595.47, 31.05, 340.89),
            vector4(31.2, -593.92, 31.05, 339.65),
            vector4(27.64, -592.9, 31.05, 341.86),
            vector4(7.72, -596.58, 31.05, 251.56),
            vector4(9.52, -592.97, 31.05, 249.91),
            vector4(10.79, -589.67, 31.05, 248.15),
            vector4(11.64, -586.28, 31.05, 250.38),
            vector4(13.02, -582.73, 31.05, 250.56),
            vector4(14.43, -579.28, 31.05, 250.48),
            vector4(15.79, -575.91, 31.05, 250.57),
            vector4(16.99, -572.2, 31.05, 250.35),
            vector4(32.27, -579.78, 31.05, 338.59),
            vector4(36.28, -581.01, 31.05, 342.11),
            vector4(39.79, -581.82, 31.05, 339.93),
            vector4(42.7, -583.86, 31.05, 338.52),
            vector4(46.25, -584.88, 31.05, 343.14),
            vector4(49.66, -586.2, 31.05, 341.91),
            vector4(53.64, -586.94, 31.05, 341.75),
            vector4(57.03, -588.71, 31.05, 340.63),
            vector4(64.95, -576.19, 31.05, 163.06),
            vector4(68.08, -577.66, 31.05, 154.95),
            vector4(72.16, -578.61, 31.05, 155.89),
            vector4(73.41, -586.19, 31.05, 69.64),
            vector4(72.48, -589.82, 31.05, 67.8),
            vector4(70.89, -592.9, 31.05, 68.41),
            vector4(69.46, -596.76, 31.05, 68.6),
            vector4(67.89, -600.17, 31.05, 69.91),
            vector4(67.24, -603.68, 31.05, 67.92),
            vector4(65.89, -607.19, 31.05, 68.69),
            vector4(64.22, -611.22, 31.1, 68.4),
            vector4(54.68, -638.55, 31.09, 246.21),
            vector4(53.23, -641.75, 31.06, 69.7),
            vector4(52.06, -645.06, 31.05, 70.13),
            vector4(50.58, -648.56, 31.05, 67.35),
            vector4(49.61, -652.33, 31.05, 69.85),
            vector4(48.33, -655.49, 31.05, 68.67),
            vector4(47.37, -659.23, 31.05, 69.73),
            vector4(45.67, -662.47, 31.05, 66.96),
        }
    },
    ['pillboxlowergarage'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(352.34439086914, -620.59851074219),
                vector2(344.32354736328, -636.03747558594),
                vector2(325.94189453125, -628.93359375),
                vector2(331.88412475586, -613.10968017578)
            },
            ['minZ'] = 28.2,  -- min height of the parking zone
            ['maxZ'] = 31.30,  -- max height of the parking zone
        },
        label = 'Pillbox Lower Parking',
        showBlip = true,
        blipcoords = vector3(341.7, -623.33, 29.29),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(342.07, -632.51, 28.87, 340.17),
            vector4(338.89, -631.43, 28.87, 341.89),
            vector4(335.77, -630.04, 28.87, 340.85),
            vector4(332.61, -628.68, 28.87, 342.74),
            vector4(329.16, -627.36, 28.87, 341.84),
            vector4(346.44, -620.82, 28.87, 157.15),
            vector4(343.13, -619.38, 28.87, 157.56),
            vector4(339.76, -619.01, 28.87, 157.43),
            vector4(336.5, -617.88, 28.87, 162.09),
            vector4(333.34, -616.15, 28.87, 160.22),
            vector4(269.97, -322.62, 44.5, 248.07),
        }
    },
    ['dealerparking'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(-1197.01, -372.96),
                vector2(-1201.35, -342.08),
                vector2(-1263.56, -376.21),
                vector2(-1250.40, -401.11)
            },

        },
        label = 'Luxury Dealer Parking',
        showBlip = true,
        blipcoords = vector3(-1203.39, -362.30, 62.43),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1222.35, -383.80, 37.29, 28.63),
            vector4(-1215.41, -379.73, 37.29, 22.52),
            vector4(-1207.27, -375.69, 37.29, 17.12),
            vector4(-1200.05, -372.29, 37.29, 21.33),
            vector4(-1226.03, -385.22, 37.29, 38.28),
            vector4(-1237.01, -390.38, 37.29, 16.93),

        }
    },
    ['mirrorpark'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(1043.447265625, -767.26947021484),
                vector2(1049.4702148438, -769.44775390625),
                vector2(1049.4797363281, -794.31622314453),
                vector2(1048.9655761719, -794.32214355469),
                vector2(1049.03125, -793.87451171875),
                vector2(1043.466796875, -793.80151367188),
                vector2(1043.3436279297, -794.52691650391),
                vector2(1031.5026855469, -794.34808349609),
                vector2(1007.7255859375, -764.88061523438),
                vector2(1022.2494506836, -752.11022949219),
                vector2(1025.6563720703, -755.25653076172),
                vector2(1030.9210205078, -758.50311279297),
                vector2(1031.2462158203, -758.19201660156),
                vector2(1035.1042480469, -760.79956054688),
                vector2(1030.6268310547, -767.16302490234),
                vector2(1025.9473876953, -763.81085205078),
                vector2(1024.8063964844, -765.39245605469),
                vector2(1033.9915771484, -772.05816650391),
                vector2(1036.6497802734, -781.24871826172),
                vector2(1038.708984375, -780.87786865234),
                vector2(1035.7690429688, -770.72528076172),
                vector2(1032.0593261719, -768.04278564453),
                vector2(1034.0390625, -764.51586914062),
                vector2(1036.8060302734, -766.30773925781),
                vector2(1038.0424804688, -763.41851806641),
                vector2(1043.5157470703, -766.21325683594)
            },
            ['minZ'] = 56.50,
            ['maxZ'] = 59.20
        },
        label = 'Mirror Park Parking',
        showBlip = true,
        blipcoords = vector3(1037.65, -771.62, 58.01),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(1023.5, -756.15, 57.48, 225.44),
            vector4(1020.64, -758.19, 57.49, 225.22),
            vector4(1017.57, -760.75, 57.47, 222.83),
            vector4(1014.9, -763.11, 57.4, 223.82),
            vector4(1016.1, -770.57, 57.41, 311.2),
            vector4(1018.8, -773.42, 57.43, 308.15),
            vector4(1020.68, -776.34, 57.39, 311.86),
            vector4(1023.75, -779.38, 57.41, 309.66),
            vector4(1025.72, -782.07, 57.4, 308.8),
            vector4(1028.49, -784.92, 57.41, 307.36),
            vector4(1030.06, -787.96, 57.38, 310.65),
            vector4(1038.12, -791.16, 57.47, 1.48),
            vector4(1046.49, -785.56, 57.5, 89.6),
            vector4(1046.38, -782.01, 57.51, 92.17),
            vector4(1046.22, -778.03, 57.52, 89.04),
            vector4(1046.27, -774.45, 57.52, 90.5),
            vector4(1030.96, -773.4, 57.57, 144.89),
            vector4(1028.05, -771.42, 57.55, 146.44),
            vector4(1029.35, -763.6, 57.49, 56.05),
            vector4(1041.6, -791.45, 57.5, 0.97),
        }
    },
    ['casinop'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(915.48345947266, -14.229139328003),
                vector2(912.52160644531, -19.256662368774),
                vector2(914.41729736328, -20.468030929565),
                vector2(928.14013671875, -29.422761917114),
                vector2(931.68640136719, -24.097787857056),
                vector2(943.31915283203, -31.373510360718),
                vector2(940.18115234375, -36.682193756104),
                vector2(940.63336181641, -37.222324371338),
                vector2(941.06457519531, -38.056762695312),
                vector2(940.69250488281, -39.514526367188),
                vector2(945.86834716797, -42.898574829102),
                vector2(936.578125, -58.041912078857),
                vector2(935.71746826172, -59.93187713623),
                vector2(935.32781982422, -63.596141815186),
                vector2(935.49609375, -65.299346923828),
                vector2(936.2734375, -67.329566955566),
                vector2(938.08367919922, -69.736022949219),
                vector2(939.06182861328, -70.789291381836),
                vector2(942.05615234375, -73.50260925293),
                vector2(944.24096679688, -76.701873779297),
                vector2(945.71282958984, -80.333465576172),
                vector2(945.46759033203, -86.331184387207),
                vector2(944.24163818359, -90.072593688965),
                vector2(942.83435058594, -92.46647644043),
                vector2(928.69256591797, -105.37116241455),
                vector2(926.07592773438, -107.04386138916),
                vector2(922.68194580078, -107.79019927979),
                vector2(918.29956054688, -107.78350067139),
                vector2(914.76385498047, -106.68801879883),
                vector2(891.66986083984, -92.136535644531),
                vector2(894.90283203125, -86.966018676758),
                vector2(877.28314208984, -75.933624267578),
                vector2(873.83764648438, -81.048561096191),
                vector2(849.61877441406, -65.853485107422),
                vector2(842.07305908203, -59.212493896484),
                vector2(832.29779052734, -48.991901397705),
                vector2(836.66088867188, -44.546573638916),
                vector2(834.18530273438, -42.00004196167),
                vector2(832.93865966797, -39.975162506104),
                vector2(832.380859375, -35.275825500488),
                vector2(833.16229248047, -31.17188835144),
                vector2(839.43792724609, -22.388980865479),
                vector2(849.22601318359, -10.30827331543),
                vector2(871.66424560547, 12.689045906067),
                vector2(872.94342041016, 12.611633300781),
                vector2(881.33111572266, 7.0416121482849),
                vector2(880.61773681641, 5.6222538948059),
                vector2(880.45855712891, 1.066015958786),
                vector2(889.86468505859, -5.0284695625305),
                vector2(894.46960449219, -2.9582657814026),
                vector2(895.51623535156, -1.5529407262802)
            },
            ['minZ'] = 77.50,
            ['maxZ'] = 80.00
        },
        label = 'Casino Parking',
        showBlip = true,
        blipcoords = vector3(888.47, -37.44, 78.76),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(874.36, -77.52, 78.34, 326.7),
            vector4(868.22, -74.12, 78.34, 327.6),
            vector4(865.89, -71.32, 78.34, 327.2),
            vector4(862.79, -70.26, 78.34, 327.35),
            vector4(859.57, -67.92, 78.34, 326.45),
            vector4(856.54, -66.59, 78.34, 326.94),
            vector4(853.6, -64.76, 78.34, 329.96),
            vector4(850.98, -62.23, 78.34, 315.33);
            vector4(848.28, -60.42, 78.34, 316.25),
            vector4(845.29, -58.06, 78.34, 316.99),
            vector4(843.2, -55.19, 78.34, 315.68),
            vector4(841.22, -52.13, 78.34, 315.19),
            vector4(838.31, -49.98, 78.34, 309.63),
            vector4(836.03, -47.87, 78.34, 310.48),
            vector4(871.34, -75.41, 78.34, 327.5),
            vector4(934.99, -72.5, 78.27, 132.69),
            vector4(937.69, -74.87, 78.27, 135.96),
            vector4(940.12, -77.9, 78.27, 124.93),
            vector4(874.36, -77.52, 78.34, 326.7),
            vector4(871.34, -75.41, 78.34, 327.5),
            vector4(894.66, -90.02, 78.34, 329.43),
            vector4(897.75, -92.07, 78.34, 328.5),
            vector4(900.96, -93.67, 78.34, 326.42),
            vector4(903.67, -95.7, 78.34, 328.69),
            vector4(906.77, -97.42, 78.34, 326.69),
            vector4(909.56, -98.98, 78.27, 329.54),
            vector4(912.88, -100.65, 78.27, 327.47),
            vector4(915.52, -102.44, 78.27, 328.46),
            vector4(919.92, -104.15, 78.27, 355.56),
            vector4(924.34, -102.86, 78.27, 23.29),
            vector4(928.29, -100.03, 78.27, 41.76),
            vector4(931.14, -98.26, 78.27, 42.82),
            vector4(933.29, -95.84, 78.27, 43.98),
            vector4(935.95, -93.66, 78.27, 43.12),
            vector4(938.28, -91.0, 78.27, 43.96),
            vector4(941.5, -86.74, 78.27, 71.64),
            vector4(942.22, -82.22, 78.27, 96.61),
            vector4(932.29, -67.33, 78.27, 108.81),
            vector4(931.48, -62.49, 78.27, 87.5),
            vector4(933.04, -58.41, 78.27, 74.44),
            vector4(934.81, -53.94, 78.27, 56.79),
            vector4(936.58, -51.51, 78.27, 59.07),
            vector4(938.49, -48.34, 78.27, 57.96),
            vector4(939.46, -45.37, 78.27, 57.51),
            vector4(941.87, -42.09, 78.27, 57.26),
            vector4(939.92, -33.37, 78.27, 147.28),
            vector4(937.11, -31.58, 78.27, 146.31),
            vector4(934.46, -29.74, 78.27, 147.43),
            vector4(931.24, -28.27, 78.27, 148.17),
            vector4(911.98, -15.91, 78.27, 148.59),
            vector4(908.33, -14.25, 78.27, 151.66),
            vector4(905.28, -11.85, 78.27, 146.75),
            vector4(901.6, -10.25, 78.27, 151.03),
            vector4(898.56, -7.47, 78.27, 150.42),
            vector4(894.74, -5.36, 78.27, 147.31),
            vector4(878.41, 5.09, 78.27, 148.03),
            vector4(874.81, 6.34, 78.27, 145.35),
            vector4(872.04, 8.2, 78.27, 147.69),
            vector4(857.52, -16.84, 78.27, 61.37),
            vector4(855.4, -18.91, 78.27, 56.95),
            vector4(853.22, -21.71, 78.27, 58.03),
            vector4(851.4, -24.62, 78.27, 56.48),
            vector4(849.71, -27.73, 78.27, 56.12),
            vector4(848.46, -30.95, 78.27, 58.58),
            vector4(846.43, -33.78, 78.27, 58.11),
            vector4(844.31, -36.58, 78.27, 58.6),
            vector4(851.99, -41.32, 78.27, 237.04),
            vector4(854.14, -38.45, 78.27, 237.84),
            vector4(855.52, -35.12, 78.27, 239.77),
            vector4(857.58, -32.6, 78.27, 237.61),
            vector4(859.49, -29.77, 78.27, 238.44),
            vector4(860.76, -26.41, 78.27, 239.23),
            vector4(862.82, -23.64, 78.27, 238.93),
            vector4(864.37, -20.41, 78.27, 237.61),
            vector4(867.05, -18.08, 78.27, 237.15),
            vector4(868.52, -15.1, 78.27, 236.79),
            vector4(870.25, -12.23, 78.27, 236.92),
            vector4(871.96, -9.18, 78.27, 236.79),
            vector4(860.59, -50.52, 78.27, 56.19),
            vector4(862.21, -47.59, 78.27, 57.87),
            vector4(864.07, -44.72, 78.27, 57.35),
            vector4(866.09, -41.98, 78.27, 59.81),
            vector4(868.02, -39.09, 78.27, 58.16),
            vector4(869.38, -35.99, 78.27, 59.41),
            vector4(871.76, -33.27, 78.27, 57.79),
            vector4(873.26, -30.41, 78.27, 58.11),
            vector4(875.5, -27.57, 78.27, 59.75),
            vector4(876.7, -24.3, 78.27, 55.59),
            vector4(878.68, -21.55, 78.27, 55.73),
            vector4(880.83, -18.82, 78.27, 58.7),
            vector4(882.29, -15.94, 78.27, 59.44),
            vector4(868.59, -55.55, 78.27, 239.79),
            vector4(870.31, -52.52, 78.27, 237.16),
            vector4(872.25, -49.62, 78.27, 238.25),
            vector4(873.82, -46.81, 78.27, 237.55),
            vector4(875.38, -43.64, 78.27, 240.61),
            vector4(877.57, -40.99, 78.27, 238.89),
            vector4(879.2, -37.86, 78.27, 239.24),
            vector4(881.32, -35.29, 78.27, 239.98),
            vector4(882.71, -32.06, 78.27, 239.47),
            vector4(884.88, -29.13, 78.27, 238.24),
            vector4(886.69, -26.11, 78.27, 238.21),
            vector4(888.29, -23.61, 78.27, 236.97),
            vector4(890.23, -20.25, 78.27, 237.91),
            vector4(879.01, -62.07, 78.27, 57.16),
            vector4(880.87, -59.46, 78.27, 56.4),
            vector4(882.31, -55.9, 78.27, 56.01),
            vector4(884.39, -53.05, 78.27, 55.15),
            vector4(886.74, -50.98, 78.27, 57.74),
            vector4(887.88, -47.3, 78.27, 56.18),
            vector4(889.9, -44.62, 78.27, 57.31),
            vector4(891.22, -41.1, 78.27, 56.82),
            vector4(893.37, -38.44, 78.27, 57.27),
            vector4(894.9, -35.5, 78.27, 57.88),
            vector4(896.66, -32.62, 78.27, 56.27),
            vector4(898.89, -29.89, 78.27, 59.62),
            vector4(900.59, -27.03, 78.27, 57.96),
            vector4(918.92, -38.5, 78.27, 57.96),
            vector4(917.27, -41.62, 78.27, 57.19),
            vector4(915.72, -44.57, 78.27, 58.35),
            vector4(913.25, -46.72, 78.27, 59.34),
            vector4(911.8, -50.19, 78.27, 58.27),
            vector4(909.86, -52.95, 78.27, 56.01),
            vector4(907.82, -56.09, 78.27, 58.75),
            vector4(906.64, -59.22, 78.27, 59.0),
            vector4(904.82, -62.24, 78.27, 58.09),
            vector4(902.76, -64.94, 78.27, 57.42),
            vector4(900.32, -67.77, 78.27, 60.95),
            vector4(898.92, -70.71, 78.27, 59.52),
            vector4(897.37, -73.94, 78.27, 60.01),
            vector4(905.41, -78.55, 78.27, 237.47),
            vector4(906.51, -75.4, 78.27, 239.08),
            vector4(908.51, -72.21, 78.27, 240.06),
            vector4(910.57, -69.75, 78.27, 239.33),
            vector4(912.5, -66.76, 78.27, 236.77),
            vector4(914.61, -63.85, 78.27, 236.27),
            vector4(916.47, -61.02, 78.27, 239.26),
            vector4(918.2, -57.97, 78.27, 239.18),
            vector4(919.83, -55.26, 78.27, 239.26),
            vector4(921.38, -52.13, 78.27, 239.95),
            vector4(923.46, -49.15, 78.27, 240.09),
            vector4(925.59, -46.6, 78.27, 238.16),
            vector4(925.88, -42.81, 78.27, 239.65),
            vector4(915.9, -84.07, 78.27, 56.96),
            vector4(917.48, -81.16, 78.27, 58.09),
            vector4(920.09, -78.3, 78.27, 55.86),
            vector4(927.69, -83.29, 78.27, 238.3),
            vector4(926.1, -86.14, 78.27, 236.23),
            vector4(924.0, -89.35, 78.27, 237.62),
        }
    },
  
    ['airportp'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-779.76104736328, -2023.2966308594),
                vector2(-775.14440917969, -2019.8140869141),
                vector2(-767.18334960938, -2012.3591308594),
                vector2(-760.70989990234, -2004.76171875),
                vector2(-756.01049804688, -1997.4604492188),
                vector2(-753.18353271484, -1990.4525146484),
                vector2(-751.64544677734, -1983.7036132812),
                vector2(-748.98046875, -1969.5380859375),
                vector2(-748.11468505859, -1967.5456542969),
                vector2(-746.72650146484, -1965.5721435547),
                vector2(-744.23596191406, -1963.4608154297),
                vector2(-739.22473144531, -1961.9007568359),
                vector2(-733.59368896484, -1962.0502929688),
                vector2(-729.30279541016, -1963.3483886719),
                vector2(-727.666015625, -1964.8414306641),
                vector2(-725.72021484375, -1966.9916992188),
                vector2(-714.04919433594, -2019.2927246094),
                vector2(-710.76025390625, -2032.8103027344),
                vector2(-707.01336669922, -2040.8115234375),
                vector2(-704.6533203125, -2044.3029785156),
                vector2(-703.19024658203, -2045.3291015625),
                vector2(-701.63171386719, -2045.6253662109),
                vector2(-699.74157714844, -2045.2917480469),
                vector2(-687.05395507812, -2039.5653076172),
                vector2(-685.76708984375, -2038.6518554688),
                vector2(-684.13092041016, -2036.3044433594),
                vector2(-672.29400634766, -2041.8348388672),
                vector2(-670.67193603516, -2043.4077148438),
                vector2(-665.39947509766, -2046.6591796875),
                vector2(-657.96466064453, -2048.1787109375),
                vector2(-655.55963134766, -2048.3508300781),
                vector2(-651.94177246094, -2047.6011962891),
                vector2(-649.02130126953, -2046.1932373047),
                vector2(-633.71252441406, -2030.9672851562),
                vector2(-631.34783935547, -2030.0726318359),
                vector2(-628.30303955078, -2030.5014648438),
                vector2(-616.89349365234, -2042.3790283203),
                vector2(-616.16394042969, -2045.1605224609),
                vector2(-617.02777099609, -2047.9118652344),
                vector2(-648.34002685547, -2079.3305664062),
                vector2(-652.69281005859, -2082.1706542969),
                vector2(-658.36376953125, -2083.3293457031),
                vector2(-671.02252197266, -2082.0708007812),
                vector2(-676.02673339844, -2082.1984863281),
                vector2(-684.85815429688, -2084.7019042969),
                vector2(-695.00408935547, -2087.8937988281),
                vector2(-701.19207763672, -2088.712890625),
                vector2(-703.89630126953, -2088.4221191406),
                vector2(-708.56176757812, -2085.2458496094),
                vector2(-713.30065917969, -2087.1435546875),
                vector2(-718.29937744141, -2082.3813476562),
                vector2(-724.05651855469, -2078.2341308594),
                vector2(-736.53204345703, -2071.5529785156),
                vector2(-746.24493408203, -2067.9118652344),
                vector2(-751.45703125, -2073.4653320312),
                vector2(-787.72106933594, -2037.2147216797)
            },
            ['minZ'] = 8.85,  -- min height of the parking zone
            ['maxZ'] = 10.10,  -- max height of the parking zone
        },
        label = "Airport Parking",
        showBlip = true,
        blipcoords = vector3(-796.86, -2024.85, 8.88),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false
    },
   
   
    ['impoundlot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(388.82, -1642.58),
            vector2(410.30, -1621.47),
            vector2(421.47, -1631.65),
            vector2(417.74, -1650.00),
            vector2(409.48, -1660.21),
            },

            debug = false,
        },
        label = "Impound Lot",
        showBlip = true,
        blipcoords = vector3(408.95, -1638.87, 28.86),
        blipName = "Impound Lot",
        blipNumber = 68,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Impound',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(410.44, -1636.35, 29.29, 226.82),
            vector4(408.39, -1638.65, 29.29, 228.55),
            vector4(-396.26, -1644.46, 29.29, 318.79),
            vector4(398.56, -1646.31, 29.29, 324.53),
            vector4(401.19, -1648.45, 29.29, 320.38),
            vector4(403.32, -1650.59, 29.29, 322.03),
            vector4(-132.01, -1170.05, 23.14, 90.24)
        }
    },
    ['police'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(427.85052490234, -1017.9293212891),
                vector2(428.14498901367, -1030.7161865234),
                vector2(459.05325317383, -1026.896484375),
                vector2(459.12948608398, -1012.3634033203),
                vector2(449.7737121582, -1012.4426879883),
                vector2(449.38006591797, -1011.4791870117),
                vector2(434.09115600586, -1011.4317016602),
                vector2(434.05737304688, -1013.9020996094),
                vector2(427.95745849609, -1013.9678344727)
            },
            ['minZ'] = 28.10,  -- min height of the parking zone
            ['maxZ'] = 30.97,  -- max height of the parking zone
        },
        label = "Police",
        showBlip = false,
        blipName = "Police",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency'},
        drawText = 'Parking',              --car, air, sea
        job = "police",
        debug = false,
        ['ParkingSpots'] = {
            vector4(449.57, -1024.85, 28.06, 5.95),
            vector4(446.04, -1025.62, 28.14, 5.18),
            vector4(442.53, -1025.66, 28.2, 6.39),
            vector4(438.8, -1025.99, 28.27, 7.28),
            vector4(435.41, -1026.74, 28.35, 3.84),
        }
    },
    ['policevinewood'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(635.9017944336, 22.776243209838),
                vector2(631.24255371094, 20.99640083313),
                vector2(577.78063964844, 37.087455749512),
                vector2(575.10681152344, 41.017986297608),
                vector2(593.0210571289, 39.446407318116)
            },
            ['minZ'] = 86.00,  -- min height of the parking zone
            ['maxZ'] = 98.0,  -- max height of the parking zone
        },
        label = "Vinewood Police Station",
        showBlip = false,
        blipName = "Police",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency'},
        drawText = 'Parking',              --car, air, sea
        job = "police",
        debug = false,
        ['ParkingSpots'] = {
            vector4(581.11, 38.73, 92.21, 265.09),
            vector4(586.74, 37.68, 91.64, 260.63),
            vector4(591.54, 36.7, 91.16, 256.37),
            vector4(597.57, 34.71, 90.54, 250.52),
            vector4(604.28, 32.61, 89.86, 251.49),
            vector4(609.33, 30.9, 89.33, 251.35),
            vector4(613.83, 29.36, 88.87, 251.19),
            vector4(619.65, 27.35, 88.26, 250.98),
            vector4(627.16, 24.64, 87.48, 247.88)
        }
    },
    ['mechanic'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(951.68, -957.14),
                vector2(962.64, -956.66),
                vector2(964.35, -983.87),
                vector2(952.43, -983.97),
                vector2(952.59, -974.13),
                vector2(958.69, -972.25),
                vector2(958.06, -962.33),
                vector2(951.12, -961.79)
            },
          
            debug = false,
        },
        label = 'LS Customs',
        type = 'job',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'LS Customs',
        job = 'mechanic',
        debug = false,
        ['ParkingSpots'] = {
            vector4(961.17, -979.94, 39.50, 0.54),
            vector4(957.55, -959.18, 39.50, 89.36)
        }
    
        
    },

    ['mechanic2'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-195.45, -1322.08),
                vector2(-195.45, -1326.74),
                vector2(-201.96, -1326.74),
                vector2(-201.96, -1322.09)
            },
          
            debug = false,
        },
        label = 'Bennys',
        type = 'job',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Bennys',
        job = 'mechanic',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-198.15, -1324.75, 31.13, 81.96)
        }
    
        
    },

    ['mechanic3'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-379.02, -149.47),
                vector2(-373.72, -146.41),
                vector2(-383.64, -128.34),
                vector2(-389.25, -131.06)
            },
          
            debug = false,
        },
        label = 'LS Customs North',
        type = 'job',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'LS Customs',
        job = 'mechanic',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-382.97, -137.68, 38.69, 298.26)
        }
    
        
    },
    
    ['cityhall'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-475.55926513672, -222.67430114746),
            vector2(-472.03475952148, -220.5464630127),
            vector2(-498.85870361328, -173.8444366455),
            vector2(-502.67169189454, -175.96449279786),
            },
            ['minZ'] = 35.0,  -- min height of the parking zone
            ['maxZ'] = 39.0,  -- max height of the parking zone
        },
        label = 'City Hall Parking',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(-475.26, -219.26, 36.05, 30.12),
            vector4(-478.26, -214.06, 36.21, 30.11),
            vector4(-481.41, -208.59, 36.37, 30.32),
            vector4(-484.34, -203.49, 36.52, 30.67),
            vector4(-487.17, -198.51, 36.67, 30.37),
            vector4(-490.26, -193.18, 36.83, 29.72),
            vector4(-493.21, -187.98, 36.99, 29.64),
            vector4(-496.19, -182.75, 37.14, 29.96),
            vector4(-499.21, -177.5, 37.3, 30.1),
        },
        debug = false
    },
    
    
    ['helipad'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-757.8896484375, -1469.876953125),
                vector2(-744.54223632812, -1480.4110107422),
                vector2(-733.07989501954, -1467.4460449218),
                vector2(-746.4605102539, -1456.0607910156)
            },
            ['minZ'] = 4.0,  -- min height of the parking zone
            ['maxZ'] = 8.0,  -- max height of the parking zone
        },
        label = 'Helipad',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Helipad',
        showBlip = true,
        blipName = "Helipad",
        blipNumber = 64,
        blipColor = 50,
        blipcoords = vector3(-745.61, -1468.57, 4.37),
        ["ParkingSpots"] = {
            vector4(-745.53, -1468.68, 5.0, 321.19)
        },
        ParkingDistance = 10.0,
        debug = false
    },
    ['shoreheli'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1774.4047851562, 3246.9484863281),
                vector2(1762.30859375, 3244.3928222656),
                vector2(1765.3605957031, 3231.908203125),
                vector2(1777.5689697266, 3235.4580078125)
            },
            ['minZ'] = 40.0,  -- min height of the parking zone
            ['maxZ'] = 46.0,  -- max height of the parking zone
        },
        label = 'Sandy Shores Helipad',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Sandy Shores Helipad',
        showBlip = true,
        blipName = 'Helipad',
        blipNumber = 64,
        blipColor = 50,
        blipcoords = vector3(1769.62, 3240.14, 42.01),
        ['ParkingSpots'] = {
            vector4(1769.62, 3240.14, 42.01, 60.44),
        },
        ParkingDistance = 100.0,
        debug = false
    },
    ['airdepot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1235.3253173828, -3378.4008789062),
                vector2(-1284.2642822266, -3350.1474609375),
                vector2(-1284.5589599609, -3350.7241210938),
                vector2(-1289.5042724609, -3348.0512695312),
                vector2(-1308.7587890625, -3382.4091796875),
                vector2(-1307.0877685547, -3383.8776855469),
                vector2(-1307.6185302734, -3385.4577636719),
                vector2(-1306.0087890625, -3386.4213867188),
                vector2(-1308.2755126953, -3391.1662597656),
                vector2(-1306.2180175781, -3392.1394042969),
                vector2(-1264.1188964844, -3420.0451660156),
                vector2(-1258.6077880859, -3412.1069335938),
                vector2(-1258.1317138672, -3412.4846191406),
                vector2(-1237.5152587891, -3387.8581542969),
                vector2(-1236.4268798828, -3387.1162109375),
                vector2(-1233.0942382812, -3380.8115234375),
                vector2(-1233.4357910156, -3380.13671875),
                vector2(-1235.1755371094, -3379.1962890625)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Air Depot',
        type = 'depot',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'AIR DEPOT',
        showBlip = true,
        blipName = 'Air Depot',
        blipNumber = 569,
        blipColor = 33,
        blipcoords = vector3(-1274.34, -3385.97, 13.94),
        ParkingDistance = 200.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1286.09, -3363.24, 14.54, 275.59),
            vector4(-1292.65, -3383.11, 14.54, 280.17),
            vector4(-1252.97, -3385.7, 14.54, 11.75),
            vector4(-1268.63, -3402.56, 14.54, 14.72),
            vector4(-1280.83, -3395.7, 14.54, 330.47),

        },
    },
    ['boathouse1'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(-778.9291381836, -1513.3040771484),
                vector2(-803.83276367188, -1521.1665039062),
                vector2(-816.67852783204, -1493.2373046875),
                vector2(-791.34436035156, -1481.7546386718)
            },
            ['minZ'] = 0.00,
            ['maxZ'] = 5.00
        },
        label = 'Boat House',
        type = 'public',
        vehicleCategories = {'boat'},
        drawText = 'BOAT HOUSE',
        showBlip = true,
        blipName = 'Boat House',
        blipNumber = 427,
        blipColor = 15,
        blipcoords = vector3(-784.84, -1498.33, 0.2),
        ParkingDistance = 20.0,
        SpawnDistance = 10.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-798.39, -1499.15, 0.37, 109.87),
            vector4(-797.47, -1506.73, 0.3, 114.49),
        },
        ExitWarpLocations = {
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        },
    },
    ['intairport'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-992.59680175781, -2949.84375),
                vector2(-1030.8975830078, -3016.2927246094),
                vector2(-1030.3382568359, -3016.5925292969),
                vector2(-1029.6291503906, -3017.0434570312),
                vector2(-1028.7434082031, -3018.0705566406),
                vector2(-1022.2585449219, -3021.5798339844),
                vector2(-1021.3436279297, -3020.5522460938),
                vector2(-1016.1632080078, -3023.6635742188),
                vector2(-1016.3262329102, -3024.7385253906),
                vector2(-966.09301757812, -3052.3435058594),
                vector2(-965.42352294922, -3051.1135253906),
                vector2(-961.01477050781, -3052.7600097656),
                vector2(-923.76300048828, -2978.2124023438)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Airport Hangar',
        type = 'public',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'Airport Hangar',
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 359,
        blipColor = 50,
        blipcoords = vector3(-930.23, -2995.38, 19.85),
        ParkingDistance = 100.0,
        SpawnDistance = 100.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-985.04, -2965.05, 14.55, 128.92),
            vector4(-964.84, -2974.78, 14.55, 125.92),
            vector4(-945.49, -2985.63, 14.55, 117.77),
            vector4(-967.17, -3034.71, 14.55, 14.16),
            vector4(-990.13, -3022.86, 14.55, 15.42),
            vector4(-1010.91, -3012.56, 14.55, 2.31),
            vector4(-968.09, -3004.59, 14.55, 62.25)
        },

    },
    ['Davissheriff'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(408.18, -1616.16),
                vector2(403.01, -1612.533),
                vector2(386.77, -1627.40),
                vector2(387.61, -1640.72),
                vector2(408.18, -1616.16)
            },
          
        },
        label = 'Sheriff Garage',
        type = 'job',
        job = "bcso",
        vehicleCategories = {'car', 'motorcycle', 'other', 'emergency'},
        drawText = 'Sheriff Garage',
        showBlip = false,
        blipName = 'Garage',
        blipNumber = 666,
        blipColor = 50,
        blipcoords = vector3(389.06, -1620.95, 29.29),
        ParkingDistance = 100.0,
        SpawnDistance = 100.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(395.50, -1626.57, 29.29, 42.72),
            vector4(397.26, -1623.96, 29.29, 43.00),
            vector4(399.40, -1621.58, 29.29, 48.83),
            vector4(401.14, -1619.11, 29.29, 47.14),
            vector4(403.52, -1617.11, 29.29, 37.82)
        },

    },
    
}

Config.HouseGarages = {} -- DO NOT TOUCH!

Garages = Config.Garages
HouseGarages = Config.HouseGarages
