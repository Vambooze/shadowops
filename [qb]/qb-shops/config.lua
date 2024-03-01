Config = {}
Config.UseTruckerJob = false -- true = The shops stock is based on when truckers refill it | false = shop inventory never runs out
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)
Config.ShopsInvJsonFile = './json/shops-inventory.json' -- json file location

Config.SellCasinoChips = {
    coords = vector4(950.37, 34.72, 71.87, 33.82),
    radius = 1.5,
    ped = 's_m_y_casino_01'
}

-- optional requiredJob = {'police', 'ambulance'}
-- optional requiredGang = {'ballas', 'vagps'}
-- optional requiredLicense = {'driver', 'business', 'weapon'}

Config.Products = {
    ['normal'] = {
        {name = 'tosti',         price = 2,   amount = 50,   info = {}, type = 'item'},
        {name = 'water_bottle',  price = 2,   amount = 50,   info = {}, type = 'item'},
        {name = 'kurkakola',     price = 2,   amount = 50,   info = {}, type = 'item'},
        {name = 'twerks_candy',  price = 2,   amount = 50,   info = {}, type = 'item'},
        {name = 'snikkel_candy', price = 2,   amount = 50,   info = {}, type = 'item'},
        {name = 'sandwich',      price = 2,   amount = 50,   info = {}, type = 'item'},
        {name = 'beer',          price = 7,   amount = 50,   info = {}, type = 'item'},
        {name = 'whiskey',       price = 10,  amount = 50,   info = {}, type = 'item'},
        {name = 'vodka',         price = 12,  amount = 50,   info = {}, type = 'item'},
        {name = 'bandage',       price = 100, amount = 50,   info = {}, type = 'item'},
        {name = 'lighter',       price = 2,   amount = 50,   info = {}, type = 'item'},
        {name = 'rolling_paper', price = 2,   amount = 5000, info = {}, type = 'item'},
    },
    ['liquor'] = {
        {name = 'beer',    price = 7,  amount = 50, info = {}, type = 'item'},
        {name = 'whiskey', price = 10, amount = 50, info = {}, type = 'item'},
        {name = 'vodka',   price = 12, amount = 50, info = {}, type = 'item'},
    },
    ['hardware'] = {
        {name = 'lockpick',          price = 200, amount = 50,  info = {}, type = 'item'},
        {name = 'weapon_wrench',     price = 250, amount = 250, info = {}, type = 'item'},
        {name = 'weapon_hammer',     price = 250, amount = 250, info = {}, type = 'item'},
        {name = 'repairkit',         price = 250, amount = 50,  info = {}, type = 'item', requiredJob  = { 'mechanic', 'police' }},
        {name = 'screwdriverset',    price = 350, amount = 50,  info = {}, type = 'item'},
        {name = 'phone',             price = 850, amount = 50,  info = {}, type = 'item'},
        {name = 'radio',             price = 250, amount = 50,  info = {}, type = 'item'},
        {name = 'binoculars',        price = 50,  amount = 50,  info = {}, type = 'item'},
        {name = 'firework1',         price = 50,  amount = 50,  info = {}, type = 'item'},
        {name = 'firework2',         price = 50,  amount = 50,  info = {}, type = 'item'},
        {name = 'firework3',         price = 50,  amount = 50,  info = {}, type = 'item'},
        {name = 'firework4',         price = 50,  amount = 50,  info = {}, type = 'item'},
        {name = 'fitbit',            price = 400, amount = 150, info = {}, type = 'item'},
        {name = 'cleaningkit',       price = 150, amount = 150, info = {}, type = 'item'},
        {name = 'advancedrepairkit', price = 500, amount = 50,  info = {}, type = 'item', requiredJob = { 'mechanic' }},
    },
    ['weedshop'] = {
        {name = 'joint',          price = 10,  amount = 50,   info = {}, type = 'item'},
        {name = 'weapon_poolcue', price = 100, amount = 50,   info = {}, type = 'item'},
        {name = 'weed_nutrition', price = 20,  amount = 50,   info = {}, type = 'item'},
        {name = 'empty_weed_bag', price = 2,   amount = 1000, info = {}, type = 'item'},
        {name = 'rolling_paper',  price = 2,   amount = 1000, info = {}, type = 'item'},
    },
    ['gearshop'] = {
        {name = 'diving_gear', price = 2500, amount = 10, info = {}, type = 'item'},
        {name = 'jerry_can',   price = 200,  amount = 50, info = {}, type = 'item'},
    },
    ['burgershot'] = {
        {name = 'bleeder', price = 250, amount = 10, info = {}, type = 'item'},
        {name = 'heartstopper',   price = 200,  amount = 50, info = {}, type = 'item'},
        {name = 'softdrink',   price = 200,  amount = 50, info = {}, type = 'item'},
    },
    ['leisureshop'] = {
        {name = 'parachute',   price = 2500, amount = 10, info = {}, type = 'item'},
        {name = 'binoculars',  price = 50,   amount = 50, info = {}, type = 'item'},
        {name = 'diving_gear', price = 2500, amount = 10, info = {}, type = 'item'},
        {name = 'diving_fill', price = 500,  amount = 10, info = {}, type = 'item'},
    },
    ['weapons'] = {
        {name = 'weapon_knife',         price = 250,  amount = 250, info = {}, type = 'weapon'},
        {name = 'weapon_bat',           price = 250,  amount = 250, info = {}, type = 'weapon'},
        {name = 'weapon_hatchet',       price = 250,  amount = 250, info = {}, type = 'weapon'},
        {name = 'pistol_ammo',          price = 250,  amount = 250, info = {}, type = 'item',   requiredLicense = { 'weapon' }},
        {name = 'weapon_pistol',        price = 2500, amount = 5,   info = {}, type = 'weapon', requiredLicense = { 'weapon' }},
        {name = 'weapon_snspistol',     price = 1500, amount = 5,   info = {}, type = 'weapon', requiredLicense = { 'weapon' }},
    },
    ['casino'] = {
        {name = 'casinochips', price = 1, amount = 999999, info = {}, type = 'item'}
    },
}

Config.Locations = {
    -- 24/7 Locations
    ['247supermarket'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(24.47, -1346.62, 29.5, 271.66),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(26.45, -1315.51, 29.62, 0.07)
    },

    ['247supermarket2'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(-3039.54, 584.38, 7.91, 17.27),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-3047.95, 590.71, 7.62, 19.53)
    },

    ['247supermarket3'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(-3242.97, 1000.01, 12.83, 357.57),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-3245.76, 1005.25, 12.83, 269.45)
    },

    ['247supermarket4'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(1728.07, 6415.63, 35.04, 242.95),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1741.76, 6419.61, 35.04, 6.83)
    },

    ['247supermarket5'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(1959.82, 3740.48, 32.34, 301.57),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1963.81, 3750.09, 32.26, 302.46)
    },

    ['247supermarket6'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(549.13, 2670.85, 42.16, 99.39),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(541.54, 2663.53, 42.17, 120.51)
    },

    ['247supermarket7'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(2677.47, 3279.76, 55.24, 335.08),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(2662.19, 3264.95, 55.24, 168.55)
    },

    ['247supermarket8'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(2556.66, 380.84, 108.62, 356.67),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(2553.24, 399.73, 108.56, 344.86)
    },

    ['247supermarket9'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(372.66, 326.98, 103.57, 253.73),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(379.97, 357.3, 102.56, 26.42)
    },

    -- LTD Gasoline Locations
    ['ltdgasoline'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(-47.02, -1758.23, 29.42, 45.05),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-40.51, -1747.45, 29.29, 326.39)
    },

    ['ltdgasoline2'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(-706.06, -913.97, 19.22, 88.04),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-702.89, -917.44, 19.21, 181.96)
    },

    ['ltdgasoline3'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(-1820.02, 794.03, 138.09, 135.45),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1829.29, 801.49, 138.41, 41.39)
    },

    ['ltdgasoline4'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(1164.71, -322.94, 69.21, 101.72),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1160.62, -312.06, 69.28, 3.77)
    },

    ['ltdgasoline5'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(1697.87, 4922.96, 42.06, 324.71),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1702.68, 4917.28, 42.22, 139.27)
    },

    -- Rob's Liquor Locations
    ['robsliquor'] = {
        ['label'] = 'Rob\'s Liqour',
        ['coords'] = vector4(-1221.58, -908.15, 12.33, 35.49),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1226.92, -901.82, 12.28, 213.26)
    },

    ['robsliquor2'] = {
        ['label'] = 'Rob\'s Liqour',
        ['coords'] = vector4(-1486.59, -377.68, 40.16, 139.51),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1468.29, -387.61, 38.79, 220.13)
    },

    ['robsliquor3'] = {
        ['label'] = 'Rob\'s Liqour',
        ['coords'] = vector4(-2966.39, 391.42, 15.04, 87.48),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-2961.49, 376.25, 15.02, 111.41)
      
    },

    ['robsliquor4'] = {
        ['label'] = 'Rob\'s Liqour',
        ['coords'] = vector4(1165.17, 2710.88, 38.16, 179.43),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1194.52, 2722.21, 38.62, 9.37)
    },

    ['robsliquor5'] = {
        ['label'] = 'Rob\'s Liqour',
        ['coords'] = vector4(1134.21, -982.49, 46.42, 278.66),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1129.73, -989.27, 45.97, 280.98)
    },

    -- Hardware Store Locations
    ['hardware'] = {
        ['label'] = 'Hardware Store',
        ['coords'] = vector4(45.68, -1749.04, 29.61, 53.13),
        ['ped'] = 'mp_m_waremech_01',
        ['scenario'] = 'WORLD_HUMAN_CLIPBOARD',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-wrench',
        ['targetLabel'] = 'Open Hardware Store',
        ['products'] = Config.Products['hardware'],
        ['showblip'] = true,
        ['blipsprite'] = 402,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(89.15, -1745.29, 30.09, 315.25)
    },

    ['hardware2'] = {
        ['label'] = 'Hardware Store',
        ['coords'] = vector4(2747.71, 3472.85, 55.67, 255.08),
        ['ped'] = 'mp_m_waremech_01',
        ['scenario'] = 'WORLD_HUMAN_CLIPBOARD',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-wrench',
        ['targetLabel'] = 'Open Hardware Store',
        ['products'] = Config.Products['hardware'],
        ['showblip'] = true,
        ['blipsprite'] = 402,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(2704.68, 3457.21, 55.54, 176.28)
    },

    ['hardware3'] = {
        ['label'] = 'Hardware Store',
        ['coords'] = vector4(-421.83, 6136.13, 31.88, 228.2),
        ['ped'] = 'mp_m_waremech_01',
        ['scenario'] = 'WORLD_HUMAN_CLIPBOARD',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-wrench',
        ['targetLabel'] = 'Hardware Store',
        ['products'] = Config.Products['hardware'],
        ['showblip'] = true,
        ['blipsprite'] = 402,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-438.25, 6146.9, 31.48, 136.99)
    },

    -- Ammunation Locations
    ['ammunation'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-661.96, -933.53, 21.83, 177.05),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-660.61, -938.14, 21.83, 167.22)
    },
    ['ammunation2'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(809.68, -2159.13, 29.62, 1.43),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(820.97, -2146.7, 28.71, 359.98)
    },
    ['ammunation3'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(1692.67, 3761.38, 34.71, 227.65),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(1687.17, 3755.47, 34.34, 163.69)
    },
    ['ammunation4'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-331.23, 6085.37, 31.45, 228.02),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-341.72, 6098.49, 31.32, 11.05)
    },
    ['ammunation5'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(253.63, -51.02, 69.94, 72.91),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(249.0, -50.64, 69.94, 60.71)
    },
    ['ammunation6'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(23.0, -1105.67, 29.8, 162.91),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = false,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-5.82, -1107.48, 29.0, 164.32)
    },
    ['ammunation7'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(2567.48, 292.59, 108.73, 349.68),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(2578.77, 285.53, 108.61, 277.2)
    },
    ['ammunation8'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-1118.59, 2700.05, 18.55, 221.89),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1127.67, 2708.18, 18.8, 41.76)
    },
    ['ammunation9'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(841.92, -1035.32, 28.19, 1.56),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(847.83, -1020.36, 27.88, 88.29)
    },
    ['ammunation10'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-1304.19, -395.12, 36.7, 75.03),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1302.44, -385.23, 36.62, 303.79)
    },
    ['ammunation11'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-3173.31, 1088.85, 20.84, 244.18),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-3183.6, 1084.35, 20.84, 68.13)
    },

    -- Casino Locations
    ['casino'] = {
        ['label'] = 'Diamond Casino',
        ['coords'] = vector4(978.46, 39.07, 74.88, 64.0),
        ['ped'] = 'csb_tomcasino',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-coins',
        ['targetLabel'] = 'Buy Chips',
        ['products'] = Config.Products['casino'],
        ['showblip'] = false,
        ['blipsprite'] = 617,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(972.6, 9.22, 81.04, 233.38)
    },

    ['casinobar'] = {
        ['label'] = 'Casino Bar',
        ['coords'] = vector4(968.13, 29.85, 74.88, 208.86),
        ['ped'] = 'a_m_y_smartcaspat_01',
        ['scenario'] = 'WORLD_HUMAN_VALET',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-wine-bottle',
        ['targetLabel'] = 'Open Casino Bar',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = false,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(937.16, 1.0, 78.76, 152.4)
    },

    -- Weedshop Locations
    ['weedshop'] = {
        ['label'] = 'Smoke On The Water',
        ['coords'] = vector4(-1168.26, -1573.2, 4.66, 105.24),
        ['ped'] = 'a_m_y_hippy_01',
        ['scenario'] = 'WORLD_HUMAN_AA_SMOKE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-cannabis',
        ['targetLabel'] = 'Open Weed Shop',
        ['products'] = Config.Products['weedshop'],
        ['showblip'] = true,
        ['blipsprite'] = 140,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1162.13, -1568.57, 4.39, 328.52)
    },

    -- Sea Word Locations
    ['seaword'] = {
        ['label'] = 'Sea Word',
        ['coords'] = vector4(-1687.03, -1072.18, 13.15, 52.93),
        ['ped'] = 'a_m_y_beach_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_IMPATIENT',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-fish',
        ['targetLabel'] = 'Sea Word',
        ['products'] = Config.Products['gearshop'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1674.18, -1073.7, 13.15, 333.56)
    },

    -- Restraunt Locations
    ['burgershot'] = {
        ['label'] = 'BurgerShot',
        ['coords'] = vector4(-1193.53, -894.37, 13.89, 341.62),
        ['ped'] = 'csb_burgerdrug',
        ['scenario'] = 'WORLD_HUMAN_STAND_IMPATIENT',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-burger',
        ['targetLabel'] = 'BurgerShot',
        ['products'] = Config.Products['burgershot'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1190.30, -887.87, 13.89, 214.15)
    },

    -- Leisure Shop Locations
    ['leisureshop'] = {
        ['label'] = 'Leisure Shop',
        ['coords'] = vector4(-1505.91, 1511.95, 115.29, 257.13),
        ['ped'] = 'a_m_y_beach_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-leaf',
        ['targetLabel'] = 'Open Leisure Shop',
        ['products'] = Config.Products['leisureshop'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-1507.64, 1505.52, 115.29, 262.2)
    },
}
