Config = Config or {}
-- changes this to nude clothes
Config.StandaloneClothings = {
    Shoes = {
        Male = 34,
        Female = 35 
    },
    Neck = {
        Male = 0,
        Female = 0
    },
    Vest = {
        Male = 0,
        Female = 0
    },
    Mask = {
        Male = 0,
        Female = 0
    },
    Shirt = {
        Male = 15,
        Female = 15
    },
    Pants = {
        Male = 61,
        Female = 15
    },
    Bagoff = {
        Male = 0,
        Female = 0
    }
}

Config.Commands = {
    ["top"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "top",
        Desc = "",
        Button = 1,
        Name = "top"
    },
    ["gloves"] = {
        Func = function() ToggleClothing("Gloves") end,
        Sprite = "gloves",
        Desc = "",
        Button = 2,
        Name = "Gloves"
    },
    ["visor"] = {
        Func = function() ToggleProps("Visor") end,
        Sprite = "visor",
        Desc = "",
        Button = 3,
        Name = "Visor"
    },
    ["bag"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "bag",
        Desc = "",
        Button = 8,
        Name = "Bag"
    },
    ["shoes"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "shoes",
        Desc = "",
        Button = 5,
        Name = "Shoes"
    },
    ["vest"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "vest",
        Desc = "",
        Button = 14,
        Name = "Vest"
    },
    ["hair"] = {
        Func = function() ToggleClothing("Hair") end,
        Sprite = "hair",
        Desc = "",
        Button = 7,
        Name = "Hair"
    },
    ["hat"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "hat",
        Desc = "",
        Button = 4,
        Name = "Hat"
    },
    ["glasses"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "glasses",
        Desc = "",
        Button = 9,
        Name = "Glasses"
    },
    ["ear"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "ear",
        Desc = "",
        Button = 10,
        Name = "Ear"
    },
    ["neck"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "neck",
        Desc = "",
        Button = 11,
        Name = "Neck"
    },
    ["watch"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "watch",
        Desc = "",
        Button = 12,
        Name = "Watch",
        Rotation = 5.0
    },
    ["bracelet"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bracelet",
        Desc = "",
        Button = 13,
        Name = "Bracelet"
    },
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "",
        Button = 6,
        Name = "Mask"
    },
	["bagoff"] = {
		Func = function() ToggleClothing("Bagoff", true) end,
		Sprite = "bagoff",
		Desc = "",
        Name = "Bag"
	},
	["pants"] = {
		Func = function() ToggleClothing("Pants", true) end,
		Sprite = "Pants",
		Desc = "",
        Name = "Pants"
	},
	["torso"] = {
		Func = function() ToggleClothing("Shirt", true) end,
		Sprite = "Torso",
		Desc = "",
        Name = "Torso"
	},
}