Config = Config or {}
Lang = Lang or {}

Config.QBCoreName = 'qb-core'
Config.QBTargetName = 'qb-target'
Config.LegacyFuelName = 'ps-fuel'
Config.QBRadialMenuName = 'qb-radialmenu'
Config.UseMinigame = false
Config.DebugPoly = false
Config.NeededPolice = 0
Config.MachineProp = 'prop_bandsaw_01'
Config.RemovePartTime = 7500
Config.DestroyPartTime = 7500
Config.MinigameTime = 20
Config.MinigameCircles = 2
Config.TuckModel = 'flatbed'
Config.Payment = math.random(200, 500)
Config.TruckComission = 200
Config.MoneyType = 'cash'

Config.Zones = {
    SScrap = {
        PolyCoords = vector3(2384.63, 3113.56, 48.15),
        PolyLenght = 150,
        PolyWidth = 150,
        PolyHeading = 0,
        MachineCoords = vector4(2338.27, 3038.1, 48.15, 251.22),
        TruckPedCoords = vector3(2373.79, 3067.23, 46.15),
        PedHeading = 313.04,
        TruckSpawnCoords = vector4(2352.39, 3036.26, 48.15, 8.87),
        PedAnimation = 'WORLD_HUMAN_SMOKING',
        PedModel = 'a_m_m_beach_01',
    },
    PltScrap = {
        PolyCoords = vector3(1439.7, 6349.54, 23.97),
        PolyLenght = 50,
        PolyWidth = 50,
        PolyHeading = 0,
        MachineCoords = vector4(1418.85, 6355.16, 23.99, 264.89),
        TruckPedCoords = vector3(1417.15, 6359.55, 23.0),
        PedHeading = 145.42,
        TruckSpawnCoords = vector4(1431.41, 6334.68, 23.99, 8.94),
        PedAnimation = 'WORLD_HUMAN_SMOKING',
        PedModel = 'a_m_m_beach_01',
    },
    CityScrap = {
        PolyCoords = vector3(1516.51, -2132.82, 77.67),
        PolyLenght = 50,
        PolyWidth = 50,
        PolyHeading = 0,
        MachineCoords = vector4(1508.7, -2135.73, 76.51, 267.44),
        TruckPedCoords = vector3(1520.43, -2137.98, 75.86),
        PedHeading = 182.46,
        TruckSpawnCoords = vector4(1551.7, -2139.91, 77.46, 177.64),
        PedAnimation = 'WORLD_HUMAN_SMOKING',
        PedModel = 'a_m_m_beach_01',
    },
}

Config.Rewards = {
    Bonnet = {
        ItemsPerTime = math.random(2, 5),
        Items = {
            [1] = { ItemName = 'plastic', ItemAmount = math.random(5, 15) },
            [2] = { ItemName = 'aluminum', ItemAmount = math.random(5, 15) },
        },
    },
    Tire = {
        ItemsPerTime = math.random(2, 5),
        Items = {
            [1] = { ItemName = 'rubber', ItemAmount = math.random(5, 15) },
            [2] = { ItemName = 'plastic', ItemAmount = math.random(5, 15) },
        },
    },
    Door = {
        ItemsPerTime = math.random(2, 5),
        Items = {
            [1] = { ItemName = 'aluminum', ItemAmount = math.random(5, 15) },
            [2] = { ItemName = 'iron', ItemAmount = math.random(5, 15) },
            [3] = { ItemName = 'plastic', ItemAmount = math.random(5, 15) },
        },
    },
    Trunk = {
        ItemsPerTime = math.random(2, 5),
        Items = {
            [1] = { ItemName = 'rubber', ItemAmount = math.random(5, 15) },
            [2] = { ItemName = 'iron', ItemAmount = math.random(5, 15) },
            [3] = { ItemName = 'plastic', ItemAmount = math.random(5, 15) },
        },
    },
}

Config.DeliveryLocations = {
    [1] = { Coords = vector4(477.63, -1278.46, 29.54, 220.27) },
    [2] = { Coords = vector4(1121.18, -790.24, 57.74, 356.83) },
    [3] = { Coords = vector4(531.59, -180.3, 54.33, 145.27) },
    [4] = { Coords = vector4(1179.92, 2650.95, 37.81, 321.16) },
}

Config.BlacklistedVehicles = {
    [1] = 'flatbed',
}

Lang = {
    UseMachine = 'Use Machine',
    RemoveTire = 'Remove Tire 1',
    RemoveTire2 = 'Remove Tire 2',
    RemoveTire3 = 'Remove Tire 3',
    RemoveTire4 = 'Remove Tire 4',
    RemoveBonnet = 'Remove Bonnet',
    RemoveTrunk = 'Remove Trunk',
    RemoveDoor = 'Remove Door 1',
    RemoveDoor2 = 'Remove Door 2',
    RemoveDoor3 = 'Remove Door 3',
    RemoveDoor4 = 'Remove Door 4',
    RemovingVehiclePart = 'REMOVING VEHICLE PART...',
    RemovingVehicleTire = 'REMOVING VEHICLE TIRE...',
    DestruingPart = 'DESTRUING VEHICLE PART...',
    NeededPolice = 'Needed more police to make thins...',
    VehicleOwned = 'This vehicle is owned!',
    TakeTruck = 'Ask for a truck',
    VehicleNotConnected = 'Vehicle not connected!',
    TowingVehicle = 'TOWING VEHICLE...',
    VehicleTowed = 'Vehicle Towed!',
    Failed = 'Failed!',
    UntowingVehicle = 'UNTOWING VEHICLE...',
    VehicleUntowed = 'Vehicle Untowed!',
    NotTowingVehicle = 'Not Towing Vehicle',
    EToTow = 'Select the vehicle you want to tow and press [E]',
    EButtom = '[E] - Dilivery Vehicle',
    DeleteTruck = 'Delete Truck',
    CantInteract = 'Someone is already interacting with this vehicle...',
    VehicleBlacklisted = 'This vehicle cant be dismantled',
}