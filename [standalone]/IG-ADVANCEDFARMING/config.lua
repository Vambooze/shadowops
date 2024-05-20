Config = Config or {}

Config = {
    ["Main"] = {
        ["SANDWICH"] = { -- item name
            itemName = "sandwich", -- item name
            label = "sandwich", -- item label
            level = 0, -- amount of level requeried
            craftingTime = 3000, -- 1000 = 1 second
            points = 5, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- required items
                [1] = {
                    item = "apple",
                    amount = 1,
                },
                [2] = {
                    item = "corncob",
                    amount = 1,
                },
            }
        },
        ["Slicepie"] = { -- item name
            itemName = "slicedpie", -- item name
            label = "slice of pie", -- item label
            level = 0, -- amount of level requeried
            craftingTime = 3000, -- 1000 = 1 second
            points = 5, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- required items
                [1] = {
                    item = "apple",
                    amount = 1,
                },
            }
        },
        ["Cookie"] = { -- item name
            itemName = "tosti", -- item name
            label = "Cookie", -- item label
            level = 0, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 70, -- chance to to success craft
            type = 'item',
            items = { -- required items
                [1] = {
                    item = "apple",
                    amount = 1,
                },
            }
        },
    },
    ['MainLocation'] = {
        ['UseLocation'] = true,
        ['Location'] = vector3(-267.53, -952.6, 75.84),
    },
    ['Logs'] = {
        ['UseLogs'] = true,
    },
    ['GenerateSerialNumberAtWeapons'] = true,
}
Config.UseBlips = true
Config.inventory = "<img src=nui://lj-inventory/html/images/"
Config.levelrequired = false

Lang = {
    ['craftSuccess'] = 'Cooked ',
    ['craftFailed1'] = 'You failed the cook and lost ',
    ['craftFailed2'] = 'You failed the cook...',
    ['points'] = ' points...',
    ['crafting'] = 'Cooking ',
    ['menuHeader'] = 'Cooking Menu',
    ['errorRightItems'] = 'You do not have the right items...',
    ['targetLabel'] = 'COOK',
    ['pointsCommand1'] = 'You have ',
    ['pointsCommand2'] = ' points!',
    ['targetPoints'] = 'Check Points',
}

-- Pig Farm (Food)

Config.PigFood = 5                                      -- Food Amount (Pig Food)
Config.FoodPrice = 5                                    --  Pig Farm Food Price
PigFarmer = vector4(2166.11, 5003.84, 40.39, 312.56)    -- Ped Location
PigFarmerTargetZone = vector3(2166.11, 5003.84, 40.39)  -- QB-Target location
PigFarmerTzHeading = 305                                -- QB-Target Heading
PigFarmerMinZ = 40				                    	-- QB-Target MinZ
PigFarmerMaxZ = 42				                    	-- QB-Target MaxZ

-- Processing Items
Config.AppleProcessing = 3                              -- Trading Amount
Config.BeefProcessing = 2
Config.BaconProcesing = 3
Config.HamProcessing = 2
Config.PorkProcessing = 1
Config.SausageProcessing = 2
Config.MilkProcessing = 2
Config.PumpkinProcessing = 1
Config.CornProcessing = 2
Config.GrapeProcessing = 3
Config.ChillyProcessing = 3
Config.TomatoesProcessing = 4

-- Alert Notification
Config.Alerts = {
    ['cancel'] = 'Cancelled',
    ['weapon'] = 'You don\'t have a knife to do this',
    ['itemamount'] = 'You are trying to process a amount that is invalid try again!',
    ['apple_pickingbar'] = 'Picking Apples',
    ['apple_progressbar'] = 'Making Juice',
	['apple_pickingfront'] = 'You picked ',
    ['apple_pickingend'] = ' apples from the tree',
    ['apple_processing'] = 'You are processing ' ..Config.AppleProcessing.. ' amount of apples',
    ['error_appleprocessor'] = 'Hm, It seems like you don\'t have any apples to process... Come back later!',
    ['cow_milking'] = 'Milking The Cow',
    ['emptybucket'] = 'You don\'t have a empty bucket',
    ['killing_cow'] = 'Slaughtering Cow',
    ['error_rawmeat'] = 'Hm, It looks like you don\'t have any raw meat to process... Come back later!',
    ['cow_processbar'] = 'Cooking cow beef',
    ['cow_processing'] = 'You cooked ' ..Config.BeefProcessing.. ' raw cow beef',
    ['cow_dairyprocessorbar'] = 'Trading Raw Milk',
    ['milk_processing'] = 'You are processing ' ..Config.MilkProcessing.. ' buckets of raw milk',
    ['error_milkprocessor'] = 'It looks like you don\'t have any buckets of milk..',
    ['error_milklocation'] = 'Go to the Paleto Barn and milk the cows then come back!',
    ['picking_pumpkins'] = 'Picking Up Pumpkin',
    ['pumpkin_processingbar'] = 'Smashing Pumpkins',
    ['pumpkin_processing'] = 'Smashed ' ..Config.PumpkinProcessing,
    ['error_pumpkinsmashing'] = 'You don\'t have any pumpkins to smash',
    ['corn_picking'] = 'Picking Corn',
    ['corn_progressbar'] = 'Making Can Corn',
    ['corn_processing'] = 'Removed ' ..Config.CornProcessing.. ' corn',
    ['error_corncob'] = 'Seems like you don\'t have any corn cobs to process... Come Back Later!',
    ['grape_picking'] = 'Picking Grapes',
    ['grape_progressbar'] = 'Straining Grapes',
    ['grape_processing'] = 'Strained ' ..Config.GrapeProcessing.. ' grapes',
    ['error_grape'] = 'Hm, It seems like you don\'t have any grapes to process... Come back later!',
    ['greenpepper_picking'] = "Picking GreenPeppers",
    ['chillypepper_picking'] = 'Picking ChillyPeppers',
    ['chilly_hotsauce'] = 'Making Hot Sauce',
    ['chilly_processing'] = 'Crushed ' ..Config.ChillyProcessing.. ' chilly Peppers',
    ['error_chilly'] = 'Hm, It seems like you don\'t have any chilly peppers to process... Come back later!',
    ['tomatoes_picking'] = 'Picking Tomatoes',
    ['tomatoes_progressbar'] = 'Smashing Tomatoes',
    ['tomatoes_processing'] = 'Squeezed ' ..Config.TomatoesProcessing.. ' tomatoes',
    ['error_tomatoes'] = 'Hm, It seems like you don\'t have any tomatoes to process... Come back later!',
    ['bacon_progressbar'] = 'Cooking Bacon',
    ['error_bacon'] = 'Don\'t have any bacon to cook',
    ['ham_progressbar'] = 'Cooking Ham',
    ['error_ham'] = 'Don\'t have any ham to cook',
    ['pork_progressbar'] = 'Cooking Pork',
    ['error_pork'] = 'Don\'t have any pork to cook',
    ['sausage_progressbar'] = 'Cooking Sausage',
    ['error_sausage'] = 'Don\'t have any sausage to cook',
    ['killing_pig'] = 'Slaughtering Pig',
    ['pig_reward'] = 'Received items for killing the pig',
    ['error.soybean'] = 'You don\'t have any soybeans to feed the pigs',
    ['stress'] = 'Your Stress Was Relieved',
}
