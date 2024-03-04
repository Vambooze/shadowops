-- Created by Scully | Join my discord for support, discounts, giveaways and update alerts: https://discord.gg/scully
-- If you didn't get your customer role automatically do /claim or open a ticket :)
Config = {
    -- ANIMATIONS --
    EnableGangsterAnim = true, -- Set to false if you don't want to use a gangster animation if you don't have a holster.
    MovementFlag = 49, -- Set to 30 if you don't want the player to be able to move when doing an animation.
    TrunkMovementFlag = 30, -- Set to 49 if you want the player to be able to move when reaching into the trunk.
    SwitchCommand = '', -- Add a command name here if you want players to choose an animation with a command instead of it being automatic. Usage /command 1 or 2
    ReachKeybind = 'g', -- Set to '' if you don't want to allow players to do a reaching animation.
    EnableReachRestriction = true, -- Set to false if you want people without a holster to be able to do the reaching animation.
    UseAcePerm = false, -- Set to false if you don't want to whitelist the holster animation without a holster clothing item to cops.
    -- HOLSTER MISC --
    EnableBetterFlashlight = true, -- Set to false if you want your flashlight to turn off when you stop aiming.
    EnableAutoReload = false, -- Enable if you want to allow your weapons to auto reload.
    -- WEAPON CLASS ANIMATIONS --
    WeaponClasses = { -- true = holster animation, false = gangster animation
        [2685387236] = true, -- Melee
        [416676503] = true, -- Handgun
        [-1609580060] = true, -- Handgun 2
        [-957766203] = false, -- SMG
        [860033945] = false, -- Shotgun
        [970310034] = false, -- AR
        [1159398588] = false, -- LMG
        [3082541095] = false, -- Sniper
        [2725924767] = false, -- Heavy
        [1548507267] = true, -- Throwables
        [4257178988] = false -- Misc
    },
    -- EUP Holsters --
    EnableDynamicHolsters = true, -- Set to false if you don't want the holster to change when changing weapons.
    Holsters = { -- Add your holster EUP numbers below, don't ask for assistance with this as every server is different.
        Male = {
            [7] = { -- The clothing drawable ID: https://docs.fivem.net/natives/?_0x67F3780DD425D4FC
                {Main = 1, Empty = 3}, {Main = 6, Empty = 5}, {Main = 8, Empty = 2}, -- You need to have a holster that is empty and not empty for this to work properly with each entry.
            }
        },
        Female = {
            [7] = {
                {Main = 8, Empty = 2},
            }
        }
    },
    -- DYNAMIC BELTS --
    -- These numbers are from game build 2944 with the belts started before any other add-on EUP. If you aren't doing that you will need to adjust them.
    DynamicBelts = { -- Add your EUP numbers for dynamic belts in each section below by default this is configured for the latest tls belt pack, don't ask for assistance with this as every server is different.
        Enable = true,
        Weapons = {
            [`WEAPON_STUNGUN`] = 'Taser',
            [`WEAPON_STUNGUN_MP`] = 'Taser',
            [`WEAPON_NIGHTSTICK`] = 'Baton',
            [`WEAPON_FLASHLIGHT`] = 'Flashlight'
        },
        Variations = {
            Male = {
                { -- Variant 1
                    DrawableID = 8, -- The clothing drawable ID: https://docs.fivem.net/natives/?_0x67F3780DD425D4FC
                    Main = 199,
                    Taser = 200,
                    Baton = 201,
                    Flashlight = 202
                },
                { -- Variant 2
                    DrawableID = 8,
                    Main = 203,
                    Taser = 204,
                    Baton = 205,
                    Flashlight = 206
                },
                { -- Variant 3
                    DrawableID = 8,
                    Main = 207,
                    Flashlight = 208
                },
                { -- Variant 4
                    DrawableID = 8,
                    Main = 209,
                    Taser = 210
                },
                { -- Variant 5
                    DrawableID = 8,
                    Main = 211,
                    Taser = 212,
                    Baton = 213
                },
                { -- Variant 6
                    DrawableID = 8,
                    Main = 214,
                    Taser = 215,
                    Baton = 216
                },
                { -- Variant 7
                    DrawableID = 8,
                    Main = 217,
                    Baton = 218,
                    Flashlight = 219
                },
                { -- Variant 8
                    DrawableID = 8,
                    Main = 221,
                    Taser = 222,
                    Baton = 223,
                    Flashlight = 224
                },
                { -- Variant 9
                    DrawableID = 8,
                    Main = 225,
                    Taser = 226,
                    Baton = 227,
                    Flashlight = 228
                },
                { -- Variant 10
                    DrawableID = 8,
                    Main = 229,
                    Flashlight = 230
                },
                { -- Variant 11
                    DrawableID = 8,
                    Main = 231,
                    Taser = 232
                },
                { -- Variant 12
                    DrawableID = 8,
                    Main = 233,
                    Taser = 234,
                    Baton = 235
                },
                { -- Variant 13
                    DrawableID = 8,
                    Main = 236,
                    Taser = 237,
                    Baton = 238
                },
                { -- Variant 14
                    DrawableID = 8,
                    Main = 239,
                    Baton = 240,
                    Flashlight = 241
                },
            },
            Female = {
                { -- Variant 1
                    DrawableID = 8,
                    Main = 245,
                    Taser = 246,
                    Baton = 247,
                    Flashlight = 248
                },
                { -- Variant 2
                    DrawableID = 8,
                    Main = 249,
                    Taser = 250,
                    Baton = 251,
                    Flashlight = 252
                },
                { -- Variant 3
                    DrawableID = 8,
                    Main = 253,
                    Flashlight = 254
                },
                { -- Variant 4
                    DrawableID = 8,
                    Main = 255,
                    Taser = 256
                },
                { -- Variant 5
                    DrawableID = 8,
                    Main = 257,
                    Taser = 258,
                    Baton = 259
                },
                { -- Variant 6
                    DrawableID = 8,
                    Main = 260,
                    Taser = 261,
                    Baton = 262
                },
                { -- Variant 7
                    DrawableID = 8,
                    Main = 263,
                    Baton = 264,
                    Flashlight = 265
                },
                { -- Variant 8
                    DrawableID = 8,
                    Main = 267,
                    Taser = 268,
                    Baton = 269,
                    Flashlight = 270
                },
                { -- Variant 9
                    DrawableID = 8,
                    Main = 271,
                    Taser = 272,
                    Baton = 273,
                    Flashlight = 274
                },
                { -- Variant 10
                    DrawableID = 8,
                    Main = 275,
                    Flashlight = 276
                },
                { -- Variant 11
                    DrawableID = 8,
                    Main = 277,
                    Taser = 278
                },
                { -- Variant 12
                    DrawableID = 8,
                    Main = 279,
                    Taser = 280,
                    Baton = 281
                },
                { -- Variant 13
                    DrawableID = 8,
                    Main = 282,
                    Taser = 283,
                    Baton = 284
                },
                { -- Variant 14
                    DrawableID = 8,
                    Main = 285,
                    Baton = 286,
                    Flashlight = 287
                },
            }
        }
    },
    -- Bypass Weapons --
    BypassWeapons = { -- You only need to add weapons here that you want to disable the animations with, keep in mind scenario props are considered weapons in GTA so add them here.
        [`WEAPON_PETROLCAN`] = true,
        [`WEAPON_NIGHTSTICK`] = true,
        [`WEAPON_STUNGUN`] = true,
        [966099553] = true, -- Binoculars
    },
    -- Trunk & Bag Requirement --
    EnableRequirement = true, -- Set to false if you don't want certain weapons to require a trunk or bag.
    Weapons = { -- You can add whatever weapons you use on your server here, I have provided some examples:
        [`WEAPON_ASSAULTRIFLE`] = {
            Trunk = true,
            Bag = false
        },
        [`WEAPON_CARBINERIFLE`] = {
            Trunk = true,
            Bag = false
        },
        [`WEAPON_SMG`] = {
            Trunk = true,
            Bag = true
        },
    },
    Bags = { -- You can add whatever bags you want to allow on your server here, I have provided some examples:
        [44] = true,
        [45] = true
    },
    -- Throwable Weapons --
    Throwables = { -- You can add whatever throwables you want to allow quick throwing by holding G with here.
        [`WEAPON_GRENADE`] = true,
        [`WEAPON_BZGAS`] = true,
        [`WEAPON_MOLOTOV`] = true,
        [`WEAPON_STICKYBOMB`] = true,
        [`WEAPON_PROXMINE`] = true,
        [`WEAPON_SNOWBALL`] = true,
        [`WEAPON_PIPEBOMB`] = true,
        [`WEAPON_BALL`] = true,
        [`WEAPON_SMOKEGRENADE`] = true,
        [`WEAPON_FLARE`] = true
    },
    -- Blacklisted Weapons --
    EnableBlacklist = true, -- Set to false if you don't want certain weapons to be allowed.
    Blacklisted = { -- You can add whatever weapons you want blacklisted here, I have provided some examples:
        [`WEAPON_GRENADE`] = true,
        [`WEAPON_RPG`] = true
    },
    -- Misc --
    UseCustomNotifications = false, -- Enable if you want to use your own notification system then implement it below.
    CustomNotification = function(text)
        -- Add your notification system here.
    end,
    Language = {
        Blacklisted = '~r~That weapon is blacklisted!',
        NeedBag = '~r~You need a bag to pull out this weapon!',
        NeedTrunk = '~r~You need a trunk to pull out this weapon!',
        WeaponReach = 'Weapon Reach',
        ChangedAnim = '~g~You changed your holster animation!',
        NotValid = '~r~That is not a valid option!',
        WeaponAnim = 'Weapon Animations',
        WeaponAnimMenu = 'Weapon Animation Menu',
        Default = 'Default',
        Gang = 'Gang',
        Hillbilly = 'Hillbilly',
        SlingFirst = '~r~You need to sling your current weapon first!'
    }
}