# LC-Ammunation

A detailed, player owned ammunation script

Make sure to join the discord for support https://discord.gg/VbArb64C56




## Features

- Renewed-Banking Support
- QB-Management Support
- Set Worker Comission
    - Worker Comissions Rate
    - Business Comission Rate
- Set Max Bill (So workers dont bill people silly amounts)
- As Many Ammunations as you want
- Configurable Stash
- Stock Pickup Job (Fully Configurable)
- Weapon Crafting (Fully Configurable)
- Sales (View Stock Count)
- License Check (Optional)
- Weapon Showcase (Show weapons in game to all customers)
- Employee Store


## Installation

Go to QB-Core/Shared/Items.lua and add these items in

```
		
	["pistol_parts"] 	= {["name"] = "pistol_parts", 	["label"] = "Pistol Parts", 	["weight"] = 500, 	["type"] = "item", 		["image"] = "pistol_parts.png", 	["unique"] = false, ["useable"] = false, ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Pistol Parts"},
	["smg_parts"] 		= {["name"] = "smg_parts", 		["label"] = "SMG Parts", 		["weight"] = 500, 	["type"] = "item", 		["image"] = "smg_parts.png", 		["unique"] = false, ["useable"] = false, ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "SMG Parts"},
	["shotgun_parts"] 	= {["name"] = "shotgun_parts", 	["label"] = "Shotgun Parts",	["weight"] = 500, 	["type"] = "item", 		["image"] = "shotgun_parts.png", 	["unique"] = false, ["useable"] = false, ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Shotgun Parts"},
	["rifle_parts"] 	= {["name"] = "rifle_parts", 	["label"] = "Rifle Parts", 		["weight"] = 500, 	["type"] = "item", 		["image"] = "rifle_parts.png", 		["unique"] = false, ["useable"] = false, ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Rifle Parts"},


```
Make sure to copy the images over to your inventory location too.


## Job Setup
Next we need to setup the jobs.
Depending on how many player owned shops you want this will be different. Here is a basic template, you are free to name these whatever you want (Will link to a shop in the config file.)

QB-Management
```
["ammunation1"] = {
		label = "Ammunation Employee",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 100
            },
			['1'] = {
                name = "Employee",
                payment = 130
            },
			['2'] = {
                name = "CEO",
				isboss = true,
                payment = 200,
            },
        },
	},
```
If using renewed banking you want it like this
```
["ammunation1"] = {
		label = "Ammunation Employee",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 100
            },
			['1'] = {
                name = "Employee",
                payment = 130
            },
			['2'] = {
                name = "CEO",
				isboss = true,
                payment = 200,
                bankAuth = true
            },
        },
	},
```

If you use QB-Management (No Renewed Banking)
You will need to do this for each job replace the XXXXX with the job name
```sql
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES (NULL, 'XXXXX', '0', 'boss');
```

If you use RenewedBanking you will want to insert this into bank_accounts_new
```sql
INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES ('XXXXX', '0', '[]', '[]', '0', NULL);
```


To setup boss zones go to qb-management/client/cl_config

You will need to do this for each job you created replace XXXX with job name and the coordinates of where you want the management menu to be

Where it says Config.BossMenus =   
```
    ['XXXX'] = {
        vector3(INSERT COORDS HERE),
    },
```

Below that in Config.BossMenuZones add in

```
    ['XXXX'] = {
        { coords = vector3(INSERT COORDS HERE), length = 1.15, width = 2.6, heading = 353.0, minZ = XXXX, maxZ = XXXX },
    },
```
You will need to change the minz and maxz depending on your coords

Next is to go to the config, it is explained well in the config file. If you need help join the discord for support.