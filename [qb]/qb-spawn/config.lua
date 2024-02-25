QB = {}

QB.Spawns = {
    ["legion"] = {
        coords = vector4(195.17, -933.77, 29.7, 144.5),
        location = "legion",
        label = "Legion Square",
        pos = {top = 46, left = 60}
    },
    ["sheriffdp"] = {
        coords = vector4(361.89, -1578.45, 29.29, 313.10),
        location = "sheriffdp",
        label = "Sheriff Department",
        pos = {top = 48, left = 63}
    },
    ["policedp"] = {
        coords = vector4(-558.05, -142.23, 38.42, 256.69),
        location = "policedp",
        label = "Police Department",
        pos = {top = 47, left = 61}
    },
    ["paleto"] = {
        coords = vector4(80.35, 6424.12, 31.67, 45.5),
        location = "paleto",
        label = "Paleto Bay",
        pos = {top = 42, left = 7}
    },

    ["motel"] = {
        coords = vector4(-3238.03, 1013.9, 12.26, 268.43),
        location = "motel",
        label = "Barbareno Road",
        pos = {top = 86, left = 46}
    },
    ["sandy"] = {
        coords = vector4(2050.31, 3727.03, 32.91, 219.25),
        location = "sandy",
        label = "Sandy Shores",
        pos = {top = 22, left = 29},
    },
}

QB.SpawnAccess = { --To disable the buttons
    ['apartments'] = false,
    ['houses'] = true,
    ['lastLoc'] = true,
}