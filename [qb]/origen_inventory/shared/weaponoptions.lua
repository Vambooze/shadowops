Config = Config or {}

if Config.repairWeapons then 
    Config.WeaponRepairPoints = {
        [1] = {
            coords = vector3(964.02, -1267.41, 34.97),
            IsRepairing = false,
            RepairingData = {},
            time = 1, -- Minutes
        }
    }

    Config.WeaponRepairCosts = {
        ["pistol"] = 1000,
        ["smg"] = 3000,
        ["mg"] = 4000,
        ["rifle"] = 5000,
        ["sniper"] = 7000,
        ["shotgun"] = 6000
    }

end

if not Config.WeaponSystem then return end
Config.DurabilityBlockedWeapons = {
    "weapon_stungun",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_unarmed",
}


Config.WeaponAttachments = {
    ["WEAPON_SNSPISTOL"] = {
        ["extendedclip"] = {
            component = "COMPONENT_SNSPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_VINTAGEPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_VINTAGEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_MICROSMG"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "smg_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_MICROSMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "smg_flashlight",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO",
            label = "Scope",
            item = "smg_scope",
        },
    },
    ["WEAPON_MINISMG"] = {
        ["extendedclip"] = {
            component = "COMPONENT_MINISMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
    },
    ["WEAPON_COMPACTRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },
        ["drummag"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_03",
            label = "Drum Mag",
            item = "rifle_drummag",
        },
    },
}


Config.DurabilityMultiplier = {
    -- Melee
    -- ['weapon_unarmed'] 				 = 0.15,
    ['weapon_dagger']                = 0.15,
    ['weapon_bat']                   = 0.15,
    ['weapon_bottle']                = 0.15,
    ['weapon_crowbar']               = 0.15,
    ['weapon_candycane']             = 0.15,
    -- ['weapon_flashlight'] 			 = 0.15,
    ['weapon_golfclub']              = 0.15,
    ['weapon_hammer']                = 0.15,
    ['weapon_hatchet']               = 0.15,
    ['weapon_knuckle']               = 0.15,
    ['weapon_knife']                 = 0.15,
    ['weapon_machete']               = 0.15,
    ['weapon_switchblade']           = 0.15,
    -- ['weapon_nightstick'] 			 = 0.15,
    ['weapon_wrench']                = 0.15,
    ['weapon_battleaxe']             = 0.15,
    ['weapon_poolcue']               = 0.15,
    ['weapon_briefcase']             = 0.15,
    ['weapon_briefcase_02']          = 0.15,
    ['weapon_garbagebag']            = 0.15,
    ['weapon_handcuffs']             = 0.15,
    ['weapon_bread']                 = 0.15,
    ['weapon_stone_hatchet']         = 0.15,

    -- Handguns
    ['weapon_pistol']                = 0.20,
    ['weapon_pistol_mk2']            = 0.15,
    ['weapon_combatpistol']          = 0.15,
    ['weapon_appistol']              = 0.15,
    -- ['weapon_stungun'] 				 = 0.15,
    -- ['weapon_stungun_mp'] 				 = 0.15,
    ['weapon_pistol50']              = 0.15,
    ['weapon_snspistol']             = 0.15,
    ['weapon_heavypistol']           = 0.15,
    ['weapon_vintagepistol']         = 0.15,
    ['weapon_flaregun']              = 0.15,
    ['weapon_marksmanpistol']        = 0.15,
    ['weapon_revolver']              = 0.15,
    ['weapon_revolver_mk2']          = 0.15,
    ['weapon_doubleaction']          = 0.15,
    ['weapon_snspistol_mk2']         = 0.15,
    ['weapon_raypistol']             = 0.15,
    ['weapon_ceramicpistol']         = 0.15,
    ['weapon_navyrevolver']          = 0.15,
    ['weapon_gadgetpistol']          = 0.15,
    ['weapon_pistolxm3']             = 0.15,

    -- Submachine Guns
    ['weapon_microsmg']              = 0.15,
    ['weapon_smg']                   = 0.15,
    ['weapon_smg_mk2']               = 0.15,
    ['weapon_assaultsmg']            = 0.15,
    ['weapon_combatpdw']             = 0.15,
    ['weapon_machinepistol']         = 0.15,
    ['weapon_minismg']               = 0.15,
    ['weapon_raycarbine']            = 0.15,

    -- Shotguns
    ['weapon_pumpshotgun']           = 0.15,
    ['weapon_sawnoffshotgun']        = 0.15,
    ['weapon_assaultshotgun']        = 0.15,
    ['weapon_bullpupshotgun']        = 0.15,
    ['weapon_musket']                = 0.15,
    ['weapon_heavyshotgun']          = 0.15,
    ['weapon_dbshotgun']             = 0.15,
    ['weapon_autoshotgun']           = 0.15,
    ['weapon_pumpshotgun_mk2']       = 0.15,
    ['weapon_combatshotgun']         = 0.15,

    -- Assault Rifles
    ['weapon_assaultrifle']          = 0.15,
    ['weapon_assaultrifle_mk2']      = 0.15,
    ['weapon_carbinerifle']          = 0.15,
    ['weapon_carbinerifle_mk2']      = 0.15,
    ['weapon_advancedrifle']         = 0.15,
    ['weapon_specialcarbine']        = 0.15,
    ['weapon_bullpuprifle']          = 0.15,
    ['weapon_compactrifle']          = 0.15,
    ['weapon_specialcarbine_mk2']    = 0.15,
    ['weapon_bullpuprifle_mk2']      = 0.15,
    ['weapon_militaryrifle']         = 0.15,
    ['weapon_heavyrifle']            = 0.15,

    -- Light Machine Guns
    ['weapon_mg']                    = 0.15,
    ['weapon_combatmg']              = 0.15,
    ['weapon_gusenberg']             = 0.15,
    ['weapon_combatmg_mk2']          = 0.15,

    -- Sniper Rifles
    ['weapon_sniperrifle']           = 0.15,
    ['weapon_heavysniper']           = 0.15,
    ['weapon_marksmanrifle']         = 0.15,
    ['weapon_remotesniper']          = 0.15,
    ['weapon_heavysniper_mk2']       = 0.15,
    ['weapon_marksmanrifle_mk2']     = 0.15,

    -- Heavy Weapons
    ['weapon_rpg']                   = 0.15,
    ['weapon_grenadelauncher']       = 0.15,
    ['weapon_grenadelauncher_smoke'] = 0.15,
    ['weapon_emplauncher']           = 0.15,
    ['weapon_minigun']               = 0.15,
    ['weapon_firework']              = 0.15,
    ['weapon_railgun']               = 0.15,
    ['weapon_hominglauncher']        = 0.15,
    ['weapon_compactlauncher']       = 0.15,
    ['weapon_rayminigun']            = 0.15,
    ['weapon_railgunxm3']            = 0.15,

    -- Throwables
    ['weapon_grenade']               = 0.15,
    ['weapon_bzgas']                 = 0.15,
    ['weapon_molotov']               = 0.15,
    ['weapon_stickybomb']            = 0.15,
    ['weapon_proxmine']              = 0.15,
    ['weapon_snowball']              = 0.15,
    ['weapon_pipebomb']              = 0.15,
    ['weapon_ball']                  = 0.15,
    ['weapon_smokegrenade']          = 0.15,
    ['weapon_flare']                 = 0.15,

    -- Miscellaneous
    ['weapon_petrolcan']             = 0.15,
    ['weapon_fireextinguisher']      = 0.15,
    ['weapon_hazardcan']             = 0.15,
    ['weapon_fertilizercan']         = 0.15,
}

