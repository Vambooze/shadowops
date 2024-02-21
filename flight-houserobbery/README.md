# Flight House Robbery

House Robbery Script - Flight Development

## Links

[Discord](https://discord.gg/dXzkPaRaq3)
[Tebex](https://fivem.flightdev.co)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)

## Installation

### Required Dependencies if you want to use the script as is

[Renewed qb-phone](https://github.com/Renewed-Scripts/qb-phone) (**Optional** For the pre-configured group system)
[Skill-System](**Optional** You will have to search for one that looks best to you)
[ps-dispatch](https://github.com/Project-Sloth/ps-dispatch) (For the pre-configured dispatch)
[ps-ui](https://github.com/Project-Sloth/ps-ui) (For the pre-configured minigame)
[pd-safe](https://github.com/VHall1/pd-safe) (For the pre-configured safe minigame)

-- ESX Frameworks:
[K4MBI-Shell](Free resource by K4MBI for default shells, if you don't have it, you need to download it, or you can download qb-interior, works with ESX)

### Add this to server.cfg

```lua
  ensure ox_lib -- This should be placed under ensure qb-core in your server.cfg, if you just downloaded it
  ensure qb-phone -- If you installed the group work system
  ensure Your Skill System -- If you installed a skill system
  ensure flight-houserobbery
```

```lua
 ["flight_artpiece"]     = {["name"] = "flight_artpiece",       ["label"] = "Art",       ["weight"] = 25000,  ["type"] = "item",   ["image"] = "flightartpiece.png",   ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Some fancy Art"},
 ["flight_television"]     = {["name"] = "flight_television",    ["label"] = "TV",       ["weight"] = 25000,  ["type"] = "item",   ["image"] = "flighttelevision.png",  ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Flat Screen TV"},
 ["musicequipment"]      = {["name"] = "musicequipment",     ["label"] = "Music Equipment",    ["weight"] = 25000,  ["type"] = "item",   ["image"] = "musicequipment.png",   ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Music Equipment"},
 ["pcequipment"]       = {["name"] = "pcequipment",      ["label"] = "Computer Equipment",   ["weight"] = 25000,  ["type"] = "item",   ["image"] = "flightpcequipment.png",    ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Computer Equipment"},
 ["microwave"]        = {["name"] = "microwave",         ["label"] = "Microwave",     ["weight"] = 25000,  ["type"] = "item",   ["image"] = "flightmicrowave.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Heats things up"},
 ["coffeemaker"]      = {["name"] = "coffeemaker",      ["label"] = "Coffee Machine",    ["weight"] = 25000,  ["type"] = "item",   ["image"] = "flightcoffeemaker.png",  ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Makes a delicious expresso"},
 ["flight_painting"]     = {["name"] = "flight_painting",       ["label"] = "Painting",        ["weight"] = 25000,  ["type"] = "item",   ["image"] = "flightpainting.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Just a work of art,"},
 ["flight_painting2"]     = {["name"] = "flight_painting2",     ["label"] = "Painting",        ["weight"] = 25000,  ["type"] = "item",   ["image"] = "flightpainting2.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Just a work of art,"},
 ["flight_guitar"]             = {["name"] = "flight_guitar",           ["label"] = "Guitar",           ["weight"] = 25000,   ["type"] = "item",    ["image"] = "flightguitar.png",         ["unique"] = true,    ["useable"] = false,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Music Equipment"},
 ["flight_suitcase"]             = {["name"] = "flight_suitcase",          ["label"] = "Suitcase",           ["weight"] = 25000,   ["type"] = "item",    ["image"] = "flightsuitcase.png",       ["unique"] = true,    ["useable"] = false,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Work Suitcase"},
```

### Renewed-Weaponscarry (Optional, **Not Required**) (QBCore Only)

[Renewed-Weaponscarry](https://github.com/Renewed-Scripts/Renewed-Weaponscarry)

### Items to add to the weapons-carry script (Thanks to Xandrice#0001)

-- House Robbery Items

```lua
    pcequipment = {
        model = 'prop_dyn_pc_02',
        bone = 24817,
        pos = vec3(0.09, 0.43, 0.05),
        rot = vec3(91.0, 0.0, -265.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    coffeemaker = {
        model = 'prop_coffee_mac_02',
        bone = 24817,
        pos = vec3(0.02, 0.43, 0.03),
        rot = vec3(91.0, 0.0, -265.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    flight_artpiece = {
        model = 'v_res_sculpt_decf',
        bone = 24817,
        pos = vec3(-0.25, 0.43, 0.00),
        rot = vec3(0.0, 90.0, 0.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    musicequipment = {
        model = 'prop_speaker_06',
        bone = 24817,
        pos = vec3(-0.10, 0.43, 0.05),
        rot = vec3(180.0, 0.0, -265.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    microwave = {
        model = 'prop_microwave_1',
        bone = 24817,
        pos = vec3(-0.20, 0.43, 0.05),
        rot = vec3(91.0, 0.0, -265.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    flight_suitcase = {
        model = 'prop_ld_suitcase_01',
        bone = 24817,
        pos = vec3(-0.10, 0.43, 0.05),
        rot = vec3(0.0, 90.0, 0.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    flight_television = {
        model = 'sm_prop_smug_tv_flat_01',
        bone = 24817,
        pos = vec3(-0.20, 0.43, 0.0),
        rot = vec3(0.0, -90.0, 180.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    flight_painting = {
        model = 'ch_prop_vault_painting_01c',
        bone = 24817,
        pos = vec3(-0.18, 0.43, 0.05),
        rot = vec3(180.0, 90.0, 0.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    flight_painting2 = {
        model = 'ch_prop_vault_painting_01d',
        bone = 24817,
        pos = vec3(-0.18, 0.43, 0.05),
        rot = vec3(180.0, 90.0, 0.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },

    flight_guitar = {
        model = 'sf_prop_sf_guitar_case_01a',
        bone = 24817,
        pos = vec3(-0.01, 0.50, 0.05),
        rot = vec3(90.0, 0.0, 0.0),
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },
```
