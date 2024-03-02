print("^2Jim^7-^2Recycle v^42^7.^45 ^7- ^2Recycling Script by ^1Jimathy^7")

Config = {
	Lan = "en",
	Debug = false, -- Toggle Debug Mode
	Blips = true, -- Enable Blips?
	BlipNamer = false, -- Enable to Name Blips different things, disable if you already have too many blips as this will group them together
	Pedspawn = true, -- Do you want to spawn peds for main locations?
	img = "qb-inventory/html/images/", -- Set this to your inventory
	JimMenu = true, -- If using updated qb-menu icons, set this true
	JobRole = nil, -- Whats the job role you want to use this? "nil" for none
	EnableOpeningHours = false, -- Enable opening hours? If disabled you can always open the pawnshop.
	OpenHour = 9, -- From what hour should the pawnshop be open?
	CloseHour = 21, -- From what hour should the pawnshop be closed?
	PayAtDoor = 5, -- Set to nil stop turn this off, set to a number to enable

	Minigame = "qb-skillbar", -- Enable minigame when searching. qb-skillbar/qb-lock/ps-ui

	OutsideTele = vector4(746.75518798828, -1399.5516357422, 26.609373092651, 180.86077880859),
	InsideTele = vector4(736.95355224609, -1374.2559814453, 12.635090827942, 266.58343505859),

	Locations =  {
		['Recycle'] = {
			{ name = "Recycle Center", coords = vector4(1515.78, -2137.36, 76.73, 191.97), blipTrue = false sprite = 365, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
		},
		['Trade'] ={
			{ name = "Recyclable Trader", coords = vector4(742.36309814453, -1373.9674072266, 12.631042480469, 234.4), blipTrue = true, sprite = 365, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
		},
		['BottleBanks'] = {
			{ name = "Bottle Bank", coords = vector4(2549.38, -315.24, 93.09, 175.72), blipTrue = true, sprite = 642, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
		},
	},
	Prices = {
		['copper'] = 8,
		['plastic'] = 5,
		['metalscrap'] = 7,
		['steel'] = 7,
		['glass'] = 5,
		['iron'] = 7,
		['rubber'] = 10,
		['aluminum'] = 8,
		['bottle'] = 10,
		['can'] = 10,
		['guncase'] = 250000,
	},
	TradeTable = {
		"copper",
		"plastic",
		"metalscrap",
		"steel",
		"glass",
		"iron",
		"rubber",
		"aluminum",
		"bottle",
		"can",
	},
	DumpItems = {
		"bottle",
		"can",
		"sandwich",
                
	},
	ScrapItems = {
		"steel",
		"copper",
		"iron",
		"glass",
		"bottle",
		"can",
	},
	RecycleAmounts = {
		recycleMin = 15,
		recycleMax = 30,

		tenMin = 5,
		tenMax = 10,

		hundMin = 25,
		hundMax = 50,

		thouMin = 50,
		thouMax = 150,
		
		fivethouMin = 150,
		fivethouMax = 300,
		
		tenthouMin = 300,
		tenthouMax = 600,
	}
}

Loc = {}
