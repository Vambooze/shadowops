-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['bcso'] = {
        vector3(364.43, -1583.07, 33.84),
    },
    ['ambulance'] = {
        vector3(197.25, -1658.61, 34.48),
    },
    ['realestate'] = {
        vector3(-716.11, 261.21, 84.14),
    },
    ['taxi'] = {
        vector3(894.96, -179.07, 74.7),
    },
    ['cardealer'] = {
        vector3(-27.47, -1107.13, 27.27),
    },
    ['mechanic'] = {
        vector3(951.28, -968.35, 39.51),
    },
}

Config.BossMenuZones = {
    ['bcso'] = {
        { coords = vector3(364.43, -1583.07, 33.84), length = 1.35, width = 1.45, heading = 215.73, minZ = 31.00, maxZ = 35.73 }, },
    ['ambulance'] = {
        { coords = vector3(197.25, -1658.61, 34.48), length = 1.2, width = 0.6, heading = 51.05, minZ = 32.13, maxZ = 35.73 },
    },
    ['realestate'] = {
        { coords = vector3(-716.11, 261.21, 84.14), length = 0.6, width = 1.0, heading = 25.0, minZ = 83.943, maxZ = 84.74 },
    },
    ['taxi'] = {
        { coords = vector3(894.96, -179.07, 74.7), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57 },
    },
    ['cardealer'] = {
        { coords = vector3(-27.47, -1107.13, 27.27), length = 2.4, width = 1.05, heading = 340.0, minZ = 27.07, maxZ = 27.67 },
    },
    ['mechanic'] = {
        { coords = vector3(-339.53, -156.44, 44.59), length = 1.15, width = 2.6, heading = 353.0, minZ = 43.59, maxZ = 44.99 },
    },
}

Config.GangMenus = {
    ['lostmc'] = {
        vector3(0, 0, 0),
    },
    ['ballas'] = {
        vector3(0, 0, 0),
    },
    ['vagos'] = {
        vector3(0, 0, 0),
    },
    ['trf'] = {
        vector3(1398.29, 1156.80, 114.33),
    },
    ['families'] = {
        vector3(0, 0, 0),
    },
}

Config.GangMenuZones = {
    
    ['trg'] = {
        { coords = vector3(1398.29, 1156.80, 114.33), length = 2.0, width = 2.0, heading = 100.24, minZ = 114.33, maxZ = 116.0 },
    },
    
}
