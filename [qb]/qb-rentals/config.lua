Config = {}

Config.FuelExport = 'lj-fuel'

Config.Locations = {
    vehicle = {
        coords = vector4(109.9739, -1088.61, 28.302, 345.64),
        pedhash = `a_m_y_business_03`,
        spawnpoint = vector4(111.4223, -1081.24, 29.192, 340.0),
    },

    aircraft = {
        coords = vector4(-1686.57, -3149.22, 12.99, 240.88),
        pedhash = `s_m_y_airworker`,
        spawnpoint = vector4(-1631.59, -3103.83, 13.94, 330.1),
    },

    boat = {
        coords = vector4(1224.59, 2727.90, 36.99, 180.90),
        pedhash = `a_m_y_business_03`,
        spawnpoint = vector4(1209.37, 2720.73, 38.0, 176.58),
    },
}

Config.Blips = {
    {title= Lang:t("info.land_veh"), colour= 50, id= 56, x= 111.0112, y= -1088.67, z= 29.302},
    {title= Lang:t("info.air_veh"), colour= 32, id= 578, x= -1673.39, y= -3158.45, z= 13.99},
    {title= Lang:t("info.sea_veh"), colour= 50, id= 56, x= 1224.59, y= 2727.90, z= 5.02}, 
}

Config.Vehicles = {
    land = {
        [1] = {
            model = 'futo',
            money = 600,
        },
        [2] = {
            model = 'bison',
            money = 800,
        },
        [3] = {
            model = 'sanchez',
            money = 750,
        },
    },
    air = {
        [1] = {
            model = 'seasparrow',
            money = 7500,
        },
        [2] = {
            model = 'frogger2',
            money = 9500,
        },
        [3] = {
            model = 'swift',
            money = 11000,
        },
    },
    sea = {
        [1] = {
            model = 'futo',
            money = 600,
        },
        [2] = {
            model = 'bison',
            money = 800,
        },
        [3] = {
            model = 'sanchez',
            money = 750,
        },
    },
}