----<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- ☾ AMERICAN SCRIPT ☾ --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>--

Config = {}

Config.C4Tiempo = 5
Config.CooldownTime = 3600

-- items

Config.itemthermite = 'thermite' -- item used configurable
Config.itemexplote = 'c4' -- item used configurable
Config.itemdoor = 'laptop' -- item used configurable

-- rewards

Config.itemdinero = 'cash' -- item used configurable
Config.DineroAmount = math.random(233022, 370384)

Config.itemdoorreward = 'diamond' -- item used configurable
Config.ItemDoorRewardAmount = math.random(1, 5)

Config.itemdoorreward2 = 'cryptostick' -- item used configurable
Config.ItemDoorRewardAmount2 = math.random(1, 5)

Config.itemdoorreward3 = 'trojan_usb' -- item used configurable
Config.ItemDoorRewardAmount3 = math.random(1, 5)


-- DIAMONDS ROBBERY
Config.TrolleyItemDiamonds = 'diamond'
Config.TrolleyDiamondsMinAmount = 15
Config.TrolleyDiamondsMaxAmount = 30


--
--NPC
Config.PedGun = 'weapon_microsmg' -- weapon NPC's use

-- NPC coords
Config.Shooters = {
    ['soldiers'] = {
        locations = {
            [1] = { -- on Hack
                peds = {vector3(-441.0967, -2283.663, 7.5892052),vector3(-424.5576, -2287.049, 7.9640607),vector3(-408.0512, -2290.118, 8.0145864),vector3(-405.9308, -2289.056, 7.6388525),vector3(-396.625, -2276.319, 7.3599615),vector3(-391.8323, -2266.007, 7.3575539),vector3(-409.2817, -2259.536, 7.8293728),vector3(-397.5953, -2255.247, 7.8595333),vector3(-387.4986, -2264.95, 11.707324),vector3(-371.7243, -2275.896, 7.6637668),vector3(-378.4308, -2288.531, 7.4221553)}
            },
        },
    }
}


Config.Doors = {
	
	
----------------------------           PUERTAS BOBCAT ( ROBO NUEVO )          ----------------------------
	{
		textCoords = vector3(881.6171, -2264.669, 32.59156),
		authorizedJobs = { 'bcso' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		doors = {
			{
				objName = -551608542,
				objYaw = 174.87878417969,
				objCoords = vector3(881.6171, -2264.669, 32.59156),
			}
		}
	},
	            ---------------     PUERTA CHICA HACK ( LUGAR ESCONDIDO ) 
	{
		textCoords = vector3(882.3368, -2295.273, 32.59156),
		authorizedJobs = { 'bcso' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		doors = {
			{
				objName = -311575617,
				objYaw = 354.86846923828,
				objCoords = vector3(882.3368, -2295.273, 32.59156),
			}
		}
	},
}



Config.doors = 1
Config.doortwos = 2


Config.MoneyTrolley = 350000

Config.ThermiteDoors = {
    [1] = {
        coords = vector3(373.97, 789.57, 187.15),
        ptfx = vector3(373.97, 789.57, 187.15),
        animation = vector4(373.97, 789.57, 187.15, 179.53),
    }
}

GrabGold = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'enter', 'enter_bag'},
        {'grab', 'grab_bag', 'grab_gold'},
        {'grab_idle', 'grab_idle_bag'},
        {'exit', 'exit_bag'},
    },
    ['scenes'] = {},
    ['scenesObjects'] = {}
}

LaptopAnimation = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s',
        'hei_prop_hst_laptop',
        'hei_prop_heist_card_hack_02'
    },
    ['animations'] = {
        {'hack_enter', 'hack_enter_bag', 'hack_enter_laptop', 'hack_enter_card'},
        {'hack_loop', 'hack_loop_bag', 'hack_loop_laptop', 'hack_loop_card'},
        {'hack_exit', 'hack_exit_bag', 'hack_exit_laptop', 'hack_exit_card'}
    },
    ['scenes'] = {},
    ['sceneObjects'] = {}
}