Config = Config or {}
Loc = {}

Config = {
    Framework = 'qb-core', -- 'qb-core' or 'esx' or 'standalone'
    Core = {resource = "qb-core", name = "QBCore", abbrev = "qb"}, -- (QBCore only) Change the name of the core
    EmoteMenu = "dpemotes", -- "dpemotes" or "rpemotes" or "scully", if you arent using any of these emote menus, put it as "other" and you will need to edit the emote export function, or open a ticket on discord.
    Inventory = "qb", -- "ox" or "qs" or "qb" or "esx" or "lj" or "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "ps", -- "ps" or "cd" or "qs", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.

    Target = 'qb-target', -- if you are using ox_target, leave it as 'qb-target'

    DiscordLogStatus = false, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    Minus1 = 0.0, -- Change to '0.5' if you are using ox_target otherwise, 0.0
    Lan = 'en', -- Language
    debug = false, -- Shows polyzones
    Cooldown = 15, -- (Minutes) This works both for normal robberies and group work robberies (0 = no cooldown)
    GlobalCooldown = {
        ["Status"] = false, -- If true, it will add a cooldown on the npc for all players when someone requests a house robbery
        ["Time"] = 15, -- (Minutes) How long the cooldown will be
    },
    WeaponsCarry = false, -- Put this as true only if you have Renewed-Weaponscarry downloaded (This will not allow players to search if they have an item in hand)
    CarryExportName = "Renewed-Weaponscarry", -- Name of the export for Renewed-Weaponscarry

    Interaction = { -- 'true' for Target interactions, 'false' for drawtext interactions
        ["Button"] = 38, -- [E] by default, change depending on used target
        ["NPC"] = true, -- 
        ["ExitIPL"] = true,
        ["LockPickIPL"] = true,
        ["EnterIPL"] = true,
        ["PropsIPL"] = true,
        ["FurnitureIPL"] = true,
        ["ExitShell"] = true,
        ["LockPickShell"] = true,
        ["FurnitureShell"] = true,
        ["EnterShell"] = true,
        ["Safe"] = true,
    },

    StressChance = 35, -- (%) Chance of gaining stress per action
    Stress = { -- Set status for Stress(on/off) and stress gained per action, turn them all to false, to fully disable it
        ["LockPickIPL"] = {status = true, gain = math.random(1, 4)},
        ["PropsIPL"] = {status = true, gain = math.random(1, 5)},
        ["FurnitureIPL"] = {status = true, gain = math.random(1, 3)},
        ["LockPickShell"] = {status = true, gain = math.random(1, 4)},
        ["FurnitureShell"] = {status = true, gain = math.random(1, 3)},
    },

    Drawtext = "OX", -- OLDQB for qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(1.5, 1.5, 2), -- Size of the drawtext zone

    MinimumHouseRobberyPolice = 0, -- Minimum police required to initiate a house robbery
    TimeFrame = {min = 20, max = 6}, -- Robbery time frame
    AutomaticallyResetHouse = 15, -- (Minutes) How long until the house resets automatically after someone enters

    -- Durations
    NotificationDurations = 5000, -- How long the notifications will be shown
    PropsFirstProgressbar = 8500, -- (Props) How long the first progressbar will take
    PropsSecondProgressbar = 8500, -- (Props) How long the second progressbar will take
    DrawersFirstProgressbar = 6000, -- (Searching) How long the first progressbar will take
    DrawersSecondProgressbar = 6000, -- (Searching) How long the second progressbar will take

    -- Icons
    ExitDoorIcon = 'fas fa-door-closed', -- Icon for the exit door
    EnterDoorIcon = 'fas fa-door-open', -- Icon for the enter door
    NpcIcon = 'fas fa-location-pin-lock', -- Icon for the npc
    -- Progressbar Icons, for individual icons, check the house configs themselves
    SearchIcon = 'fa-solid fa-hand-back-fist', -- Icon for the prop search
    DrawersSearchIcon = 'fas fa-hand-holding', -- Icon for the search
    
    -- Minigames
    LockShellCircleMinigame = {circles = {min = 4, max = 6}, seconds = {min = 6, max = 6}}, -- Minigame for lockpicking the shell
    LockIPLCircleMinigame = {circles = {min = 4, max = 6}, seconds = {min = 6, max = 6}}, -- Minigame for lockpicking the ipl
    SearchShellCircleMinigame = {circles = {min = 2, max = 3}, seconds = {min = 6, max = 10}}, -- Minigame for searching the shell
    SearchIPLCircleMinigame = {circles = {min = 4, max = 6}, seconds = {min = 6, max = 6}}, -- Minigame for searching the ipl

    -- Animations
    OpeningHouseAnimation = "keyfob", -- Animation for opening the house
    LockpickShellAnimation = "mechanic", -- Animation for lockpicking the shell
    LockpickIPLAnimation = "mechanic", -- Animation for lockpicking the ipl
    SearchShellAnimation = "mechanic", -- Animation for searching the shell
    SearchIPLAnimationStage1 = "mechanic", -- Animation for searching the ipl
    SearchIPLAnimationStage2 = "mechanic", -- Animation for searching the ipl
    PropSearchAnimationStage1 = "idle11", -- Animation for searching the prop
    PropSearchAnimationStage2 = "inspect", -- Animation for searching the prop
    SafeOpeningAnimation = "keyfob", -- Animation for opening the safe

    -- Lockpick
    LoseLockpickAnyway = 10, -- Chance of losing the lockpick after lockpicking the house
    LoseLockpick = 25, -- Chance of losing the lockpick if a player fails the lockpick minigame
    ToolOne = "lockpick", -- Item name of the first tool that can be used
    ToolTwo = "advancedlockpick", -- Item name of the second tool that can be used

    -- Stealth
    AddScoreWhenFailed = 10.0, -- (Set to 0 to turn off) Adds this amount to the stealth score if the player fails the minigame
    StealthScore = 300, -- If a player reaches this score, the alarm will be enabled (Increment to make it easier or decrement to make it harder)
    WearingShoes = 0.01, -- (Every step taken) Adds this amount to the stealth score if the player is wearing shoes every
    SilencedWeapon = 20.0, -- (Every shot) Adds this amount to the stealth score if the player is using a silenced weapon
    Crouching = 0.001, -- (Every step taken) Adds this amount to the stealth score if the player is crouching
    Jumping = 20.0, -- (Every jump) Adds this amount to the stealth score if the player is jumping
    Sprinting = 1.5, -- (Every step taken) Adds this amount to the stealth score if the player is sprinting
    Running = 3.0, -- (Every step taken) Adds this amount to the stealth score if the player is running

    -- Evidence
    Evidence = {
        ["Status"] = true, -- Enable/disable evidence
        ["Chance"] = 50, -- Chance of having fingerprints
    },

    -- Group Work (If you want to use this, you need to have a group system)
    GroupWork = false, -- Enable/disable group work
    GroupMinimum = 1, -- Minimum players required to start a group work
    GroupLimit = 3, -- Max players that can be in a house robbery group to start a job
    IPLChance = 10, -- Chance of getting an ipl if you are using an NPC and no skill system

    -- For both non-group and group work systems
    Failed = 10, -- (Minutes) How long until the house gets unmarked

    -- Npc settings, works for both non-group work and group work
    NPCStatus = true, -- Enable/disable npc
    NpcModel = `g_m_m_chicold_01`, -- Model of the npc
    NpcCoords = vector4(116.34, -1953.83, 19.75, 41.11), -- Coords of the npc
    NpcTargetCoords = vector3(116.29, -1953.82, 20.75), -- Change this with the npc location
    NpcTargetMinZ = 19.5, -- Min Z of the npc target
    NpcTargetMaxZ = 21.5, -- Max Z of the npc target
    NpcAnimation = "WORLD_HUMAN_LEANING", -- Animation of the npc

    -- Skill System (If you want to use this, you need to have a skill system)
    SkillSystem = false, -- Enable/disable skill system
    ClientSideEvents = false, -- If false, it will use server side events, if true, it will use client side events for the skill system

    Level = { -- Those need to be changed depending on the levels you change per tier in each house
        ["ShellTier1"] = 5,
        ["ShellTier2"] = 10,
        ["ShellTier3"] = 15,

        ["IPLTier1"] = 25,
        ["IPLTier2"] = 45,
        ["IPLTier3"] = 65,
    },
}

Config.RewardsIPL = {
    [1] = { -- IPL Tier
        itemCount = {min = 1, max = 2}, -- Amount of items that can be obtained in this tier
        chance = 50, -- Chance of getting an item while searching in this tier
        bonusItem = "rolex", -- Item that can be obtained as a bonus
        bonusChance = 10, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 15, max = 18}, -- Only if you have a level system
        ExpProps = {min = 20, max = 23}, -- Only if you have a level system
        -- Safe Settings:
        -- Chance of a safe spawning is determined indivbidually for each IPL, check the IPL configs themselves
        SafeItemCount = {min = 1, max = 2}, -- Amount of items that can be obtained from the safe loot table below
        ExpSafe = {min = 20, max = 25}, -- Only if you have a level system

        ["cabin"] = {
            [1] = {name = "screwdriverset", amount = {min = 1, max = 2}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "fitbit", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "lockpick", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}},  -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "samsungphone", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["kitchen"] = {
            [1] = {name = "bandage", amount = {min = 1, max = 2}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "painkillers", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "water_bottle", amount = {min = 1, max = 2}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "joint", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["chest"] = {
            [1] = {name = "diamond", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "rolex", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "iphone", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "samsungphone", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["livingroom"] = {
            [1] = {name = "fitbit", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "screwdriverset", amount = {min = 1, max = 2}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "bandage", amount = {min = 1, max = 2}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "plastic", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["safe"] = {
            [1] = {name = "rolex", amount = {min = 2, max = 3}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "diamond", amount = {min = 2, max = 3}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "goldchain", amount = {min = 2, max = 3}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "weapon_pistol", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        }
    },
    [2] = { -- IPL Tier
        itemCount = {min = 1, max = 2}, -- Amount of items that can be obtained in this tier
        chance = 60, -- Chance of getting an item while searching in this tier
        bonusItem = "diamond", -- Item that can be obtained as a bonus
        bonusChance = 10, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 22, max = 24}, -- Only if you have a level system
        ExpProps = {min = 27, max = 29}, -- Only if you have a level system
        -- Safe Settings:
        -- Chance of a safe spawning is determined indivbidually for each IPL, check the IPL configs themselves
        SafeItemCount = {min = 1, max = 2}, -- Amount of items that can be obtained from the safe loot table below
        ExpSafe = {min = 20, max = 25}, -- Only if you have a level system

        ["cabin"] = { 
            [1] = {name = "advancedlockpick", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "iphone", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "rolex", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "joint", amount = {min = 1, max = 2}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["kitchen"] = { 
            [1] = {name = "painkillers", amount = {min = 1, max = 2}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "advancedlockpick", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "goldchain", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "joint", amount = {min = 1, max = 2}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["chest"] = { 
            [1] = {name = "diamond_ring", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "rolex", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "10kgoldchain", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "pistol_ammo", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["livingroom"] = { 
            [1] = {name = "samsung", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "painkillers", amount = {min = 1, max = 2}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "lockpick", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "diamond_ring", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["safe"] = {
            [1] = {name = "rolex", amount = {min = 2, max = 3}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "diamond", amount = {min = 2, max = 3}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "goldchain", amount = {min = 2, max = 3}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "weapon_pistol", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        }
    },
    [3] = { -- IPL Tier
        itemCount = {min = 1, max = 3}, -- Amount of items that can be obtained in this tier
        chance = 70, -- Chance of getting an item while searching in this tier
        bonusItem = "diamond_ring", -- Item that can be obtained as a bonus
        bonusChance = 10, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 26, max = 30}, -- Only if you have a level system
        ExpProps = {min = 31, max = 35}, -- Only if you have a level system
        -- Safe Settings:
        -- Chance of a safe spawning is determined indivbidually for each IPL, check the IPL configs themselves
        SafeItemCount = {min = 1, max = 2}, -- Amount of items that can be obtained from the safe loot table below
        ExpSafe = {min = 20, max = 25}, -- Only if you have a level system

        ["cabin"] = { 
            [1] = {name = "goldchain", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "handcuffs", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "diamond", amount = {min = 1, max = 2}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "diamond_ring", amount = {min = 1, max = 2}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["kitchen"] = { 
            [1] = {name = "firstaid", amount = {min = 1, max = 2}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "10kgoldchain", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "weapon_knife", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "joint", amount = {min = 1, max = 3}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        }, 
        ["chest"] = { 
            [1] = {name = "handcuffs", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "rolex", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "weapon_pistol", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "rifle_ammo", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["livingroom"] = { 
            [1] = {name = "iphone", amount = {min = 1, max = 2}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "advancedlockpick", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "joint", amount = {min = 1, max = 3}, chance = 100}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "diamond_ring", amount = {min = 1, max = 2}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["safe"] = {
            [1] = {name = "rolex", amount = {min = 2, max = 3}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "diamond", amount = {min = 2, max = 3}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "goldchain", amount = {min = 2, max = 3}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "weapon_pistol", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        }
    },
}
Config.RewardsShell = {
    [1] = { -- Shell Tier
        itemCount = {min = 1, max = 1}, -- Amount of items that can be obtained in this tier
        chance = 30, -- Chance of getting an item while searching in this tier
        bonusItem = "rolex", -- Item that can be obtained as a bonus
        bonusChance = 10, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 4, max = 5}, -- Only if you have a level system

        ["cabin"] = {
            [1] = {name = "screwdriverset", amount = {min = 1, max = 2}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "fitbit", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "lockpick", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "samsungphone", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["kitchen"] = { 
            [1] = {name = "bandage", amount = {min = 1, max = 2}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "painkillers", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "water_bottle", amount = {min = 1, max = 2}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "joint", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["chest"] = { 
            [1] = {name = "diamond", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "rolex", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "iphone", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "samsungphone", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["livingroom"] = { 
            [1] = {name = "fitbit", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "screwdriverset", amount = {min = 1, max = 2}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "bandage", amount = {min = 1, max = 2}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "plastic", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
    },
    [2] = { -- Shell Tier
        itemCount = {min = 1, max = 2}, -- Amount of items that can be obtained in this tier
        chance = 40, -- Chance of getting an item while searching in this tier
        bonusItem = "diamond", -- Item that can be obtained as a bonus
        bonusChance = 10, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 6, max = 7}, -- Only if you have a level system

        ["cabin"] = {
            [1] = {name = "advancedlockpick", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "iphone", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "rolex", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "joint", amount = {min = 1, max = 2}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["kitchen"] = {
            [1] = {name = "painkillers", amount = {min = 1, max = 2}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "advancedlockpick", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "goldchain", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "joint", amount = {min = 1, max = 2}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        }, 
        ["chest"] = {
            [1] = {name = "diamond_ring", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "rolex", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "10kgoldchain", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "pistol_ammo", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["livingroom"] = {
            [1] = {name = "samsung", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "painkillers", amount = {min = 1, max = 2}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "lockpick", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "diamond_ring", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        }, 
    },
    [3] = { -- Shell Tier
        itemCount = {min = 1, max = 3}, -- Amount of items that can be obtained in this tier
        chance = 50, -- Chance of getting an item while searching in this tier
        bonusItem = "diamond_ring", -- Item that can be obtained as a bonus
        bonusChance = 40, -- Chance of getting the bonus item
        bonusAmount = {min = 1, max = 1}, -- Amount of the bonus item
        Exp = {min = 9, max = 10}, -- Only if you have a level system

        ["cabin"] = {
            [1] = {name = "goldchain", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "handcuffs", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "diamond", amount = {min = 1, max = 2}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "diamond_ring", amount = {min = 1, max = 2}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["kitchen"] = {
            [1] = {name = "firstaid", amount = {min = 1, max = 2}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "10kgoldchain", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "weapon_knife", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "joint", amount = {min = 1, max = 3}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["chest"] = {
            [1] = {name = "handcuffs", amount = {min = 1, max = 1}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "rolex", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}},  -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "weapon_pistol", amount = {min = 1, max = 1}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "rifle_ammo", amount = {min = 1, max = 1}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
        ["livingroom"] = {
            [1] = {name = "iphone", amount = {min = 1, max = 2}, chance = {min = 1, max = 25}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [2] = {name = "advancedlockpick", amount = {min = 1, max = 1}, chance = {min = 26, max = 50}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [3] = {name = "joint", amount = {min = 1, max = 3}, chance = {min = 51, max = 75}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
            [4] = {name = "diamond_ring", amount = {min = 1, max = 2}, chance = {min = 76, max = 100}}, -- 'amount' is how many of that item, 'chance' gets a random number, if that number is between min and max, you get the item
        },
    },
}

Config.IPL = {
    ["4IntegrityWay"] = {
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        VehicleSpawnCoords = vector4(-19.33, -634.96, 35.12, 250.13), -- Owner's vehicle spawn coords (You can change this to your liking)
        HouseCoords = vector4(-13.9, -583.66, 90.11 - Config.Minus1, 68.19), -- Coords where the players spawn when entering a house
        DoorCoords = vector4(-15.9, -612.43, 35.86 - Config.Minus1, 65.38), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(-38.1, -576.28, 89.18, 249.87), vector4(-36.71, -577.14, 84.65, 344.92), vector4(-40.08, -577.97, 89.18, 338.45)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(-39.8, -573.3, 88.73, 246.7), vector4(-25.28, -590.61, 90.12, 321.08), vector4(-36.38, -576.12, 84.63, 238.64)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["level"] = 45, -- Only if you have a level system, used to specify which skill level is needed for the robbery
        ["tier"] = 2, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin", -- Don't touch this
                ["coords"] = vector4(-46.18, -587.18, 88.36 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
            [2] = {
                ["type"] = "cabin", -- Don't touch this
                ["coords"] = vector4(-36.72, -577.16, 88.44 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = vector4(-34.77, -585.61, 88.51 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector4(-37.86, -577.98, 83.3 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search nightstand"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector4(-39.08, -585.29, 83.61 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers"
            },
        },

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(-39.33, -581.93, 83.91, 342.04), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["boxx"] = 1.5, 
            ["boxy"] = 1.5,
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
        },

		['propitem1'] = {
            [1] = {
                ["itemname"] = "laptop",
                ["PropName"] = "prop_laptop_01a",
                ["coords"] = vector4(-32.47, -577.19, 88.00, 22.76),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Laptop"
            },
            [2] = {
                ["itemname"] = "musicequipment",
                ["PropName"] = "prop_speaker_06",
                ["coords"] = vector4(-38.54, -571.69, 88.53, 340.5),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Music Equipment"
            },
            [3] = {
                ["itemname"] = "goldchain",
                ["PropName"] = "p_csbporndudes_necklace_s",
                ["coords"] = vector4(-43.26, -580.92, 88.53, 330.35),
                ["pitch"] = -45.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Chain"
            },
        },
    },
    ["delPerroHeights"] = {
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        VehicleSpawnCoords = vector4(-1479.45, -513.76, 31.81, 34.18), -- Owner's vehicle spawn coords (You can change this to your liking)
        HouseCoords = vector4(-1452.87, -537.06, 74.04 - Config.Minus1, 118.79), -- Coords where the players spawn when entering a house
        DoorCoords = vector4(-1477.83, -519.71, 34.74 - Config.Minus1, 213.13), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(-1463.09, -546.92, 73.7, 45.83), vector4(-1455.6, -553.64, 72.51, 153.96), vector4(-1463.97, -545.11, 72.7, 109.77)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(-1466.72, -548.08, 73.24, 325.53), vector4(-1459.03, -531.28, 73.08, 220.95), vector4(-1469.43, -528.14, 72.44, 217.94)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["level"] = 25, -- Only if you have a level system, used to specify which skill level is needed for the robbery
        ["tier"] = 1, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(-1448.54, -548.85, 72.84, 303.19), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["boxx"] = 1.5,
            ["boxy"] = 1.5,
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = vector4(-1471.82, -535.02, 73.86 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search oven",
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = vector4(-1467.35, -524.23, 72.92 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = vector4(-1463.09, -550.03, 73.14 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector4(-1458.08, -550.12, 72.57 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search dresser"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector4(-1454.48, -548.97, 72.57 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search dresser"
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "phone",
                ["PropName"] = "prop_npc_phone",
                ["coords"] = vector4(-1469.36, -539.86, 73.20, 34.36),
                ["pitch"] = 90.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Phone"
            },
            [2] = {
                ["itemname"] = "coffeemaker",
                ["PropName"] = "hei_heist_kit_coffeemachine_01",
                ["coords"] = vector4(-1472.24, -538.2, 73.71, 123.07),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Coffee Machine"
            },
        },
    },
    ["delPerroHeights2"] = { 
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        VehicleSpawnCoords = vector4(-1467.26, -505.1, 31.81, 30.06), -- Owner's vehicle spawn coords (You can change this to your liking)
        HouseCoords = vector4(-1453.93, -517.64, 56.93 - Config.Minus1, 124.79), -- Coords where the players spawn when entering a house
        DoorCoords = vector4(-1459.49, -506.22, 32.08 - Config.Minus1, 209.6), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(-1473.45, -533.08, 55.99, 296.93), vector4(-1472.08, -532.61, 51.46, 18.65), vector4(-1462.19, -532.07, 50.72, 228.56)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(-1475.01, -532.41, 55.54, 221.4), vector4(-1466.52, -537.02, 50.73, 318.51), vector4(-1466.89, -536.43, 50.73, 28.96)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["level"] = 25, -- Only if you have a level system, used to specify which skill level is needed for the robbery
        ["tier"] = 1, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(-1469.37, -537.5, 50.73, 135.04), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["boxx"] = 1.5, 
            ["boxy"] = 1.5,
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = vector4(-1458.21, -537.61, 55.34 - Config.Minus1, 318.18),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search oven",
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = vector4(-1469.42, -545.99, 54.82 - Config.Minus1, 288.42),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = vector4(-1459.81, -533.76, 54.53 - Config.Minus1, 333.51),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector4(-1471.76, -532.12, 54.53 - Config.Minus1, 126.17),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search dresser"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector4(-1469.74, -534.03, 50.72 - Config.Minus1, 210.84),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search dresser"
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "phone",
                ["PropName"] = "prop_npc_phone",
                ["coords"] = vector4(-1473.05, -540.11, 55.31, 302.98),
                ["pitch"] = 90.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Phone"
            },
            [2] = {
                ["itemname"] = "coffeemaker",
                ["PropName"] = "hei_heist_kit_coffeemachine_01",
                ["coords"] = vector4(-1464.76, -536.16, 54.83, 35.58),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Coffee Machine"
            },
            [3] = {
                ["itemname"] = "goldchain",
                ["PropName"] = "p_csbporndudes_necklace_s",
                ["coords"] = vector4(-1472.06, -534.32, 49.53, 304.03),
                ["pitch"] = -45.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Chain"
            },
        },
    },
    ["3655WildOatsDrive"] = {
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        VehicleSpawnCoords = vector4(-188.02, 501.8, 133.97, 89.8), -- Owner's vehicle spawn coords (You can change this to your liking)
        HouseCoords = vector4(-174.39, 497.91, 137.65 - Config.Minus1, 198.38), -- Coords where the players spawn when entering a house
        DoorCoords = vector4(-173.4, 502.83, 137.42 - Config.Minus1, 275.8), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(-165.06, 480.65, 137.72, 186.01), vector4(-163.25, 483.92, 134.56, 193.65), vector4(-170.12, 497.68, 130.52, 123.69)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(-168.73, 481.72, 133.88, 7.46), vector4(-165.2, 483.67, 137.27, 43.93), vector4(-170.3, 495.41, 137.65, 86.84)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["level"] = 65, -- Only if you have a level system, used to specify which skill level is needed for the robbery
        ["tier"] = 3, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(-173.84, 489.83, 130.04, 186.97), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["boxx"] = 1.5, 
            ["boxy"] = 1.5,
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = vector4(-171.01, 482.51, 136.95 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
            [2] = {
                ["type"] = "kitchen",
                ["coords"] = vector4(-166.63, 493.67, 137.47 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search kitchen cabinets"
            },
            [3] = {
                ["type"] = "cabin",
                ["coords"] = vector4(-170.84, 481.56, 133.58 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search shelves"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector4(-175.81, 489.72, 129.57 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector4(-165.79, 495.92, 133.45 - Config.Minus1, 90.0),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search bathroom drawer"
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "laptop",
                ["PropName"] = "prop_laptop_01a",
                ["coords"] = vector4(-163.59, 482.89, 132.79, 45.42),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Laptop"
            },
            [2] = {
                ["itemname"] = "flight_artpiece",
                ["PropName"] = "hei_prop_hei_bust_01",
                ["coords"] = vector4(-171.57, 484.13, 137.37, 100.92),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Statue"
            },
            [3] = {
                ["itemname"] = "goldchain",
                ["PropName"] = "p_csbporndudes_necklace_s",
                ["coords"] = vector4(-167.64, 488.89, 137.21, 32.51),
                ["pitch"] = -45.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Chain"
            },
        },
    },
    ["2044NorthConkerAvenue"] = { 
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        VehicleSpawnCoords = vector4(352.88, 436.81, 146.03, 297.56), -- Owner's vehicle spawn coords (You can change this to your liking)
        HouseCoords = vector4(342.2, 437.96, 149.38 - Config.Minus1, 114.33), -- Coords where the players spawn when entering a house
        DoorCoords = vector4(346.15, 440.39, 148.08 - Config.Minus1, 115.05), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(332.0, 425.81, 148.99, 14.7), vector4(332.12, 427.88, 145.57, 211.73), vector4(343.56, 438.04, 141.77, 125.77)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(330.15, 427.19, 148.99, 309.59), vector4(330.91, 426.44, 145.57, 78.65), vector4(341.93, 436.87, 141.77, 55.32)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["level"] = 65, -- Only if you have a level system, used to specify which skill level is needed for the robbery
        ["tier"] = 3, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(334.34, 435.17, 141.77, 117.66), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["boxx"] = 1.5, 
            ["boxy"] = 1.5,
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = vector4(327.89, 429.93, 145.57 - Config.Minus1, 29.03),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
            [2] = {
                ["type"] = "kitchen",
                ["coords"] = vector4(342.95, 430.65, 149.38 - Config.Minus1, 279.48),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search kitchen cabinets"
            },
            [3] = {
                ["type"] = "cabin",
                ["coords"] = vector4(345.32, 437.11, 141.77 - Config.Minus1, 335.59),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search shelves"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector4(334.08, 436.51, 141.77 - Config.Minus1, 22.09),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search cabinets"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector4(342.37, 429.05, 145.58 - Config.Minus1, 295.39),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search bathroom drawer"
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "laptop",
                ["PropName"] = "prop_laptop_01a",
                ["coords"] = vector4(330.68, 423.57, 144.47, 277.78),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Laptop"
            },
            [2] = {
                ["itemname"] = "flight_artpiece",
                ["PropName"] = "hei_prop_hei_bust_01",
                ["coords"] = vector4(329.62, 431.43, 148.97, 23.36),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Statue"
            },
            [3] = {
                ["itemname"] = "goldchain",
                ["PropName"] = "p_csbporndudes_necklace_s",
                ["coords"] = vector4(335.52, 429.14, 148.9, 182.65),
                ["pitch"] = -45.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Chain"
            },
            [4] = {
                ["itemname"] = "microwave",
                ["PropName"] = "prop_microwave_1",
                ["coords"] = vector4(339.4, 431.67, 149.36, 55.53),
                ["pitch"] = 0.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Microwave"
            },
        },
    },
    ["legionSquare"] = { 
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        VehicleSpawnCoords = vector4(323.16, -1002.95, 28.3, 0.11), -- Owner's vehicle spawn coords (You can change this to your liking)
        HouseCoords = vector4(266.16, -1007.57, -101.01 - Config.Minus1, 11.03), -- Coords where the players spawn when entering a house
        DoorCoords = vector4(307.67, -1005.6, 29.51 - Config.Minus1, 189.49), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(259.11, -995.7, -99.01, 175.04), vector4(261.16, -996.53, -98.57, 102.13), vector4(262.63, -1003.78, -98.27, 88.31)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(259.47, -1003.9, -99.01, 314.56), vector4(261.72, -994.87, -99.01, 187.34), vector4(254.33, -1001.13, -98.93, 280.99)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["level"] = 25, -- Only if you have a level system, used to specify which skill level is needed for the robbery
        ["tier"] = 1, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(259.6, -1003.43, -99.01, 178.97), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["boxx"] = 1.5, 
            ["boxy"] = 1.5,
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = vector4(266.24, -999.41, -98.88 - Config.Minus1, 89.63),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Cabinet",
            },
            [2] = {
                ["type"] = "kitchen",
                ["coords"] = vector4(264.1, -994.86, -97.25 - Config.Minus1, 180.81),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Kitchen Cabinet"
            },
            [3] = {
                ["type"] = "cabin",
                ["coords"] = vector4(259.8, -1004.4, -99.09 - Config.Minus1, 354.84),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Shelves"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector4(261.31, -1002.05, -99.29 - Config.Minus1, 174.74),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector4(255.7, -999.83, -98.63 - Config.Minus1, 180.69),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bathroom Medicine Cabinet"
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "laptop",
                ["PropName"] = "prop_laptop_01a",
                ["coords"] = vector4(262.06, -1000.67, -99.18, 95.32),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Laptop"
            },
            [2] = {
                ["itemname"] = "flight_artpiece",
                ["PropName"] = "v_ilev_trev_pictureframe",
                ["coords"] = vector4(255.93, -998.57, -97.02, 267.84),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Painting"
            },
        },
    },
    ["2045NorthConkerAvenue"] = { 
        OwnerChance = 50, -- (%) Chance of a ped being home
        PetChance = 50, -- (%) Chance of a pet being home
        GunChance = 50, -- (%) Chance of the owner holding a gun
        SleepChance = 60, -- (%) Chance of the owner being asleep
        DogSleepChance = 50, -- (%) Chance of the pet being asleep
        AlarmChance = 50, -- (%) Chance of the alarm going off anyways
        OwnerModel = {'g_m_m_chicold_01', 'a_m_m_beach_01', 'a_m_m_og_boss_01', 'a_m_m_soucent_01'}, -- Owner models that gets chosen randomly to spawn (Can change the models to whatever you want)
        PetModel = {'a_c_rottweiler', 'a_c_chop', 'a_c_shepherd', 'a_c_retriever'}, -- Pet models that gets chosen randomly to spawn (Can change the models to whatever you want)
        VehicleSpawnCoords = vector4(369.28, 434.26, 143.57, 264.51), -- Owner's vehicle spawn coords (You can change this to your liking)
        HouseCoords = vector4(373.63, 423.74, 145.91 - Config.Minus1, 221.63), -- Coords where the players spawn when entering a house
        DoorCoords = vector4(374.29, 427.45, 145.68 - Config.Minus1, 237.6), -- Coords where the players need to lockpick to rob the house (must be touching the door)
        OwnerCoords = {vector4(374.34, 407.12, 145.53, 336.72), vector4(374.54, 424.48, 142.1, 169.35), vector4(372.5, 405.74, 142.11, 216.12)}, -- Coords where the owner can spawn inside the house (You can change the coords, or add more to them)
        PetCoords = {vector4(372.81, 407.23, 145.53, 59.63), vector4(371.56, 409.51, 142.1, 214.7), vector4(377.59, 422.42, 141.01, 270.96)}, -- Coords where the pet can spawn inside the house (You can change the coords, or add more to them)

        ["level"] = 65, -- Only if you have a level system, used to specify which skill level is needed for the robbery
        ["tier"] = 3, -- House tiers (1 to 3), 1 being the lowest, 3 the highest

        ['safe'] = {
            ['status'] = true, -- Enable/Disable safes for this specific IPL
            ['chance'] = 10, -- (%)Chance of a safe spawning in this specific IPL
            ['coords'] = vector4(378.2, 433.01, 138.3, 350.56), -- Coords where the safe spawns
            ['model'] = 'h4_prop_h4_safe_01a', -- Model of the safe
            ['modelopen'] = 'h4_prop_h4_safe_01b', -- Model of the safe when it's open
            ["boxx"] = 1.5, 
            ["boxy"] = 1.5,
            ["text"] = "Crack safe",
            ["icon"] = 'fas fa-search',
        },

        ["furniture"] = {
            [1] = {
                ["type"] = "cabin", -- Don't touch this
                ["coords"] = vector4(369.38, 408.3, 145.5 - Config.Minus1, 73.22),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers",
            },
            [2] = {
                ["type"] = "cabin", -- Don't touch this
                ["coords"] = vector4(369.17, 407.92, 142.1 - Config.Minus1, 117.82),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search drawers"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = vector4(377.79, 417.39, 145.9 - Config.Minus1, 209.77),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = vector4(377.27, 407.49, 142.13 - Config.Minus1, 240.72),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search nightstand"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = vector4(373.57, 425.73, 142.1- Config.Minus1, 20.03),
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Shelves"
            },
        },
		['propitem1'] = {
            [1] = {
                ["itemname"] = "flight_painting",
                ["PropName"] = "ch_prop_vault_painting_01c",
                ["coords"] = vector4(379.94, 424.54, 143.1, 261.93),
                ["pitch"] = -35.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Painting"
            },
            [2] = { 
                ["itemname"] = "laptop",
                ["PropName"] = "prop_laptop_01a",
                ["coords"] = vector4(374.41, 406.27, 144.45, 5.31),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Laptop"
            },
            [3] = {
                ["itemname"] = "weapon_appistol",
                ["PropName"] = "w_pi_appistol_luxe",
                ["coords"] = vector4(379.65, 431.8, 137.90, 345.57),
                ["pitch"] = -90.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Weapon"
            },
            [4] = {
                ["itemname"] = "flight_guitar",
                ["PropName"] = "prop_el_guitar_03",
                ["coords"] = vector4(372.4308776855469, 411.9132080078125, 141.05, 255.0),
                ["pitch"] = -25.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Guitar"
            },
            [5] = {
                ["itemname"] = "goldchain",
                ["PropName"] = "p_csbporndudes_necklace_s",
                ["coords"] = vector4(375.13, 412.76, 145.47, 46.24),
                ["pitch"] = -45.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Chain"
            },
            [6] = {
                ["itemname"] = "flight_suitcase",
                ["PropName"] = "prop_ld_case_01",
                ["coords"] = vector4(375.43, 417.61, 145.55, 310.8),
                ["pitch"] = -90.0,
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal Suitcase"
            },
            [7] = {
                ["itemname"] = "pcequipment",
                ["PropName"] = "prop_dyn_pc_02",
                ["coords"] = vector4(374.7350769042969, 434.5387268066406, 138.0195770263672, 346.0),
                ["boxx"] = 1.5,
                ["boxy"] = 1.5,
                ["icon"] = 'fas fa-search',
                ["text"] = "Steal PC"
            },
        },
    },
}

Config.Shells = {
    ["perfectdrive1"] = {
        ["coords"] = {
            ["x"] = -784.72,
            ["y"] = 459.77,
            ["z"] = 100.39 - Config.Minus1,
            ["h"] = 34.89
        },
        ["tier"] = 3,
        ["level"] = 15,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive2"] = {
        ["coords"] = {
            ["x"] = -762.21,
            ["y"] = 430.96,
            ["z"] = 100.2 - Config.Minus1,
            ["h"] = 198.27
        },
        ["tier"] = 3,
        ["level"] = 15,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive3"] = {
        ["coords"] = {
            ["x"] = -679.04,
            ["y"] = 512.04,
            ["z"] = 113.53 - Config.Minus1,
            ["h"] = 15.18
        },
        ["tier"] = 3,
        ["level"] = 15,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive4"] = {
        ["coords"] = {
            ["x"] = -640.92,
            ["y"] = 520.61,
            ["z"] = 109.88 - Config.Minus1,
            ["h"] = 9.94
        },
        ["tier"] = 3,
        ["level"] = 15,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive5"] = {
        ["coords"] = {
            ["x"] = -622.84,
            ["y"] = 488.88,
            ["z"] = 108.88 - Config.Minus1,
            ["h"] = 186.87
        },
        ["tier"] = 3,
        ["level"] = 15,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive6"] = {
        ["coords"] = {
            ["x"] = -595.55,
            ["y"] = 530.28,
            ["z"] = 107.75 - Config.Minus1,
            ["h"] = 13.0
        },
        ["tier"] = 3,
        ["level"] = 15,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad1"] = {
        ["coords"] = {
            ["x"] = -536.67,
            ["y"] = 477.36,
            ["z"] = 103.19 - Config.Minus1,
            ["h"] = 235.55
        },
        ["tier"] = 3,
        ["level"] = 15,

        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad2"] = {
        ["coords"] = {
            ["x"] = -526.64,
            ["y"] = 516.97,
            ["z"] = 112.94 - Config.Minus1,
            ["h"] = 226.17
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad3"] = {
        ["coords"] = {
            ["x"] = -554.48,
            ["y"] = 541.26,
            ["z"] = 110.71 - Config.Minus1,
            ["h"] = 338.6
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad4"] = {
        ["coords"] = {
            ["x"] = -500.82,
            ["y"] = 551.92,
            ["z"] = 120.6 - Config.Minus1,
            ["h"] = 159.51
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive1"] = {
        ["coords"] = {
            ["x"] = -418.09,
            ["y"] = 568.99,
            ["z"] = 125.06 - Config.Minus1,
            ["h"] = 333.59
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive2"] = {
        ["coords"] = {
            ["x"] = -411.06,
            ["y"] = 529.18,
            ["z"] = 122.18 - Config.Minus1,
            ["h"] = 167.27
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive3"] = {
        ["coords"] = {
            ["x"] = -348.73,
            ["y"] = 514.95,
            ["z"] = 120.65 - Config.Minus1,
            ["h"] = 316.96
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive4"] = {
        ["coords"] = {
            ["x"] = -355.93,
            ["y"] = 469.76,
            ["z"] = 112.65 - Config.Minus1,
            ["h"] = 104.28
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["hillcrest1"] = {
        ["coords"] = {
            ["x"] = -908.66,
            ["y"] = 693.67,
            ["z"] = 151.44 - Config.Minus1,
            ["h"] = 104.28
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["hillcrest2"] = {
        ["coords"] = {
            ["x"] = -951.28,
            ["y"] = 682.65,
            ["z"] = 153.58 - Config.Minus1,
            ["h"] = 177.85
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["hillcrest3"] = {
        ["coords"] = {
            ["x"] = -1056.34,
            ["y"] = 761.34,
            ["z"] = 167.32 - Config.Minus1,
            ["h"] = 92.27
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon1"] = {
        ["coords"] = {
            ["x"] = -1130.87,
            ["y"] = 784.44,
            ["z"] = 163.89 - Config.Minus1,
            ["h"] = 56.39
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon2"] = {
        ["coords"] = {
            ["x"] = -1117.77,
            ["y"] = 761.48,
            ["z"] = 164.29 - Config.Minus1,
            ["h"] = 205.7
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon3"] = {
        ["coords"] = {
            ["x"] = -1065.02,
            ["y"] = 772.17,
            ["z"] = 170.06 - Config.Minus1,
            ["h"] = 179.03
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon4"] = {
        ["coords"] = {
            ["x"] = -962.7,
            ["y"] = 814.09,
            ["z"] = 177.57 - Config.Minus1,
            ["h"] = 0.44
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon5"] = {
        ["coords"] = {
            ["x"] = -867.34,
            ["y"] = 785.0,
            ["z"] = 191.93 - Config.Minus1,
            ["h"] = 182.44
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["wildoats1"] = {
        ["coords"] = {
            ["x"] = 80.09,
            ["y"] = 486.26,
            ["z"] = 148.2 - Config.Minus1,
            ["h"] = 25.28
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["wildoats2"] = {
        ["coords"] = {
            ["x"] = 57.56,
            ["y"] = 449.68,
            ["z"] = 147.03 - Config.Minus1,
            ["h"] = 147.72
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["wildoats3"] = {
        ["coords"] = {
            ["x"] = -110.05,
            ["y"] = 501.83,
            ["z"] = 143.38 - Config.Minus1,
            ["h"] = 171.41
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["jamestown1"] = {
        ["coords"] = {
            ["x"] = 385.0,
            ["y"] = -1881.57,
            ["z"] = 26.03 - Config.Minus1,
            ["h"] = 43.25,
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["jamestown2"] = {
        ["coords"] = {
            ["x"] = 412.47,
            ["y"] = -1856.38,
            ["z"] = 27.32 - Config.Minus1,
            ["h"] = 129.24
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["jamestown3"] = {
        ["coords"] = {
            ["x"] = 427.21,
            ["y"] = -1842.09,
            ["z"] = 28.46 - Config.Minus1,
            ["h"] = 134.19
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["roylow1"] = {
        ["coords"] = {
            ["x"] = 348.77,
            ["y"] = -1820.95,
            ["z"] = 28.89 - Config.Minus1,
            ["h"] = 135.8
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["roylow2"] = {
        ["coords"] = {
            ["x"] = 329.42,
            ["y"] = -1845.8,
            ["z"] = 27.75 - Config.Minus1,
            ["h"] = 228.98
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["roylow3"] = {
        ["coords"] = {
            ["x"] = 320.27,
            ["y"] = -1854.06,
            ["z"] = 27.51 - Config.Minus1,
            ["h"] = 225.09
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant1"] = {
        ["coords"] = {
            ["x"] = 192.29,
            ["y"] = -1883.23,
            ["z"] = 25.06 - Config.Minus1,
            ["h"] = 326.47
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant2"] = {
        ["coords"] = {
            ["x"] = 171.52,
            ["y"] = -1871.53,
            ["z"] = 24.4 - Config.Minus1,
            ["h"] = 245.19
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant3"] = {
        ["coords"] = {
            ["x"] = 128.24,
            ["y"] = -1897.02,
            ["z"] = 23.67 - Config.Minus1,
            ["h"] = 239.54
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant4"] = {
        ["coords"] = {
            ["x"] = 130.6,
            ["y"] = -1853.22,
            ["z"] = 25.23 - Config.Minus1,
            ["h"] = 329.64
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove1"] = {
        ["coords"] = {
            ["x"] = 76.36,
            ["y"] = -1948.1,
            ["z"] = 21.17 - Config.Minus1,
            ["h"] = 44.97
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.984, ["y"] = 10.112, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove2"] = {
        ["coords"] = {
            ["x"] = 101.03,
            ["y"] = -1912.16,
            ["z"] = 21.41 - Config.Minus1,
            ["h"] = 331.84
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove3"] = {
        ["coords"] = {
            ["x"] = 126.73,
            ["y"] = -1930.12,
            ["z"] = 21.38 - Config.Minus1,
            ["h"] = 210.98
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove4"] = {
        ["coords"] = {
            ["x"] = 114.25,
            ["y"] = -1961.19,
            ["z"] = 21.33 - Config.Minus1,
            ["h"] = 198.18
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove5"] = {
        ["coords"] = {
            ["x"] = 495.4,
            ["y"] = -1823.36,
            ["z"] = 28.87 - Config.Minus1,
            ["h"] = 139.32
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove6"] = {
        ["coords"] = {
            ["x"] = 514.28,
            ["y"] = -1780.92,
            ["z"] = 28.91 - Config.Minus1,
            ["h"] = 271.67
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove7"] = {
        ["coords"] = {
            ["x"] = 479.63,
            ["y"] = -1735.72,
            ["z"] = 29.15 - Config.Minus1,
            ["h"] = 342.66
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove8"] = {
        ["coords"] = {
            ["x"] = 489.64,
            ["y"] = -1714.08,
            ["z"] = 29.71 - Config.Minus1,
            ["h"] = 65.51
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity1"] = {
        ["coords"] = {
            ["x"] = -1076.33,
            ["y"] = -1026.96,
            ["z"] = 4.54 - Config.Minus1,
            ["h"] = 118.14
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity2"] = {
        ["coords"] = {
            ["x"] = -1064.64,
            ["y"] = -1057.42,
            ["z"] = 6.41 - Config.Minus1,
            ["h"] = 115.35
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity3"] = {
        ["coords"] = {
            ["x"] = -1063.77,
            ["y"] = -1054.99,
            ["z"] = 2.15 - Config.Minus1,
            ["h"] = 120.47
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity4"] = {
        ["coords"] = {
            ["x"] = -1054.07,
            ["y"] = -1000.2,
            ["z"] = 6.41 - Config.Minus1,
            ["h"] = 296.69
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity5"] = {
        ["coords"] = {
            ["x"] = -985.89,
            ["y"] = -1121.74,
            ["z"] = 4.55 - Config.Minus1,
            ["h"] = 297.63
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity6"] = {
        ["coords"] = {
            ["x"] = -1024.42,
            ["y"] = -1140.0,
            ["z"] = 2.75 - Config.Minus1,
            ["h"] = 213.84
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity7"] = {
        ["coords"] = {
            ["x"] = -1074.13,
            ["y"] = -1152.73,
            ["z"] = 2.16 - Config.Minus1,
            ["h"] = 118.65
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity8"] = {
        ["coords"] = {
            ["x"] = -1063.57,
            ["y"] = -1160.35,
            ["z"] = 2.75 - Config.Minus1,
            ["h"] = 210.36
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed1"] = {
        ["coords"] = {
            ["x"] = 1662.07,
            ["y"] = 4776.19,
            ["z"] = 42.07 - Config.Minus1,
            ["h"] = 92.92
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed2"] = {
        ["coords"] = {
            ["x"] = 1664.04,
            ["y"] = 4739.68,
            ["z"] = 42.01 - Config.Minus1,
            ["h"] = 111.19
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed3"] = {
        ["coords"] = {
            ["x"] = 1725.39,
            ["y"] = 4642.54,
            ["z"] = 43.88 - Config.Minus1,
            ["h"] = 295.72
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed4"] = {
        ["coords"] = {
            ["x"] = 1673.62,
            ["y"] = 4658.22,
            ["z"] = 43.68 - Config.Minus1,
            ["h"] = 106.54
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed5"] = {
        ["coords"] = {
            ["x"] = 1719.04,
            ["y"] = 4677.11,
            ["z"] = 43.66 - Config.Minus1,
            ["h"] = 277.21
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed6"] = {
        ["coords"] = {
            ["x"] = 1682.86,
            ["y"] = 4689.51,
            ["z"] = 43.07 - Config.Minus1,
            ["h"] = 93.25
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto1"] = {
        ["coords"] = {
            ["x"] = -360.24,
            ["y"] = 6260.61,
            ["z"] = 31.9 - Config.Minus1,
            ["h"] = 136.27
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto2"] = {
        ["coords"] = {
            ["x"] = -366.57,
            ["y"] = 6214.12,
            ["z"] = 31.84 - Config.Minus1,
            ["h"] = 317.03
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto3"] = {
        ["coords"] = {
            ["x"] = -447.87,
            ["y"] = 6260.25,
            ["z"] = 30.05 - Config.Minus1,
            ["h"] = 338.35
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto4"] = {
        ["coords"] = {
            ["x"] = -245.99,
            ["y"] = 6414.45,
            ["z"] = 31.46 - Config.Minus1,
            ["h"] = 305.54
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto5"] = {
        ["coords"] = {
            ["x"] = -9.59,
            ["y"] = 6654.23,
            ["z"] = 31.7 - Config.Minus1,
            ["h"] = 31.66
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto6"] = {
        ["coords"] = {
            ["x"] = 25.1,
            ["y"] = 6601.76,
            ["z"] = 32.47 - Config.Minus1,
            ["h"] = 133.36
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto7"] = {
        ["coords"] = {
            ["x"] = -379.93,
            ["y"] = 6252.55,
            ["z"] = 31.85 - Config.Minus1,
            ["h"] = 129.07
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto8"] = {
        ["coords"] = {
            ["x"] = -213.44,
            ["y"] = 6396.42,
            ["z"] = 33.09 - Config.Minus1,
            ["h"] = 228.18
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paletoHotels1"] = {
        ["coords"] = {
            ["x"] = -159.84,
            ["y"] = 6432.65,
            ["z"] = 31.93 - Config.Minus1,
            ["h"] = 310.91
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paletoHotels2"] = {
        ["coords"] = {
            ["x"] = -149.98,
            ["y"] = 6416.07,
            ["z"] = 31.92 - Config.Minus1,
            ["h"] = 225.27
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul1"] = {
        ["coords"] = {
            ["x"] = -716.42,
            ["y"] = -864.63,
            ["z"] = 23.21 - Config.Minus1,
            ["h"] = 89.57
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul2"] = {
        ["coords"] = {
            ["x"] = -719.08,
            ["y"] = -897.89,
            ["z"] = 20.42 - Config.Minus1,
            ["h"] = 92.58
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul3"] = {
        ["coords"] = {
            ["x"] = -775.23,
            ["y"] = -891.55,
            ["z"] = 21.6 - Config.Minus1,
            ["h"] = 177.21
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul4"] = {
        ["coords"] = {
            ["x"] = -604.05,
            ["y"] = -773.96,
            ["z"] = 25.4 - Config.Minus1,
            ["h"] = 1.07
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul5"] = {
        ["coords"] = {
            ["x"] = -604.16,
            ["y"] = -783.4,
            ["z"] = 25.4 - Config.Minus1,
            ["h"] = 177.09
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul6"] = {
        ["coords"] = {
            ["x"] = -587.81,
            ["y"] = -783.43,
            ["z"] = 25.4 - Config.Minus1,
            ["h"] = 269.42
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul7"] = {
        ["coords"] = {
            ["x"] = -674.53,
            ["y"] = -999.95,
            ["z"] = 18.24 - Config.Minus1,
            ["h"] = 119.26
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["littleSeoul8"] = {
        ["coords"] = {
            ["x"] = -693.41,
            ["y"] = -1015.25,
            ["z"] = 16.42 - Config.Minus1,
            ["h"] = 115.23
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills1"] = {
        ["coords"] = {
            ["x"] = -873.33,
            ["y"] = 562.87,
            ["z"] = 96.62 - Config.Minus1,
            ["h"] = 312.73
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills2"] = {
        ["coords"] = {
            ["x"] = -884.54,
            ["y"] = 517.89,
            ["z"] = 92.44 - Config.Minus1,
            ["h"] = 105.6
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills3"] = {
        ["coords"] = {
            ["x"] = -947.86,
            ["y"] = 567.79,
            ["z"] = 101.51 - Config.Minus1,
            ["h"] = 162.92
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills4"] = {
        ["coords"] = {
            ["x"] = -1107.81,
            ["y"] = 594.48,
            ["z"] = 104.45 - Config.Minus1,
            ["h"] = 25.15
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills5"] = {
        ["coords"] = {
            ["x"] = -1146.47,
            ["y"] = 545.89,
            ["z"] = 101.91 - Config.Minus1,
            ["h"] = 185.07
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills6"] = {
        ["coords"] = {
            ["x"] = -1167.01,
            ["y"] = 568.68,
            ["z"] = 101.83 - Config.Minus1,
            ["h"] = 4.31
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills7"] = {
        ["coords"] = {
            ["x"] = -1307.99,
            ["y"] = 448.9,
            ["z"] = 100.97 - Config.Minus1,
            ["h"] = 176.46
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills8"] = {
        ["coords"] = {
            ["x"] = -1337.04,
            ["y"] = 606.21,
            ["z"] = 134.38 - Config.Minus1,
            ["h"] = 269.22
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills9"] = {
        ["coords"] = {
            ["x"] = -1255.41,
            ["y"] = 666.94,
            ["z"] = 142.82 - Config.Minus1,
            ["h"] = 24.07
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["vinewoodHills10"] = {
        ["coords"] = {
            ["x"] = -1248.78,
            ["y"] = 642.94,
            ["z"] = 142.72 - Config.Minus1,
            ["h"] = 117.41
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta1"] = {
        ["coords"] = {
            ["x"] = -1131.13,
            ["y"] = -1551.69,
            ["z"] = 4.6 - Config.Minus1,
            ["h"] = 304.35
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta2"] = {
        ["coords"] = {
            ["x"] = -1135.27,
            ["y"] = -1467.92,
            ["z"] = 4.63 - Config.Minus1,
            ["h"] = 305.46
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta3"] = {
        ["coords"] = {
            ["x"] = -1146.15,
            ["y"] = -1466.49,
            ["z"] = 4.5 - Config.Minus1,
            ["h"] = 88.36
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta4"] = {
        ["coords"] = {
            ["x"] = -1111.05,
            ["y"] = -1497.99,
            ["z"] = 4.67 - Config.Minus1,
            ["h"] = 36.88
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta5"] = {
        ["coords"] = {
            ["x"] = -1091.12,
            ["y"] = -1517.04,
            ["z"] = 4.83 - Config.Minus1,
            ["h"] = 305.21
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["laPuerta6"] = {
        ["coords"] = {
            ["x"] = -1057.04,
            ["y"] = -1551.22,
            ["z"] = 4.92 - Config.Minus1,
            ["h"] = 297.82
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["sanAndreas1"] = {
        ["coords"] = {
            ["x"] = -1114.04,
            ["y"] = -1579.62,
            ["z"] = 8.68 - Config.Minus1,
            ["h"] = 233.43
        },
        ["tier"] = 1,
        ["level"] = 5,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["downtownVinewood1"] = {
        ["coords"] = {
            ["x"] = 254.25,
            ["y"] = 24.63,
            ["z"] = 83.95 - Config.Minus1,
            ["h"] = 160.83
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["downtownVinewood2"] = {
        ["coords"] = {
            ["x"] = 201.05,
            ["y"] = 6.78,
            ["z"] = 79.38 - Config.Minus1,
            ["h"] = 346.16
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["downtownVinewood3"] = {
        ["coords"] = {
            ["x"] = 188.8,
            ["y"] = 11.07,
            ["z"] = 73.22 - Config.Minus1,
            ["h"] = 155.42
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["downtownVinewood4"] = {
        ["coords"] = {
            ["x"] = 191.1,
            ["y"] = 39.93,
            ["z"] = 87.82 - Config.Minus1,
            ["h"] = 342.81
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["downtownVinewood5"] = {
        ["coords"] = {
            ["x"] = 176.55,
            ["y"] = 45.23,
            ["z"] = 87.82 - Config.Minus1,
            ["h"] = 356.23
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman1"] = {
        ["coords"] = {
            ["x"] = -1873.39,
            ["y"] = 202.28,
            ["z"] = 84.33 - Config.Minus1,
            ["h"] = 305.19
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman2"] = {
        ["coords"] = {
            ["x"] = -1932.04,
            ["y"] = 162.65,
            ["z"] = 84.65 - Config.Minus1,
            ["h"] = 134.53
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman3"] = {
        ["coords"] = {
            ["x"] = -1961.21,
            ["y"] = 211.89,
            ["z"] = 86.81 - Config.Minus1,
            ["h"] = 114.02
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman4"] = {
        ["coords"] = {
            ["x"] = -1905.52,
            ["y"] = 252.76,
            ["z"] = 86.45 - Config.Minus1,
            ["h"] = 299.64
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman5"] = {
        ["coords"] = {
            ["x"] = -1970.65,
            ["y"] = 246.16,
            ["z"] = 87.78 - Config.Minus1,
            ["h"] = 108.0
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman6"] = {
        ["coords"] = {
            ["x"] = -1922.43,
            ["y"] = 298.58,
            ["z"] = 89.29 - Config.Minus1,
            ["h"] = 269.79
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["richman7"] = {
        ["coords"] = {
            ["x"] = -1995.4,
            ["y"] = 300.96,
            ["z"] = 91.95 - Config.Minus1,
            ["h"] = 14.77
        },
        ["tier"] = 3,
        ["level"] = 15,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["delperro"] = {
        ["coords"] = {
            ["x"] = -1286.84,
            ["y"] = -833.52,
            ["z"] = 17.1 - Config.Minus1,
            ["h"] = 125.7
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
    ["delperro2"] = {
        ["coords"] = {
            ["x"] = -1267.76,
            ["y"] = -812.07,
            ["z"] = 17.11 - Config.Minus1,
            ["h"] = 309.48
        },
        ["tier"] = 2,
        ["level"] = 10,
        
        ["AlarmStatus"] = true,
        ["AlarmChance"] = 15,
        ["AlarmSound"] = true,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 3.574, ["y"] = 7.871, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -0.498, ["y"] = 0.351, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 7.489, ["y"] = 4.024, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.580, ["y"] = 1.214, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.156, ["y"] = 3.015, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.297, ["y"] = -0.911, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.227, ["y"] = -1.225, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.592, ["y"] = 4.449, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -7.529, ["y"] = 7.856, ["z"] = 1.0 - Config.Minus1},
                ["icon"] = 'fas fa-search',
                ["text"] = "Search through shelves"
            },
        }
    },
}

Config.MaleNoGloves = { -- None gloves in men hand clothing (Change depending on your hand clothing numbers)
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
    [18] = true,
    [26] = true,
    [52] = true,
    [53] = true,
    [54] = true,
    [55] = true,
    [56] = true,
    [57] = true,
    [58] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [112] = true,
    [113] = true,
    [114] = true,
    [118] = true,
    [125] = true,
    [132] = true,
}

Config.FemaleNoGloves = { -- None gloves in women hand clothing (Change depending on your hand clothing numbers)
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [19] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [63] = true,
    [64] = true,
    [65] = true,
    [66] = true,
    [67] = true,
    [68] = true,
    [69] = true,
    [70] = true,
    [71] = true,
    [129] = true,
    [130] = true,
    [131] = true,
    [135] = true,
    [142] = true,
    [149] = true,
    [153] = true,
    [157] = true,
    [161] = true,
    [165] = true,
}

Config.MinZOffset = 45 -- (Dont touch this)
Config.Cooldowns = {} -- (Dont touch this)