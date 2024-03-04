Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.Jobs = {
    ["electrician"] = "Electrician"
}

Config.Uniforms = {
    ['male'] = {
        outfitData = {
            ['t-shirt'] = { item = 15, texture = 0 },
            ['torso2'] = { item = 345, texture = 0 },
            ['arms'] = { item = 19, texture = 0 },
            ['pants'] = { item = 3, texture = 7 },
            ['shoes'] = { item = 1, texture = 0 },
        }
    },
    ['female'] = {
        outfitData = {
            ['t-shirt'] = { item = 14, texture = 0 },
            ['torso2'] = { item = 370, texture = 0 },
            ['arms'] = { item = 0, texture = 0 },
            ['pants'] = { item = 0, texture = 12 },
            ['shoes'] = { item = 1, texture = 0 },
        }
    },
}

Config.Locations = {
    jobs = {
        ["electrician"] = {
            [1] = {
                coords = vector4(1714.37, 2532.66, 45.55, 28.16),
            },
            [2] = {
                coords = vector4(1657.67, 2489.04, 45.55, 142.91),
            },
            [3] = {
                coords = vector4(1617.24, 2528.16, 45.55, 82.17),
            },
            [4] = {
                coords = vector4(1652.52, 2564.31, 45.55, 3.74),
            },
            [5] = {
                coords = vector4(1689.80, 2565.67, 45.55, 358.47),
            },
            [6] = {
                coords = vector4(1763.45, 2565.75, 45.55, 1.67),
            },
            [7] = {
                coords = vector4(1775.28, 2553.62, 45.55, 272.64),
            }
        }
    },
    ["freedom"] = {
        coords = vector4(1827.67, 2580.22, 46.01, 319.38)
    },
    ["outside"] = {
        coords = vector4(1837.12, 2591.28, 46.01, 186.08)
    },
    ["yard"] = {
        coords = vector4(1733.58, 2522.46, 45.55, 262.52)
    },
    ["middle"] = {
        coords = vector4(1693.33, 2569.51, 44.55, 123.5)
    },
    ["shop"] = {
        coords = vector4(1780.66, 2560.78, 44.67, 179.97)
    },
    spawns = {
        [1] = {
            coords = vector4(1773.14, 2482.62, 45.82, 40.05)
        },
        [2] = {
            coords = vector4(1766.79, 2479.07, 45.82, 30.57)
        },
        [3] = {
            coords = vector4(1760.70, 2475.86, 45.81, 31.18)
        },
        [4] = {
            coords = vector4(1754.93, 2472.33, 45.81, 30.73)
        },
        [5] = {
            coords = vector4(1742.94, 2487.56, 45.82, 211.88)
        },
        [6] = {
            coords = vector4(1746.14, 2489.26, 45.82, 205.07)
        },
        [7] = {
            coords = vector4(1749.16, 2490.85, 45.82, 212.47)
        },
        [8] = {
            coords = vector4(1752.21, 2492.52, 45.82, 198.34)
        },
        [9] = {
            coords = vector4(1755.05, 2494.73, 45.82, 213.19)
        },
        [10] = {
            coords = vector4(1761.04, 2498.14, 45.82, 208.94)
        },
        [11] = {
            coords = vector4(1763.93, 2500.00, 45.82, 223.47)
        }
    }
}

Config.CanteenItems = {
    [1] = {
        name = "sandwich",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 1
    },
    [2] = {
        name = "water_bottle",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 2
    }
}
