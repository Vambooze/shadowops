Config = Config or {}

Config.Language = "en" -- es, en
Config.Framework = 'qbcore' -- if you use this config rmeove AutoStart in your fxmanifest.lua
Config.MaxWeight = 1200000
----------------------------------------
-------- INVENTORY SYSTEMS -------------
----------------------------------------
Config.repairWeapons = true
Config.UseInvetoryComsumables = true -- config your items comsumables at inventory
Config.WeaponSystem = false -- If true, you need remove your qb-weapons
Config.CraftSystem = false -- Coming soon
----------------------------------------
----------------------------------------
----------------------------------------
Config.Progressbar = false -- false == 'default'  or ox_lib or esx_progressbar or  qb-progressbar (Your framework must be qbcore) or custom | If you use ox_lib you need uncome the line 12 in fxmanifest.lua
Config.spaceMigration = false
Config.DefaultOpenKey = "TAB"
Config.MaxInventoryWeight = 120000
Config.MaxInventorySlots = 40
Config.MenuSystem = "qb-menu" -- qb-menu or esx_menu_default
Config.MoneyName = 'cash' -- money or cash
Config.ShopMoney = "cash" -- bank or money or cash
Config.ShopCashorBank = false -- if true, check money in inventory if not money in inventory check in bank || if false, check money in bank
Config.IntervalSave = 0.15 -- stash
Config.accounts = { --- config acount money ESX
    ['money'] = true,
    ['black_money'] = true,
    ['cash'] = false
}
Config.ScriptsUse = {
    reepWeed = false,
}

Config.DefaultTrunkMaxWeight = 60000
Config.DefaultTrunkSlots = 35

Config.TrunkSpace = {
    [0] = {30, 38000},
    [1] = {40, 50000},
    [2] = {50, 75000},
    [3] = {35, 42000},
    [4] = {30, 38000},
    [5] = {25, 30000},
    [6] = {25, 30000},
    [7] = {25, 30000},
    [8] = {15, 15000},
    [9] = {35, 60000},
    [12] = {35, 120000},
}


Config.SaveStashDecay = true


BackEngineVehicles = {
    'ninef',
    'adder',
    'vagner',
    't20',
    'infernus',
    'zentorno',
    'reaper',
    'comet2',
    'comet3',
    'jester',
    'jester2',
    'cheetah',
    'cheetah2',
    'prototipo',
    'turismor',
    'pfister811',
    'ardent',
    'nero',
    'nero2',
    'tempesta',
    'vacca',
    'bullet',
    'osiris',
    'entityxf',
    'turismo2',
    'fmj',
    're7b',
    'tyrus',
    'italigtb',
    'penetrator',
    'monroe',
    'ninef2',
    'stingergt',
    'surfer',
    'surfer2',
    'comet3',
}

Config.MaximumAmmoValues = { -- only info nui
    ["pistol"] = 250,
    ["smg"] = 250,
    ["shotgun"] = 200,
    ["rifle"] = 250,
}

Config.Benchs = {
    ["prop_tool_bench02_ld"] = 4,
    ["prop_tool_bench02"] = 9,
    ["gr_prop_gr_bench_01b"] = 15
}

Config.GiveDistance = 2.5

Config.Throwables = {
    ["weapon_grenade"] = true,
	["weapon_bzgas"] = true,
	["weapon_molotov"] = true,
	["weapon_stickybomb"] = true,
	["weapon_proxmine"] = true,
	["weapon_snowball"] = true,
	["weapon_pipebomb"] = true,
	["weapon_ball"] = true,
	["weapon_smokegrenade"] = true,
	["weapon_flare"] = true,
}


Config.HelpNotifyShow = function(message)
    exports['qb-core']:DrawText(message, 'left')
end

Config.HelpNotifyHide = function()
    exports['qb-core']:HideText()
end

-- Don't touch this
Lang = Lang[Config.Language]

Config.debug = {
    all = false, -- debug all
    load = false, -- debug load
    weapons = false, -- debug weapons
    consumables = false, -- debug consumables
    inventory = false, -- debug inventory
    trunk = false, -- debug trunk
    progress = false, -- debug progress
    shop = false, -- debug shop
    use = false, -- debug use
    additem = false, -- debug additem

}

function debuger(typ,...)
    if Config.debug and Config.debug[typ] or typ == 'all' then
        print ('[^1Origen Inventory]^0', ...)
        print ('^0')
    end
end