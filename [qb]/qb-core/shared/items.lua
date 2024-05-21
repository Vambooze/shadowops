QBShared = QBShared or {}
QBShared.Items = {
    -- WEAPONS
    -- Melee
    weapon_unarmed               = { name = 'weapon_unarmed', label = 'Fists', weight = 1000, type = 'weapon', ammotype = nil, image = 'placeholder.png', unique = true, useable = false, description = 'Fisticuffs' },
    weapon_dagger                = { name = 'weapon_dagger', label = 'Dagger', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_dagger.png', unique = true, useable = false, description = 'A short knife with a pointed and edged blade, used as a weapon' },
    weapon_bat                   = { name = 'weapon_bat', label = 'Bat', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bat.png', unique = true, useable = false, description = 'Used for hitting a ball in sports (or other things)' },
    weapon_bottle                = { name = 'weapon_bottle', label = 'Broken Bottle', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bottle.png', unique = true, useable = false, description = 'A broken bottle' },
    weapon_crowbar               = { name = 'weapon_crowbar', label = 'Crowbar', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_crowbar.png', unique = true, useable = false, description = 'An iron bar with a flattened end, used as a lever' },
    weapon_flashlight            = { name = 'weapon_flashlight', label = 'Flashlight', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_flashlight.png', unique = true, useable = false, description = 'A battery-operated portable light' },
    weapon_golfclub              = { name = 'weapon_golfclub', label = 'Golfclub', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_golfclub.png', unique = true, useable = false, description = 'A club used to hit the ball in golf' },
    weapon_hammer                = { name = 'weapon_hammer', label = 'Hammer', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_hammer.png', unique = true, useable = false, description = 'Used for jobs such as breaking things (legs) and driving in nails' },
    weapon_hatchet               = { name = 'weapon_hatchet', label = 'Hatchet', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_hatchet.png', unique = true, useable = false, description = 'A small axe with a short handle for use in one hand' },
    weapon_knuckle               = { name = 'weapon_knuckle', label = 'Knuckle', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_knuckle.png', unique = true, useable = false, description = 'A metal guard worn over the knuckles in fighting, especially to increase the effect of the blows' },
    weapon_knife                 = { name = 'weapon_knife', label = 'Knife', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_knife.png', unique = true, useable = false, description = 'An instrument composed of a blade fixed into a handle, used for cutting or as a weapon' },
    weapon_machete               = { name = 'weapon_machete', label = 'Machete', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_machete.png', unique = true, useable = false, description = 'A broad, heavy knife used as a weapon' },
    weapon_switchblade           = { name = 'weapon_switchblade', label = 'Switchblade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_switchblade.png', unique = true, useable = false, description = 'A knife with a blade that springs out from the handle when a button is pressed' },
    weapon_nightstick            = { name = 'weapon_nightstick', label = 'Nightstick', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_nightstick.png', unique = true, useable = false, description = 'A police officer\'s club or billy' },
    weapon_wrench                = { name = 'weapon_wrench', label = 'Wrench', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_wrench.png', unique = true, useable = false, description = 'A tool used for gripping and turning nuts, bolts, pipes, etc' },
    weapon_battleaxe             = { name = 'weapon_battleaxe', label = 'Battle Axe', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_battleaxe.png', unique = true, useable = false, description = 'A large broad-bladed axe used in ancient warfare' },
    weapon_poolcue               = { name = 'weapon_poolcue', label = 'Poolcue', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_poolcue.png', unique = true, useable = false, description = 'A stick used to strike a ball, usually the cue ball (or other things)' },
    weapon_briefcase             = { name = 'weapon_briefcase', label = 'Briefcase', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_briefcase.png', unique = true, useable = false, description = 'A briefcase for storing important documents' },
    weapon_briefcase_02          = { name = 'weapon_briefcase_02', label = 'Suitcase', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_briefcase2.png', unique = true, useable = false, description = 'Wonderfull for nice vacation to Liberty City' },
    weapon_garbagebag            = { name = 'weapon_garbagebag', label = 'Garbage Bag', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_garbagebag.png', unique = true, useable = false, description = 'A garbage bag' },
    weapon_handcuffs             = { name = 'weapon_handcuffs', label = 'Handcuffs', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_handcuffs.png', unique = true, useable = false, description = 'A pair of lockable linked metal rings for securing a prisoner\'s wrists' },
    weapon_bread                 = { name = 'weapon_bread', label = 'Baquette', weight = 1000, type = 'weapon', ammotype = nil, image = 'baquette.png', unique = true, useable = false, description = 'Bread...?' },
    weapon_stone_hatchet         = { name = 'weapon_stone_hatchet', label = 'Stone Hatchet', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stone_hatchet.png', unique = true, useable = true, description = 'Stone Hatchet' },
    weapon_candycane             = { name = 'weapon_candycane', label = 'Candy Cane', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_candycane', unique = true, useable = true, description = 'Candy Cane' },

    -- Handguns
    weapon_fnx45                 = { name = 'weapon_fnx45', label = 'FN FNX45', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol.png', unique = true, useable = false, description = 'A small firearm designed to be held in one hand' },
    weapon_pistol                = { name = 'weapon_pistol', label = 'Walther P99', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol.png', unique = true, useable = false, description = 'A small firearm designed to be held in one hand' },
    weapon_pistol_mk2            = { name = 'weapon_pistol_mk2', label = 'Pistol Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol_mk2.png', unique = true, useable = false, description = 'An upgraded small firearm designed to be held in one hand' },
    weapon_combatpistol          = { name = 'weapon_combatpistol', label = 'Glock 19', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_combatpistol.png', unique = true, useable = false, description = 'A combat version small firearm designed to be held in one hand' },
    weapon_appistol              = { name = 'weapon_appistol', label = 'Glock 18C', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_appistol.png', unique = true, useable = false, description = 'A small firearm designed to be held in one hand that is automatic' },
    weapon_stungun               = { name = 'weapon_stungun', label = 'x26 Taser', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stungun.png', unique = true, useable = false, description = 'A weapon firing barbs attached by wires to batteries, causing temporary paralysis' },
    weapon_pistol50              = { name = 'weapon_pistol50', label = 'Pistol .50', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol50.png', unique = true, useable = false, description = 'A .50 caliber firearm designed to be held with both hands' },
    weapon_snspistol             = { name = 'weapon_snspistol', label = 'SNS Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_snspistol.png', unique = true, useable = false, description = 'A very small firearm designed to be easily concealed' },
    weapon_heavypistol           = { name = 'weapon_heavypistol', label = 'Heavy Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_heavypistol.png', unique = true, useable = false, description = 'A hefty firearm designed to be held in one hand (or attempted)' },
    weapon_vintagepistol         = { name = 'weapon_vintagepistol', label = 'Vintage Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_vintagepistol.png', unique = true, useable = false, description = 'An antique firearm designed to be held in one hand' },
    weapon_flaregun              = { name = 'weapon_flaregun', label = 'Flare Gun', weight = 1000, type = 'weapon', ammotype = 'AMMO_FLARE', image = 'weapon_flaregun.png', unique = true, useable = false, description = 'A handgun for firing signal rockets' },
    weapon_marksmanpistol        = { name = 'weapon_marksmanpistol', label = 'Marksman Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_marksmanpistol.png', unique = true, useable = false, description = 'A very accurate small firearm designed to be held in one hand' },
    weapon_revolver              = { name = 'weapon_revolver', label = 'Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_revolver.png', unique = true, useable = false, description = 'A pistol with revolving chambers enabling several shots to be fired without reloading' },
    weapon_revolver_mk2          = { name = 'weapon_revolver_mk2', label = 'Taurus RagingBull', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_revolver_mk2.png', unique = true, useable = true, description = 'da Violence' },
    weapon_doubleaction          = { name = 'weapon_doubleaction', label = 'Colt Python', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_doubleaction.png', unique = true, useable = true, description = 'Double Action Revolver' },
    weapon_snspistol_mk2         = { name = 'weapon_snspistol_mk2', label = 'SNS Pistol Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_snspistol_mk2.png', unique = true, useable = true, description = 'SNS Pistol MK2' },
    weapon_raypistol             = { name = 'weapon_raypistol', label = 'Up-n-Atomizer', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_raypistol.png', unique = true, useable = true, description = 'Weapon Raypistol' },
    weapon_ceramicpistol         = { name = 'weapon_ceramicpistol', label = 'Ceramic Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_ceramicpistol.png', unique = true, useable = true, description = 'Weapon Ceramicpistol' },
    weapon_navyrevolver          = { name = 'weapon_navyrevolver', label = 'Navy Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_navyrevolver.png', unique = true, useable = true, description = 'Weapon Navyrevolver' },
    weapon_gadgetpistol          = { name = 'weapon_gadgetpistol', label = 'Perico Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_gadgetpistol.png', unique = true, useable = true, description = 'Weapon Gadgetpistol' },
    weapon_pistolxm3             = { name = 'weapon_pistolxm3', label = 'Pistol XM3', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistolxm3.png', unique = true, useable = true, description = 'Pistol XM3' },

    -- Submachine Guns
    weapon_microsmg              = { name = 'weapon_microsmg', label = 'Micro SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_microsmg.png', unique = true, useable = false, description = 'A handheld light                                                                                                                                                                                                                                                                                                                                                            weight machine gun' },
    weapon_smg                   = { name = 'weapon_smg', label = 'SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_smg.png', unique = true, useable = false, description = 'A handheld light                                                                                                                                                                                                                                                                                                                                                                 weight machine gun' },
    weapon_smg_mk2               = { name = 'weapon_smg_mk2', label = 'SMG Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_smg_mk2.png', unique = true, useable = true, description = 'SMG MK2' },
    weapon_assaultsmg            = { name = 'weapon_assaultsmg', label = 'Assault SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_assaultsmg.png', unique = true, useable = false, description = 'An assault version of a handheld light                                                                                                                                                                                                                                                                                                                                    weight machine gun' },
    weapon_combatpdw             = { name = 'weapon_combatpdw', label = 'Combat PDW', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_combatpdw.png', unique = true, useable = false, description = 'A combat version of a handheld light                                                                                                                                                                                                                                                                                                                                       weight machine gun' },
    weapon_machinepistol         = { name = 'weapon_machinepistol', label = 'Tec-9', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_machinepistol.png', unique = true, useable = false, description = 'A self-loading pistol capable of burst or fully automatic fire' },
    weapon_minismg               = { name = 'weapon_minismg', label = 'Mini SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_minismg.png', unique = true, useable = false, description = 'A mini handheld light                                                                                                                                                                                                                                                                                                                                                        weight machine gun' },
    weapon_raycarbine            = { name = 'weapon_raycarbine', label = 'Unholy Hellbringer', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_raycarbine.png', unique = true, useable = true, description = 'Weapon Raycarbine' },

    -- Shotguns
    weapon_pumpshotgun           = { name = 'weapon_pumpshotgun', label = 'Pump Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_pumpshotgun.png', unique = true, useable = false, description = 'A pump-action smoothbore gun for firing small shot at short range' },
    weapon_sawnoffshotgun        = { name = 'weapon_sawnoffshotgun', label = 'Sawn-off Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_sawnoffshotgun.png', unique = true, useable = false, description = 'A sawn-off smoothbore gun for firing small shot at short range' },
    weapon_assaultshotgun        = { name = 'weapon_assaultshotgun', label = 'Assault Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_assaultshotgun.png', unique = true, useable = false, description = 'An assault version of asmoothbore gun for firing small shot at short range' },
    weapon_bullpupshotgun        = { name = 'weapon_bullpupshotgun', label = 'Bullpup Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_bullpupshotgun.png', unique = true, useable = false, description = 'A compact smoothbore gun for firing small shot at short range' },
    weapon_musket                = { name = 'weapon_musket', label = 'Musket', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_musket.png', unique = true, useable = false, description = 'An infantryman\'s light gun with a long barrel, typically smooth-bored, muzzleloading, and fired from the shoulder' },
    weapon_heavyshotgun          = { name = 'weapon_heavyshotgun', label = 'Heavy Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_heavyshotgun.png', unique = true, useable = false, description = 'A large smoothbore gun for firing small shot at short range' },
    weapon_dbshotgun             = { name = 'weapon_dbshotgun', label = 'Double-barrel Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_dbshotgun.png', unique = true, useable = false, description = 'A shotgun with two parallel barrels, allowing two single shots to be fired in quick succession' },
    weapon_autoshotgun           = { name = 'weapon_autoshotgun', label = 'Auto Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_autoshotgun.png', unique = true, useable = false, description = 'A shotgun capable of rapid continous fire' },
    weapon_pumpshotgun_mk2       = { name = 'weapon_pumpshotgun_mk2', label = 'Pumpshotgun Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_pumpshotgun_mk2.png', unique = true, useable = true, description = 'Pumpshotgun MK2' },
    weapon_combatshotgun         = { name = 'weapon_combatshotgun', label = 'Combat Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_combatshotgun.png', unique = true, useable = true, description = 'Weapon Combatshotgun' },

    -- Assault Rifles
    weapon_scarh                 = { name = 'weapon_scarh', label = 'PD SCARH', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_assaultrifle.png', unique = true, useable = false, description = 'A rapid-fire, magazine-fed automatic rifle designed for infantry use' },
    weapon_assaultrifle          = { name = 'weapon_assaultrifle', label = 'Assault Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_assaultrifle.png', unique = true, useable = false, description = 'A rapid-fire, magazine-fed automatic rifle designed for infantry use' },
    weapon_assaultrifle_mk2      = { name = 'weapon_assaultrifle_mk2', label = 'Assault Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_assaultrifle_mk2.png', unique = true, useable = true, description = 'Assault Rifle MK2' },
    weapon_carbinerifle          = { name = 'weapon_carbinerifle', label = 'PD M4', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_carbinerifle.png', unique = true, useable = false, description = 'A light                                                                                                                                                                                                                                                                                                                                                               weight automatic rifle' },
    weapon_carbinerifle_mk2      = { name = 'weapon_carbinerifle_mk2', label = 'Carbine Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_carbinerifle_mk2.png', unique = true, useable = true, description = 'Carbine Rifle MK2' },
    weapon_advancedrifle         = { name = 'weapon_advancedrifle', label = 'Advanced Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_advancedrifle.png', unique = true, useable = false, description = 'An assault version of a rapid-fire, magazine-fed automatic rifle designed for infantry use' },
    weapon_specialcarbine        = { name = 'weapon_specialcarbine', label = 'Special Carbine', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_specialcarbine.png', unique = true, useable = false, description = 'An extremely versatile assault rifle for any combat situation' },
    weapon_bullpuprifle          = { name = 'weapon_bullpuprifle', label = 'Bullpup Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_bullpuprifle.png', unique = true, useable = false, description = 'A compact automatic assault rifle' },
    weapon_compactrifle          = { name = 'weapon_compactrifle', label = 'Compact Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_compactrifle.png', unique = true, useable = false, description = 'A compact version of an assault rifle' },
    weapon_specialcarbine_mk2    = { name = 'weapon_specialcarbine_mk2', label = 'Special Carbine Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_specialcarbine_mk2.png', unique = true, useable = true, description = 'Weapon Wpecialcarbine MK2' },
    weapon_bullpuprifle_mk2      = { name = 'weapon_bullpuprifle_mk2', label = 'Bullpup Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_bullpuprifle_mk2.png', unique = true, useable = true, description = 'Bull Puprifle MK2' },
    weapon_militaryrifle         = { name = 'weapon_militaryrifle', label = 'Military Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_militaryrifle.png', unique = true, useable = true, description = 'Weapon Militaryrifle' },

    -- Light Machine Guns
    weapon_mg                    = { name = 'weapon_mg', label = 'Machinegun', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_mg.png', unique = true, useable = false, description = 'An automatic gun that fires bullets in rapid succession for as long as the trigger is pressed' },
    weapon_combatmg              = { name = 'weapon_combatmg', label = 'Combat MG', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_combatmg.png', unique = true, useable = false, description = 'A combat version of an automatic gun that fires bullets in rapid succession for as long as the trigger is pressed' },
    weapon_gusenberg             = { name = 'weapon_gusenberg', label = 'Thompson SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_gusenberg.png', unique = true, useable = false, description = 'An automatic rifle commonly referred to as a tommy gun' },
    weapon_combatmg_mk2          = { name = 'weapon_combatmg_mk2', label = 'Combat MG Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_combatmg_mk2.png', unique = true, useable = true, description = 'Weapon Combatmg MK2' },

    -- Sniper Rifles
    weapon_sniperrifle           = { name = 'weapon_sniperrifle', label = 'Sniper Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_sniperrifle.png', unique = true, useable = false, description = 'A high-precision, long-range rifle' },
    weapon_heavysniper           = { name = 'weapon_heavysniper', label = 'Heavy Sniper', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_heavysniper.png', unique = true, useable = false, description = 'An upgraded high-precision, long-range rifle' },
    weapon_marksmanrifle         = { name = 'weapon_marksmanrifle', label = 'Marksman Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_marksmanrifle.png', unique = true, useable = false, description = 'A very accurate single-fire rifle' },
    weapon_remotesniper          = { name = 'weapon_remotesniper', label = 'Remote Sniper', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER_REMOTE', image = 'weapon_remotesniper.png', unique = true, useable = false, description = 'A portable high-precision, long-range rifle' },
    weapon_heavysniper_mk2       = { name = 'weapon_heavysniper_mk2', label = 'Heavy Sniper Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_heavysniper_mk2.png', unique = true, useable = true, description = 'Weapon Heavysniper MK2' },
    weapon_marksmanrifle_mk2     = { name = 'weapon_marksmanrifle_mk2', label = 'Marksman Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_marksmanrifle_mk2.png', unique = true, useable = true, description = 'Weapon Marksmanrifle MK2' },

    -- Heavy Weapons
    weapon_rpg                   = { name = 'weapon_rpg', label = 'RPG', weight = 1000, type = 'weapon', ammotype = 'AMMO_RPG', image = 'weapon_rpg.png', unique = true, useable = false, description = 'A rocket-propelled grenade launcher' },
    weapon_grenadelauncher       = { name = 'weapon_grenadelauncher', label = 'Grenade Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_GRENADELAUNCHER', image = 'weapon_grenadelauncher.png', unique = true, useable = false, description = 'A weapon that fires a specially-designed large-caliber projectile, often with an explosive, smoke or gas warhead' },
    weapon_grenadelauncher_smoke = { name = 'weapon_grenadelauncher_smoke', label = 'Smoke Grenade Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_GRENADELAUNCHER', image = 'weapon_smokegrenade.png', unique = true, useable = false, description = 'A bomb that produces a lot of smoke when it explodes' },
    weapon_minigun               = { name = 'weapon_minigun', label = 'Minigun', weight = 1000, type = 'weapon', ammotype = 'AMMO_MINIGUN', image = 'weapon_minigun.png', unique = true, useable = false, description = 'A portable machine gun consisting of a rotating cluster of six barrels and capable of variable rates of fire of up to 6,000 rounds per minute' },
    weapon_firework              = { name = 'weapon_firework', label = 'Firework Launcher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_firework.png', unique = true, useable = false, description = 'A device containing gunpowder and other combustible chemicals that causes a spectacular explosion when ignited' },
    weapon_railgun               = { name = 'weapon_railgun', label = 'Railgun', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_railgun.png', unique = true, useable = false, description = 'A weapon that uses electromagnetic force to launch high velocity projectiles' },
    weapon_railgunxm3            = { name = 'weapon_railgunxm3', label = 'Railgun XM3', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_railgunxm3.png', unique = true, useable = false, description = 'A weapon that uses electromagnetic force to launch high velocity projectiles' },
    weapon_hominglauncher        = { name = 'weapon_hominglauncher', label = 'Homing Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_STINGER', image = 'weapon_hominglauncher.png', unique = true, useable = false, description = 'A weapon fitted with an electronic device that enables it to find and hit a target' },
    weapon_compactlauncher       = { name = 'weapon_compactlauncher', label = 'Compact Launcher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_compactlauncher.png', unique = true, useable = false, description = 'A compact grenade launcher' },
    weapon_rayminigun            = { name = 'weapon_rayminigun', label = 'Widowmaker', weight = 1000, type = 'weapon', ammotype = 'AMMO_MINIGUN', image = 'weapon_rayminigun.png', unique = true, useable = true, description = 'Weapon Rayminigun' },

    -- Throwables
    weapon_grenade               = { name = 'weapon_grenade', label = 'Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_grenade.png', unique = true, useable = false, description = 'A handheld throwable bomb' },
    weapon_bzgas                 = { name = 'weapon_bzgas', label = 'BZ Gas', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bzgas.png', unique = true, useable = false, description = 'A cannister of gas that causes extreme pain' },
    weapon_molotov               = { name = 'weapon_molotov', label = 'Molotov', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_molotov.png', unique = true, useable = false, description = 'A crude bomb made of a bottle filled with a flammable liquid and fitted with a wick for lighting' },
    weapon_stickybomb            = { name = 'weapon_stickybomb', label = 'C4', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stickybomb.png', unique = true, useable = false, description = 'An explosive charge covered with an adhesive that when thrown against an object sticks until it explodes' },
    weapon_proxmine              = { name = 'weapon_proxmine', label = 'Proxmine Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_proximitymine.png', unique = true, useable = false, description = 'A bomb placed on the ground that detonates when going within its proximity' },
    weapon_snowball              = { name = 'weapon_snowball', label = 'Snowball', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_snowball.png', unique = true, useable = false, description = 'A ball of packed snow, especially one made for throwing at other people for fun' },
    weapon_pipebomb              = { name = 'weapon_pipebomb', label = 'Pipe Bomb', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_pipebomb.png', unique = true, useable = false, description = 'A homemade bomb, the components of which are contained in a pipe' },
    weapon_ball                  = { name = 'weapon_ball', label = 'Ball', weight = 1000, type = 'weapon', ammotype = 'AMMO_BALL', image = 'weapon_ball.png', unique = true, useable = false, description = 'A solid or hollow spherical or egg-shaped object that is kicked, thrown, or hit in a game' },
    weapon_smokegrenade          = { name = 'weapon_smokegrenade', label = 'Smoke Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_c4.png', unique = true, useable = false, description = 'An explosive charge that can be remotely detonated' },
    weapon_flare                 = { name = 'weapon_flare', label = 'Flare pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_FLARE', image = 'weapon_flare.png', unique = true, useable = false, description = 'A small pyrotechnic devices used for illumination and signalling' },

    -- Miscellaneous
    weapon_petrolcan             = { name = 'weapon_petrolcan', label = 'Petrol Can', weight = 1000, type = 'weapon', ammotype = 'AMMO_PETROLCAN', image = 'weapon_petrolcan.png', unique = true, useable = false, description = 'A robust liquid container made from pressed steel' },
    weapon_fireextinguisher      = { name = 'weapon_fireextinguisher', label = 'Fire Extinguisher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_fireextinguisher.png', unique = true, useable = false, description = 'A portable device that discharges a jet of water, foam, gas, or other material to extinguish a fire' },
    weapon_hazardcan             = { name = 'weapon_hazardcan', label = 'Hazardous Jerry Can', weight = 1000, type = 'weapon', ammotype = 'AMMO_PETROLCAN', image = 'weapon_hazardcan.png', unique = true, useable = true, description = 'Weapon Hazardcan' },

    -- Weapon Attachments
    clip_attachment              = { name = 'clip_attachment', label = 'Clip', weight = 1000, type = 'item', image = 'clip_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A clip for a weapon' },
    drum_attachment              = { name = 'drum_attachment', label = 'Drum', weight = 1000, type = 'item', image = 'drum_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A drum for a weapon' },
    flashlight_attachment        = { name = 'flashlight_attachment', label = 'Flashlight', weight = 1000, type = 'item', image = 'flashlight_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A flashlight for a weapon' },
    suppressor_attachment        = { name = 'suppressor_attachment', label = 'Suppressor', weight = 1000, type = 'item', image = 'suppressor_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A suppressor for a weapon' },
    smallscope_attachment        = { name = 'smallscope_attachment', label = 'Small Scope', weight = 1000, type = 'item', image = 'smallscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A small scope for a weapon' },
    medscope_attachment          = { name = 'medscope_attachment', label = 'Medium Scope', weight = 1000, type = 'item', image = 'medscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A medium scope for a weapon' },
    largescope_attachment        = { name = 'largescope_attachment', label = 'Large Scope', weight = 1000, type = 'item', image = 'largescope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A large scope for a weapon' },
    holoscope_attachment         = { name = 'holoscope_attachment', label = 'Holo Scope', weight = 1000, type = 'item', image = 'holoscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A holo scope for a weapon' },
    advscope_attachment          = { name = 'advscope_attachment', label = 'Advanced Scope', weight = 1000, type = 'item', image = 'advscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'An advanced scope for a weapon' },
    nvscope_attachment           = { name = 'nvscope_attachment', label = 'Night Vision Scope', weight = 1000, type = 'item', image = 'nvscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A night vision scope for a weapon' },
    thermalscope_attachment      = { name = 'thermalscope_attachment', label = 'Thermal Scope', weight = 1000, type = 'item', image = 'thermalscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A thermal scope for a weapon' },
    flat_muzzle_brake            = { name = 'flat_muzzle_brake', label = 'Flat Muzzle Brake', weight = 1000, type = 'item', image = 'flat_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    tactical_muzzle_brake        = { name = 'tactical_muzzle_brake', label = 'Tactical Muzzle Brake', weight = 1000, type = 'item', image = 'tactical_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brakee for a weapon' },
    fat_end_muzzle_brake         = { name = 'fat_end_muzzle_brake', label = 'Fat End Muzzle Brake', weight = 1000, type = 'item', image = 'fat_end_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    precision_muzzle_brake       = { name = 'precision_muzzle_brake', label = 'Precision Muzzle Brake', weight = 1000, type = 'item', image = 'precision_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    heavy_duty_muzzle_brake      = { name = 'heavy_duty_muzzle_brake', label = 'HD Muzzle Brake', weight = 1000, type = 'item', image = 'heavy_duty_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    slanted_muzzle_brake         = { name = 'slanted_muzzle_brake', label = 'Slanted Muzzle Brake', weight = 1000, type = 'item', image = 'slanted_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    split_end_muzzle_brake       = { name = 'split_end_muzzle_brake', label = 'Split End Muzzle Brake', weight = 1000, type = 'item', image = 'split_end_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    squared_muzzle_brake         = { name = 'squared_muzzle_brake', label = 'Squared Muzzle Brake', weight = 1000, type = 'item', image = 'squared_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    bellend_muzzle_brake         = { name = 'bellend_muzzle_brake', label = 'Bellend Muzzle Brake', weight = 1000, type = 'item', image = 'bellend_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    barrel_attachment            = { name = 'barrel_attachment', label = 'Barrel', weight = 1000, type = 'item', image = 'barrel_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A barrel for a weapon' },
    grip_attachment              = { name = 'grip_attachment', label = 'Grip', weight = 1000, type = 'item', image = 'grip_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A grip for a weapon' },
    comp_attachment              = { name = 'comp_attachment', label = 'Compensator', weight = 1000, type = 'item', image = 'comp_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A compensator for a weapon' },
    luxuryfinish_attachment      = { name = 'luxuryfinish_attachment', label = 'Luxury Finish', weight = 1000, type = 'item', image = 'luxuryfinish_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A luxury finish for a weapon' },
    digicamo_attachment          = { name = 'digicamo_attachment', label = 'Digital Camo', weight = 1000, type = 'item', image = 'digicamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A digital camo for a weapon' },
    brushcamo_attachment         = { name = 'brushcamo_attachment', label = 'Brushstroke Camo', weight = 1000, type = 'item', image = 'brushcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A brushstroke camo for a weapon' },
    woodcamo_attachment          = { name = 'woodcamo_attachment', label = 'Woodland Camo', weight = 1000, type = 'item', image = 'woodcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A woodland camo for a weapon' },
    skullcamo_attachment         = { name = 'skullcamo_attachment', label = 'Skull Camo', weight = 1000, type = 'item', image = 'skullcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A skull camo for a weapon' },
    sessantacamo_attachment      = { name = 'sessantacamo_attachment', label = 'Sessanta Nove Camo', weight = 1000, type = 'item', image = 'sessantacamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A sessanta nove camo for a weapon' },
    perseuscamo_attachment       = { name = 'perseuscamo_attachment', label = 'Perseus Camo', weight = 1000, type = 'item', image = 'perseuscamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A perseus camo for a weapon' },
    leopardcamo_attachment       = { name = 'leopardcamo_attachment', label = 'Leopard Camo', weight = 1000, type = 'item', image = 'leopardcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A leopard camo for a weapon' },
    zebracamo_attachment         = { name = 'zebracamo_attachment', label = 'Zebra Camo', weight = 1000, type = 'item', image = 'zebracamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A zebra camo for a weapon' },
    geocamo_attachment           = { name = 'geocamo_attachment', label = 'Geometric Camo', weight = 1000, type = 'item', image = 'geocamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A geometric camo for a weapon' },
    boomcamo_attachment          = { name = 'boomcamo_attachment', label = 'Boom Camo', weight = 1000, type = 'item', image = 'boomcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A boom camo for a weapon' },
    patriotcamo_attachment       = { name = 'patriotcamo_attachment', label = 'Patriot Camo', weight = 1000, type = 'item', image = 'patriotcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A patriot camo for a weapon' },

    -- Weapon Tints
    weapontint_0                 = { name = 'weapontint_0', label = 'Default Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Default/Black Weapon Tint' },
    weapontint_1                 = { name = 'weapontint_1', label = 'Green Tint', weight = 1000, type = 'item', image = 'weapontint_green.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Green Weapon Tint' },
    weapontint_2                 = { name = 'weapontint_2', label = 'Gold Tint', weight = 1000, type = 'item', image = 'weapontint_gold.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Gold Weapon Tint' },
    weapontint_3                 = { name = 'weapontint_3', label = 'Pink Tint', weight = 1000, type = 'item', image = 'weapontint_pink.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Pink Weapon Tint' },
    weapontint_4                 = { name = 'weapontint_4', label = 'Army Tint', weight = 1000, type = 'item', image = 'weapontint_army.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Army Weapon Tint' },
    weapontint_5                 = { name = 'weapontint_5', label = 'LSPD Tint', weight = 1000, type = 'item', image = 'weapontint_lspd.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'LSPD Weapon Tint' },
    weapontint_6                 = { name = 'weapontint_6', label = 'Orange Tint', weight = 1000, type = 'item', image = 'weapontint_orange.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Orange Weapon Tint' },
    weapontint_7                 = { name = 'weapontint_7', label = 'Platinum Tint', weight = 1000, type = 'item', image = 'weapontint_plat.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Platinum Weapon Tint' },
    weapontint_mk2_0             = { name = 'weapontint_mk2_0', label = 'Classic Black Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Black Weapon Tint for MK2 Weapons' },
    weapontint_mk2_1             = { name = 'weapontint_mk2_1', label = 'Classic Gray Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Gray Weapon Tint for MK2 Weapons' },
    weapontint_mk2_2             = { name = 'weapontint_mk2_2', label = 'Classic Two-Tone Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Two-Tone Weapon Tint for MK2 Weapons' },
    weapontint_mk2_3             = { name = 'weapontint_mk2_3', label = 'Classic White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_4             = { name = 'weapontint_mk2_4', label = 'Classic Beige Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Beige Weapon Tint for MK2 Weapons' },
    weapontint_mk2_5             = { name = 'weapontint_mk2_5', label = 'Classic Green Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Green Weapon Tint for MK2 Weapons' },
    weapontint_mk2_6             = { name = 'weapontint_mk2_6', label = 'Classic Blue Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Blue Weapon Tint for MK2 Weapons' },
    weapontint_mk2_7             = { name = 'weapontint_mk2_7', label = 'Classic Earth Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Earth Weapon Tint for MK2 Weapons' },
    weapontint_mk2_8             = { name = 'weapontint_mk2_8', label = 'Classic Brown & Black Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Brown & Black Weapon Tint for MK2 Weapons' },
    weapontint_mk2_9             = { name = 'weapontint_mk2_9', label = 'Red Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Red Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_10            = { name = 'weapontint_mk2_10', label = 'Blue Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Blue Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_11            = { name = 'weapontint_mk2_11', label = 'Yellow Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Yellow Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_12            = { name = 'weapontint_mk2_12', label = 'Orange Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Orange Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_13            = { name = 'weapontint_mk2_13', label = 'Bold Pink Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Pink Weapon Tint for MK2 Weapons' },
    weapontint_mk2_14            = { name = 'weapontint_mk2_14', label = 'Bold Purple & Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Purple & Yellow Weapon Tint for MK2 Weapons' },
    weapontint_mk2_15            = { name = 'weapontint_mk2_15', label = 'Bold Orange Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Orange Weapon Tint for MK2 Weapons' },
    weapontint_mk2_16            = { name = 'weapontint_mk2_16', label = 'Bold Green & Purple Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Green & Purple Weapon Tint for MK2 Weapons' },
    weapontint_mk2_17            = { name = 'weapontint_mk2_17', label = 'Bold Red Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Red Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_18            = { name = 'weapontint_mk2_18', label = 'Bold Green Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Green Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_19            = { name = 'weapontint_mk2_19', label = 'Bold Cyan Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Cyan Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_20            = { name = 'weapontint_mk2_20', label = 'Bold Yellow Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Yellow Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_21            = { name = 'weapontint_mk2_21', label = 'Bold Red & White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Red & White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_22            = { name = 'weapontint_mk2_22', label = 'Bold Blue & White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Blue & White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_23            = { name = 'weapontint_mk2_23', label = 'Metallic Gold Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Gold Weapon Tint for MK2 Weapons' },
    weapontint_mk2_24            = { name = 'weapontint_mk2_24', label = 'Metallic Platinum Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Platinum Weapon Tint for MK2 Weapons' },
    weapontint_mk2_25            = { name = 'weapontint_mk2_25', label = 'Metallic Gray & Lilac Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Gray & Lilac Weapon Tint for MK2 Weapons' },
    weapontint_mk2_26            = { name = 'weapontint_mk2_26', label = 'Metallic Purple & Lime Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Purple & Lime Weapon Tint for MK2 Weapons' },
    weapontint_mk2_27            = { name = 'weapontint_mk2_27', label = 'Metallic Red Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Red Weapon Tint for MK2 Weapons' },
    weapontint_mk2_28            = { name = 'weapontint_mk2_28', label = 'Metallic Green Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Green Weapon Tint for MK2 Weapons' },
    weapontint_mk2_29            = { name = 'weapontint_mk2_29', label = 'Metallic Blue Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Blue Weapon Tint for MK2 Weapons' },
    weapontint_mk2_30            = { name = 'weapontint_mk2_30', label = 'Metallic White & Aqua Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic White & Aqua Weapon Tint for MK2 Weapons' },
    weapontint_mk2_31            = { name = 'weapontint_mk2_31', label = 'Metallic Orange & Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Orange & Yellow Weapon Tint for MK2 Weapons' },
    weapontint_mk2_32            = { name = 'weapontint_mk2_32', label = 'Metallic Red and Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Red and Yellow Weapon Tint for MK2 Weapons' },
    -- ITEMS

    ["payticket"] 					 = {["name"] = "payticket", 				["label"] = "Receipt", 	     			["weight"] = 150, 		["type"] = "item", 		["image"] = "ticket.png", 				["unique"] = false,   	["useable"] = false,    ["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "Cash these in at the bank!"},
    ['vpn']                       = {['name'] = 'vpn',                         ['label'] = 'vpn',             ['weight'] = 1500,         ['type'] = 'item',         ['image'] = 'vpn.png',             ['unique'] = false,     ['useable'] = false,     ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = 'A VPN to get other emails?'},
    ['rfid_disruptor']              = {['name'] = 'rfid_disruptor',               ['label'] = 'RFID Disruptor',        ['weight'] = 1000,         ['type'] = 'item',      ['image'] = 'rfid_disruptor.png',      ['unique'] = false,      ['useable'] = true,     ['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = ' A Disruptor used for ATM firewalls'},
    -- Ammo ITEMS
    pistol_ammo                  = { name = 'pistol_ammo', label = 'Pistol ammo', weight = 200, type = 'item', image = 'pistol_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Pistols' },
    rifle_ammo                   = { name = 'rifle_ammo', label = 'Rifle ammo', weight = 1000, type = 'item', image = 'rifle_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Rifles' },
    smg_ammo                     = { name = 'smg_ammo', label = 'SMG ammo', weight = 500, type = 'item', image = 'smg_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Sub Machine Guns' },
    shotgun_ammo                 = { name = 'shotgun_ammo', label = 'Shotgun ammo', weight = 500, type = 'item', image = 'shotgun_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Shotguns' },
    mg_ammo                      = { name = 'mg_ammo', label = 'MG ammo', weight = 1000, type = 'item', image = 'mg_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Machine Guns' },
    snp_ammo                     = { name = 'snp_ammo', label = 'Sniper ammo', weight = 1000, type = 'item', image = 'rifle_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Sniper Rifles' },
    emp_ammo                     = { name = 'emp_ammo', label = 'EMP Ammo', weight = 200, type = 'item', image = 'emp_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for EMP Launcher' },

    -- Card ITEMS
    id_card                      = { name = 'id_card', label = 'ID Card', weight = 0, type = 'item', image = 'id_card.png', unique = true, useable = true, shouldClose = false, combinable = nil, description = 'A card containing all your information to identify yourself' },
    driver_license               = { name = 'driver_license', label = 'Drivers License', weight = 0, type = 'item', image = 'driver_license.png', unique = true, useable = true, shouldClose = false, combinable = nil, description = 'Permit to show you can drive a vehicle' },
    lawyerpass                   = { name = 'lawyerpass', label = 'Lawyer Pass', weight = 0, type = 'item', image = 'lawyerpass.png', unique = true, useable = true, shouldClose = false, combinable = nil, description = 'Pass exclusive to lawyers to show they can represent a suspect' },
    weaponlicense                = { name = 'weaponlicense', label = 'Weapon License', weight = 0, type = 'item', image = 'weapon_license.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Weapon License' },
    bank_card                    = { name = 'bank_card', label = 'Bank Card', weight = 0, type = 'item', image = 'bank_card.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Used to access ATM' },
    security_card_01             = { name = 'security_card_01', label = 'Paleto Bank Card', weight = 0, type = 'item', image = 'security_card_01.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A security card... I wonder what it goes to' },
    security_card_02             = { name = 'security_card_02', label = 'Pacific Bank Card', weight = 0, type = 'item', image = 'security_card_02.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A security card... I wonder what it goes to' },

    -- Eat ITEMS
    tosti                        = { name = 'tosti', label = 'Grilled Cheese Sandwich', weight = 200, type = 'item', image = 'tosti.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Nice to eat' },
    twerks_candy                 = { name = 'twerks_candy', label = 'Twerks', weight = 100, type = 'item', image = 'twerks_candy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Some delicious candy :O' },
    snikkel_candy                = { name = 'snikkel_candy', label = 'Snikkel', weight = 100, type = 'item', image = 'snikkel_candy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Some delicious candy :O' },
    sandwich                     = { name = 'sandwich', label = 'Sandwich', weight = 200, type = 'item', image = 'sandwich.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Nice bread for your stomach' },
    bleeder                      = { name = 'bleeder', label = 'Bleeder Burger', weight = 200, type = 'item', image = 'bleeder.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Nice bread for your stomach' },
    heartstopper                 = { name = 'heartstopper', label = 'Heartstopper Burger', weight = 200, type = 'item', image = 'heartstopper.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Nice bread for your stomach' },

    -- Drink ITEMS
    softdrink                    = { name = 'softdrink', label = 'SoftDrink', weight = 500, type = 'item', image = 'softdrink.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For all the thirsty out there' },
    water_bottle                 = { name = 'water_bottle', label = 'Bottle of Water', weight = 500, type = 'item', image = 'water_bottle.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For all the thirsty out there' },
    coffee                       = { name = 'coffee', label = 'Coffee', weight = 200, type = 'item', image = 'coffee.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Pump 4 Caffeine' },
    kurkakola                    = { name = 'kurkakola', label = 'Cola', weight = 500, type = 'item', image = 'cola.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For all the thirsty out there' },

    -- Alcohol
    beer                         = { name = 'beer', label = 'Beer', weight = 500, type = 'item', image = 'beer.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Nothing like a good cold beer!' },
    whiskey                      = { name = 'whiskey', label = 'Whiskey', weight = 500, type = 'item', image = 'whiskey.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For all the thirsty out there' },
    vodka                        = { name = 'vodka', label = 'Vodka', weight = 500, type = 'item', image = 'vodka.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For all the thirsty out there' },
    grape                        = { name = 'grape', label = 'Grape', weight = 100, type = 'item', image = 'grape.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'Mmmmh yummie, grapes' },
    wine                         = { name = 'wine', label = 'Wine', weight = 300, type = 'item', image = 'wine.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'Some good wine to drink on a fine evening' },
    grapejuice                   = { name = 'grapejuice', label = 'Grape Juice', weight = 200, type = 'item', image = 'grapejuice.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'Grape juice is said to be healthy' },

    -- Drugs
    cigarette                        = { name = 'cigarette', label = 'Cigarette', weight = 0, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Smokable Tobacco' },
    joint                        = { name = 'joint', label = 'Joint', weight = 0, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Sidney would be very proud at you' },
    cokebaggy                    = { name = 'cokebaggy', label = 'Bag of Coke', weight = 0, type = 'item', image = 'cocaine_baggy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'To get happy real quick' },
    crack_baggy                  = { name = 'crack_baggy', label = 'Bag of Crack', weight = 0, type = 'item', image = 'crack_baggy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'To get happy faster' },
    xtcbaggy                     = { name = 'xtcbaggy', label = 'Bag of XTC', weight = 0, type = 'item', image = 'xtc_baggy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Pop those pills baby' },
    coke_brick                   = { name = 'coke_brick', label = 'Coke Brick', weight = 1000, type = 'item', image = 'coke_brick.png', unique = true, useable = false, shouldClose = true, combinable = nil, description = 'Heavy package of cocaine, mostly used for deals and takes a lot of space' },
    weed_brick                   = { name = 'weed_brick', label = 'Weed Brick', weight = 1000, type = 'item', image = 'weed_brick.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = '1KG Weed Brick to sell to large customers.' },
    coke_small_brick             = { name = 'coke_small_brick', label = 'Coke Package', weight = 350, type = 'item', image = 'coke_small_brick.png', unique = true, useable = false, shouldClose = true, combinable = nil, description = 'Small package of cocaine, mostly used for deals and takes a lot of space' },
    oxy                          = { name = 'oxy', label = 'Prescription Oxy', weight = 0, type = 'item', image = 'oxy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'The Label Has Been Ripped Off' },
    meth                         = { name = 'meth', label = 'Meth', weight = 100, type = 'item', image = 'meth_baggy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A baggie of Meth' },
    rolling_paper                = { name = 'rolling_paper', label = 'Rolling Paper', weight = 0, type = 'item', image = 'rolling_paper.png', unique = false, useable = false, shouldClose = true, combinable = { accept = { 'weed_whitewidow', 'weed_skunk', 'weed_purplehaze', 'weed_ogkush', 'weed_amnesia', 'weed_ak47' }, reward = 'joint', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Rolling joint', timeOut = 5000, } }, description = 'Paper made specifically for encasing and smoking tobacco or cannabis.' },

    -- Seed And Weed
    weed_whitewidow              = { name = 'weed_whitewidow', label = 'White Widow 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g White Widow' },
    weed_skunk                   = { name = 'weed_skunk', label = 'Skunk 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g Skunk' },
    weed_purplehaze              = { name = 'weed_purplehaze', label = 'Purple Haze 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g Purple Haze' },
    weed_ogkush                  = { name = 'weed_ogkush', label = 'OGKush 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g OG Kush' },
    weed_amnesia                 = { name = 'weed_amnesia', label = 'Amnesia 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g Amnesia' },
    weed_ak47                    = { name = 'weed_ak47', label = 'AK47 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g AK47' },
    weed_whitewidow_seed         = { name = 'weed_whitewidow_seed', label = 'White Widow Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed seed of White Widow' },
    weed_skunk_seed              = { name = 'weed_skunk_seed', label = 'Skunk Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of Skunk' },
    weed_purplehaze_seed         = { name = 'weed_purplehaze_seed', label = 'Purple Haze Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of Purple Haze' },
    weed_ogkush_seed             = { name = 'weed_ogkush_seed', label = 'OGKush Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of OG Kush' },
    weed_amnesia_seed            = { name = 'weed_amnesia_seed', label = 'Amnesia Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of Amnesia' },
    weed_ak47_seed               = { name = 'weed_ak47_seed', label = 'AK47 Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of AK47' },
    empty_weed_bag               = { name = 'empty_weed_bag', label = 'Empty Weed Bag', weight = 0, type = 'item', image = 'weed_baggy_empty.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A small empty bag' },
    weed_nutrition               = { name = 'weed_nutrition', label = 'Plant Fertilizer', weight = 2000, type = 'item', image = 'weed_nutrition.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Plant nutrition' },

    -- Material
    plastic                      = { name = 'plastic', label = 'Plastic', weight = 100, type = 'item', image = 'plastic.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'RECYCLE! - Greta Thunberg 2019' },
    metalscrap                   = { name = 'metalscrap', label = 'Metal Scrap', weight = 100, type = 'item', image = 'metalscrap.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'You can probably make something nice out of this' },
    copper                       = { name = 'copper', label = 'Copper', weight = 100, type = 'item', image = 'copper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Nice piece of metal that you can probably use for something' },
    aluminum                     = { name = 'aluminum', label = 'Aluminium', weight = 100, type = 'item', image = 'aluminum.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Nice piece of metal that you can probably use for something' },
    aluminumoxide                = { name = 'aluminumoxide', label = 'Aluminium Powder', weight = 100, type = 'item', image = 'aluminumoxide.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Some powder to mix with' },
    iron                         = { name = 'iron', label = 'Iron', weight = 100, type = 'item', image = 'iron.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Handy piece of metal that you can probably use for something' },
    ironoxide                    = { name = 'ironoxide', label = 'Iron Powder', weight = 100, type = 'item', image = 'ironoxide.png', unique = false, useable = false, shouldClose = false, combinable = { accept = { 'aluminumoxide' }, reward = 'thermite', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Mixing powder..', timeOut = 10000 } }, description = 'Some powder to mix with.' },
    steel                        = { name = 'steel', label = 'Steel', weight = 100, type = 'item', image = 'steel.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Nice piece of metal that you can probably use for something' },
    rubber                       = { name = 'rubber', label = 'Rubber', weight = 100, type = 'item', image = 'rubber.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Rubber, I believe you can make your own rubber ducky with it :D' },
    glass                        = { name = 'glass', label = 'Glass', weight = 100, type = 'item', image = 'glass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'It is very fragile, watch out' },

    -- Tools
    lockpick                     = { name = 'lockpick', label = 'Lockpick', weight = 300, type = 'item', image = 'lockpick.png', unique = false, useable = true, shouldClose = true, combinable = { accept = { 'screwdriverset' }, reward = 'advancedlockpick', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Crafting lockpick', timeOut = 7500, } }, description = 'Very useful if you lose your keys a lot.. or if you want to use it for something else...' },
    advancedlockpick             = { name = 'advancedlockpick', label = 'Advanced Lockpick', weight = 500, type = 'item', image = 'advancedlockpick.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'If you lose your keys a lot this is very useful... Also useful to open your beers' },
    electronickit                = { name = 'electronickit', label = 'Hacking laptop', weight = 100, type = 'item', image = 'laptop.png', unique = false, useable = true, shouldClose = true, combinable = { accept = { 'gatecrack' }, reward = 'trojan_usb', anim = nil }, description = 'If you\'ve always wanted to build a robot you can maybe start here. Maybe you\'ll be the new Elon Musk?' },
    gatecrack                    = { name = 'gatecrack', label = 'Gatecrack', weight = 0, type = 'item', image = 'usb_device.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Handy software to tear down some fences' },
    thermite                     = { name = 'thermite', label = 'Thermite', weight = 1000, type = 'item', image = 'thermite.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Sometimes you\'d wish for everything to burn' },
    trojan_usb                   = { name = 'trojan_usb', label = 'Trojan USB', weight = 0, type = 'item', image = 'usb_device.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Handy software to shut down some systems' },
    screwdriverset               = { name = 'screwdriverset', label = 'Toolkit', weight = 1000, type = 'item', image = 'screwdriverset.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Very useful to screw... screws...' },
    drill                        = { name = 'drill', label = 'Drill', weight = 20000, type = 'item', image = 'drill.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'The real deal...' },

    -- Vehicle Tools
    nitrous                      = { name = 'nitrous', label = 'Nitrous', weight = 1000, type = 'item', image = 'nitrous.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Speed up, gas pedal! :D' },
    repairkit                    = { name = 'repairkit', label = 'Repairkit', weight = 2500, type = 'item', image = 'repairkit.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A nice toolbox with stuff to repair your vehicle' },
    advancedrepairkit            = { name = 'advancedrepairkit', label = 'Advanced Repairkit', weight = 4000, type = 'item', image = 'advancedkit.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A nice toolbox with stuff to repair your vehicle' },
    cleaningkit                  = { name = 'cleaningkit', label = 'Cleaning Kit', weight = 250, type = 'item', image = 'cleaningkit.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A microfiber cloth with some soap will let your car sparkle again!' },
    tunerlaptop                  = { name = 'tunerlaptop', label = 'Tunerchip', weight = 2000, type = 'item', image = 'tunerchip.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'With this tunerchip you can get your car on steroids... If you know what you\'re doing' },
    harness                      = { name = 'harness', label = 'Race Harness', weight = 1000, type = 'item', image = 'harness.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Racing Harness so no matter what you stay in the car' },
    jerry_can                    = { name = 'jerry_can', label = 'Jerrycan 20L', weight = 20000, type = 'item', image = 'jerry_can.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A can full of Fuel' },
    tirerepairkit                = { name = 'tirerepairkit', label = 'Tire Repair Kit', weight = 1000, type = 'item', image = 'tirerepairkit.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A kit to repair your tires' },

    -- Mechanic Parts
    veh_toolbox                  = { name = 'veh_toolbox', label = 'Toolbox', weight = 1000, type = 'item', image = 'veh_toolbox.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Check vehicle status' },
    veh_armor                    = { name = 'veh_armor', label = 'Armor', weight = 1000, type = 'item', image = 'veh_armor.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle armor' },
    veh_brakes                   = { name = 'veh_brakes', label = 'Brakes', weight = 1000, type = 'item', image = 'veh_brakes.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle brakes' },
    veh_engine                   = { name = 'veh_engine', label = 'Engine', weight = 1000, type = 'item', image = 'veh_engine.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle engine' },
    veh_suspension               = { name = 'veh_suspension', label = 'Suspension', weight = 1000, type = 'item', image = 'veh_suspension.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle suspension' },
    veh_transmission             = { name = 'veh_transmission', label = 'Transmission', weight = 1000, type = 'item', image = 'veh_transmission.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle transmission' },
    veh_turbo                    = { name = 'veh_turbo', label = 'Turbo', weight = 1000, type = 'item', image = 'veh_turbo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Install vehicle turbo' },
    veh_interior                 = { name = 'veh_interior', label = 'Interior', weight = 1000, type = 'item', image = 'veh_interior.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle interior' },
    veh_exterior                 = { name = 'veh_exterior', label = 'Exterior', weight = 1000, type = 'item', image = 'veh_exterior.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle exterior' },
    veh_wheels                   = { name = 'veh_wheels', label = 'Wheels', weight = 1000, type = 'item', image = 'veh_wheels.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle wheels' },
    veh_neons                    = { name = 'veh_neons', label = 'Neons', weight = 1000, type = 'item', image = 'veh_neons.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle neons' },
    veh_xenons                   = { name = 'veh_xenons', label = 'Xenons', weight = 1000, type = 'item', image = 'veh_xenons.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle xenons' },
    veh_tint                     = { name = 'veh_tint', label = 'Tints', weight = 1000, type = 'item', image = 'veh_tint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Install vehicle tint' },
    veh_plates                   = { name = 'veh_plates', label = 'Plates', weight = 1000, type = 'item', image = 'veh_plates.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Install vehicle plates' },

    -- Medication
    firstaid                     = { name = 'firstaid', label = 'First Aid', weight = 2500, type = 'item', image = 'firstaid.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'You can use this First Aid kit to get people back on their feet' },
    bandage                      = { name = 'bandage', label = 'Bandage', weight = 0, type = 'item', image = 'bandage.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A bandage works every time' },
    ifaks                        = { name = 'ifaks', label = 'ifaks', weight = 200, type = 'item', image = 'ifaks.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'ifaks for healing and a complete stress remover.' },
    painkillers                  = { name = 'painkillers', label = 'Painkillers', weight = 0, type = 'item', image = 'painkillers.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For pain you can\'t stand anymore, take this pill that\'d make you feel great again' },
    walkstick                    = { name = 'walkstick', label = 'Walking Stick', weight = 1000, type = 'item', image = 'walkstick.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Walking stick for ya\'ll grannies out there.. HAHA' },

    -- Communication
    ['phone'] = {['name']='phone',['label']='Phone',['weight']=700,['type']='item',['image']='phone.png',['unique']=true,['useable']=true,['shouldClose']=true,['combinable']=nil,['description']='Neat phone ya got there'},
    ['phone_white']={['name']='phone_white',['label']='White Phone',['weight']=700,['type']='item',['image']='phone_white.png',['unique']=true,['useable']=true,['shouldClose']=true,['combinable']=nil,['description']='Neat white phone ya got there'},
    ['phone_gold']={['name']='phone_gold',['label']='Gold Phone',['weight']=700,['type']='item',['image']='phone_gold.png',['unique']=true,['useable']=true,['shouldClose']=true,['combinable']=nil,['description']='Neat gold phone ya got there'},
    ['phone_red']={['name']='phone_red',['label']='Red Phone',['weight']=700,['type']='item',['image']='phone_red.png',['unique']=true,['useable']=true,['shouldClose']=true,['combinable']=nil,['description']='Neat red phone ya got there'},
    ['phone_blue']={['name']='phone_blue',['label']='Blue Phone',['weight']=700,['type']='item',['image']='phone_blue.png',['unique']=true,['useable']=true,['shouldClose']=true,['combinable']=nil,['description']='Neat blue phone ya got there'},
    ['phone_green']={['name']='phone_green',['label']='Green Phone',['weight']=700,['type']='item',['image']='phone_green.png',['unique']=true,['useable']=true,['shouldClose']=true,['combinable']=nil,['description']='Neat green phone ya got there'},
    ['phone_pink']={['name']='phone_pink',['label']='Pink Phone',['weight']=700,['type']='item',['image']='phone_pink.png',['unique']=true,['useable']=true,['shouldClose']=true,['combinable']=nil,['description']='Neat pink phone ya got there'},
    ['phone_greenLight']={['name']='phone_greenLight',['label']='Green Light Phone',['weight']=700,['type']='item',['image']='phone_greenLight.png',['unique']=true,['useable']=true,['shouldClose']=true,['combinable']=nil,['description']='Neat green light phone ya got there'},
    ['powerbank'] 			 	 	 	 = {['name'] = 'powerbank', 			  			['label'] = 'Powerbank', 					['weight'] = 200, 		['type'] = 'item', 		['image'] = 'powerbank.png', 				['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A good way to get battery'},
   
    radio                        = { name = 'radio', label = 'Radio', weight = 2000, type = 'item', image = 'radio.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'You can communicate with this through a signal' },
    iphone                       = { name = 'iphone', label = 'iPhone', weight = 1000, type = 'item', image = 'iphone.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Very expensive phone' },
    samsungphone                 = { name = 'samsungphone', label = 'Samsung S10', weight = 1000, type = 'item', image = 'samsungphone.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Very expensive phone' },
    laptop                       = { name = 'laptop', label = 'Laptop', weight = 4000, type = 'item', image = 'laptop.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Expensive laptop' },
    vin_scratcher                = { name = 'vin_scratcher', label = 'Vin Scratch', weight = 4000, type = 'item', image = 'laptop.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'File to scratch vin numbers' },
    tablet                       = { name = 'tablet', label = 'Tablet', weight = 2000, type = 'item', image = 'tablet.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Expensive tablet' },
    fitbit                       = { name = 'fitbit', label = 'Fitbit', weight = 500, type = 'item', image = 'fitbit.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'I like fitbit' },
    radioscanner                 = { name = 'radioscanner', label = 'Radio Scanner', weight = 1000, type = 'item', image = 'radioscanner.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'With this you can get some police alerts. Not 100% effective however' },
    pinger                       = { name = 'pinger', label = 'Pinger', weight = 1000, type = 'item', image = 'pinger.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'With a pinger and your phone you can send out your location' },
    cryptostick                  = { name = 'cryptostick', label = 'Crypto Stick', weight = 200, type = 'item', image = 'cryptostick.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Why would someone ever buy money that doesn\'t exist.. How many would it contain..?' },

    -- Theft and Jewelry
    rolex                        = { name = 'rolex', label = 'Golden Watch', weight = 1500, type = 'item', image = 'rolex.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'A golden watch seems like the jackpot to me!' },
    diamond_ring                 = { name = 'diamond_ring', label = 'Diamond Ring', weight = 1500, type = 'item', image = 'diamond_ring.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'A diamond ring seems like the jackpot to me!' },
    diamond                      = { name = 'diamond', label = 'Diamond', weight = 1000, type = 'item', image = 'diamond.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'A diamond seems like the jackpot to me!' },
    goldchain                    = { name = 'goldchain', label = 'Golden Chain', weight = 1500, type = 'item', image = 'goldchain.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'A golden chain seems like the jackpot to me!' },
    tenkgoldchain                = { name = 'tenkgoldchain', label = '10k Gold Chain', weight = 2000, type = 'item', image = '10kgoldchain.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = '10 carat golden chain' },
    goldbar                      = { name = 'goldbar', label = 'Gold Bar', weight = 7000, type = 'item', image = 'goldbar.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Looks pretty expensive to me' },

    -- Cops Tools
    armor                        = { name = 'armor', label = 'Armor', weight = 5000, type = 'item', image = 'armor.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Some protection won\'t hurt... right?' },
    heavyarmor                   = { name = 'heavyarmor', label = 'Heavy Armor', weight = 5000, type = 'item', image = 'heavyarmor.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Some protection won\'t hurt... right?' },
    handcuffs                    = { name = 'handcuffs', label = 'Handcuffs', weight = 100, type = 'item', image = 'handcuffs.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Comes in handy when people misbehave. Maybe it can be used for something else?' },
    police_stormram              = { name = 'police_stormram', label = 'Stormram', weight = 18000, type = 'item', image = 'police_stormram.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A nice tool to break into doors' },
    empty_evidence_bag           = { name = 'empty_evidence_bag', label = 'Empty Evidence Bag', weight = 0, type = 'item', image = 'evidence.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Used a lot to keep DNA from blood, bullet shells and more' },

    -- Firework Tools
    firework1                    = { name = 'firework1', label = '2Brothers', weight = 1000, type = 'item', image = 'firework1.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Fireworks' },
    firework2                    = { name = 'firework2', label = 'Poppelers', weight = 1000, type = 'item', image = 'firework2.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Fireworks' },
    firework3                    = { name = 'firework3', label = 'WipeOut', weight = 1000, type = 'item', image = 'firework3.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Fireworks' },
    firework4                    = { name = 'firework4', label = 'Weeping Willow', weight = 1000, type = 'item', image = 'firework4.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Fireworks' },

    -- Sea Tools
    dendrogyra_coral             = { name = 'dendrogyra_coral', label = 'Dendrogyra', weight = 1000, type = 'item', image = 'dendrogyra_coral.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Its also known as pillar coral' },
    antipatharia_coral           = { name = 'antipatharia_coral', label = 'Antipatharia', weight = 1000, type = 'item', image = 'antipatharia_coral.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Its also known as black corals or thorn corals' },
    diving_gear                  = { name = 'diving_gear', label = 'Diving Gear', weight = 30000, type = 'item', image = 'diving_gear.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'An oxygen tank and a rebreather' },
    diving_fill                  = { name = 'diving_fill', label = 'Diving Tube', weight = 3000, type = 'item', image = 'diving_tube.png', unique = true, useable = true, shouldClose = true, combinable = nil, discription = 'An oxygen tube and a rebreather' },

    -- Other Tools
    casinochips                  = { name = 'casinochips', label = 'Casino Chips', weight = 0, type = 'item', image = 'casinochips.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Chips For Casino Gambling' },
    stickynote                   = { name = 'stickynote', label = 'Sticky note', weight = 0, type = 'item', image = 'stickynote.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = 'Sometimes handy to remember something :)' },
    moneybag                     = { name = 'moneybag', label = 'Money Bag', weight = 0, type = 'item', image = 'moneybag.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A bag with cash' },
    parachute                    = { name = 'parachute', label = 'Parachute', weight = 30000, type = 'item', image = 'parachute.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'The sky is the limit! Woohoo!' },
    binoculars                   = { name = 'binoculars', label = 'Binoculars', weight = 600, type = 'item', image = 'binoculars.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Sneaky Breaky...' },
    lighter                      = { name = 'lighter', label = 'Lighter', weight = 0, type = 'item', image = 'lighter.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'On new years eve a nice fire to stand next to' },
    certificate                  = { name = 'certificate', label = 'Certificate', weight = 0, type = 'item', image = 'certificate.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Certificate that proves you own certain stuff' },
    markedbills                  = { name = 'markedbills', label = 'Marked Money', weight = 1000, type = 'item', image = 'markedbills.png', unique = true, useable = false, shouldClose = true, combinable = nil, description = 'Money?' },
    labkey                       = { name = 'labkey', label = 'Key', weight = 500, type = 'item', image = 'labkey.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Key for a lock...?' },
    printerdocument              = { name = 'printerdocument', label = 'Document', weight = 500, type = 'item', image = 'printerdocument.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A nice document' },
    newscam                      = { name = 'newscam', label = 'News Camera', weight = 100, type = 'item', image = 'newscam.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A camera for the news' },
    newsmic                      = { name = 'newsmic', label = 'News Microphone', weight = 100, type = 'item', image = 'newsmic.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A microphone for the news' },
    newsbmic                     = { name = 'newsbmic', label = 'Boom Microphone', weight = 100, type = 'item', image = 'newsbmic.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A Useable BoomMic' },

    -- Addons
    cash_bag                     = { name = 'cash_bag', label = 'Gruppe 6 Cash Bag', weight = 1000, type = 'item', image = 'cash_bag.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Bag full of un-inked cash' },
	inked_cash_bag               = { name = 'inked_cash_bag', label = 'Gruppe 6 Inked Cash Bag', weight = 1000, type = 'item', image = 'inked_cash_bag.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Bag full of useless inked cash.' },
    ["crocodile_clips"] 	     = {["name"] = "crocodile_clips", 			["label"] = "Wire Taps", 	   			["weight"] = 150, 		["type"] = "item", 		["image"] = "crocodile_clips.png", 			["unique"] = false,   	["useable"] = false,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Do some wiring work..", },
    ["oxy-box"] 			     = {["name"] = "oxy-box",				    ["label"] = "Drug Package",			   	["weight"] = 40000,    	["type"] = "item",		["image"] = "oxy-box.png",         	["unique"] = true,		["useable"] = false,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Box of Pills", },

    ["methcontainer"] 			 = {["name"] = "methcontainer",				    ["label"] = "Meth Container",			   	["weight"] = 9500,    	["type"] = "item",		["image"] = "methcontainer.png",         ["unique"] = true,		["useable"] = false,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Container full of white powder"},
    ["methcase"] 			     = {["name"] = "methcase",				    ["label"] = "Shiny Case",			   	["weight"] = 4500,    	["type"] = "item",		["image"] = "securitycase.png",         ["unique"] = true,		["useable"] = true,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Briefcase full of money"},
    ["floor-cleaner"] 			 = {["name"] = "floor-cleaner",				    ["label"] = "Floor Cleaner",			["weight"] = 1000,    	["type"] = "item",		["image"] = "floorcleaner.png",         	["unique"] = true,		["useable"] = false,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Floor Cleaner", ["created"] = nil, ["decay"] = 0.0	},

    ["delivery-box"] 			 = {["name"] = "delivery-box",				    		["label"] = "Delivery Package",			   			["weight"] = 50000,    	["type"] = "item",		["image"] = "delivery-box.png",         			["unique"] = true,		["useable"] = false,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Delivery Box",	["created"] = nil, 		["decay"] = 1.0 },

	['broken_handcuffs'] 			 = {['name'] = 'broken_handcuffs', 			    ['label'] = 'Broken Handcuffs', 		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'broken_handcuffs.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'It\'s broken, maybe you can repair it?'},
	['cuffkeys'] 				 	 = {['name'] = 'cuffkeys', 			    		['label'] = 'Cuff Keys', 				['weight'] = 75, 		['type'] = 'item', 		['image'] = 'cuffkeys.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Set them free !'},
	['ziptie'] 				 	 	 = {['name'] = 'ziptie', 			    		['label'] = 'ZipTie', 					['weight'] = 50, 		['type'] = 'item', 		['image'] = 'ziptie.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Comes in handy when people misbehave. Maybe it can be used for something else?'},
	['flush_cutter'] 				 = {['name'] = 'flush_cutter', 			    	['label'] = 'Flush Cutter', 			['weight'] = 50, 		['type'] = 'item', 		['image'] = 'flush_cutter.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Comes in handy when you want to cut zipties..'},
	['bolt_cutter'] 				 = {['name'] = 'bolt_cutter', 			    	['label'] = 'Bolt Cutter', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'bolt_cutter.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Wanna cut some metal items ?'},
    ['leo-gps']                         = {['name'] = 'leo-gps',                           ['label'] = 'LEO GPS',                   ['weight'] = 2000,         ['type'] = 'item',         ['image'] = 'leo-gps.png',                 ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'Show your gps location to others'},
    ['filled_evidence_bag']             = {['name'] = 'filled_evidence_bag',               ['label'] = 'Evidence Bag',              ['weight'] = 200,          ['type'] = 'item',         ['image'] = 'evidence.png',                ['unique'] = true,          ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,   ['description'] = 'A filled evidence bag to see who committed the crime >:('},


    	-- jim-mining stuff
["stone"] 		 	 			 = {["name"] = "stone",           				["label"] = "Stone",	 				["weight"] = 2000, 	    ["type"] = "item", 		["image"] = "stone.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Stone woo"},

["uncut_emerald"] 				 = {["name"] = "uncut_emerald", 			  	["label"] = "Uncut Emerald", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "uncut_emerald.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A rough Emerald"},
["uncut_ruby"] 					 = {["name"] = "uncut_ruby", 			  	  	["label"] = "Uncut Ruby", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "uncut_ruby.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A rough Ruby"},
["uncut_diamond"] 				 = {["name"] = "uncut_diamond", 			  	["label"] = "Uncut Diamond", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "uncut_diamond.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A rough Diamond"},
["uncut_sapphire"] 				 = {["name"] = "uncut_sapphire", 			  	["label"] = "Uncut Sapphire", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "uncut_sapphire.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A rough Sapphire"},

["emerald"] 					 = {["name"] = "emerald", 			  	  		["label"] = "Emerald", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "emerald.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A Emerald that shimmers"},
["ruby"] 						 = {["name"] = "ruby", 			  	  			["label"] = "Ruby", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "ruby.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A Ruby that shimmers"},
["diamond"] 					 = {["name"] = "diamond", 			  	  		["label"] = "Diamond", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "diamond.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A Diamond that shimmers"},
["sapphire"] 					 = {["name"] = "sapphire", 			  	  		["label"] = "Sapphire",					["weight"] = 100, 		["type"] = "item", 		["image"] = "sapphire.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A Sapphire that shimmers"},

["gold_ring"] 					 = {["name"] = "gold_ring", 			  	  	["label"] = "Gold Ring", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "gold_ring.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["diamond_ring"] 				 = {["name"] = "diamond_ring", 			  	  	["label"] = "Diamond Ring", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_ring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["ruby_ring"] 					 = {["name"] = "ruby_ring", 			  	  	["label"] = "Ruby Ring", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_ring.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["sapphire_ring"] 				 = {["name"] = "sapphire_ring", 			  	["label"] = "Sapphire Ring", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_ring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["emerald_ring"] 				 = {["name"] = "emerald_ring", 			  	  	["label"] = "Emerald Ring", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_ring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},

["silver_ring"] 				 = {["name"] = "silver_ring", 			  		["label"] = "Silver Ring", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "silver_ring.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["diamond_ring_silver"] 		 = {["name"] = "diamond_ring_silver", 		  	["label"] = "Diamond Ring Silver", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_ring_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["ruby_ring_silver"] 			 = {["name"] = "ruby_ring_silver", 			  	["label"] = "Ruby Ring Silver", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_ring_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["sapphire_ring_silver"] 		 = {["name"] = "sapphire_ring_silver", 		 	["label"] = "Sapphire Ring Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_ring_silver.png", ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["emerald_ring_silver"] 		 = {["name"] = "emerald_ring_silver", 		  	["label"] = "Emerald Ring Silver", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_ring_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},

["goldchain"] 				 	 = {["name"] = "goldchain", 			  	  	["label"] = "Golden Chain", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "goldchain.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["diamond_necklace"] 			 = {["name"] = "diamond_necklace", 			  	["label"] = "Diamond Necklace", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_necklace.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["ruby_necklace"] 				 = {["name"] = "ruby_necklace", 			  	["label"] = "Ruby Necklace", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_necklace.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["sapphire_necklace"] 			 = {["name"] = "sapphire_necklace", 			["label"] = "Sapphire Necklace", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_necklace.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["emerald_necklace"] 			 = {["name"] = "emerald_necklace", 			  	["label"] = "Emerald Necklace", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_necklace.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},

["silverchain"] 				 = {["name"] = "silverchain", 			  	 	["label"] = "Silver Chain", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "silverchain.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["diamond_necklace_silver"] 	 = {["name"] = "diamond_necklace_silver", 		["label"] = "Diamond Necklace Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_necklace_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["ruby_necklace_silver"] 		 = {["name"] = "ruby_necklace_silver", 			["label"] = "Ruby Necklace Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_necklace_silver.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["sapphire_necklace_silver"] 	 = {["name"] = "sapphire_necklace_silver", 		["label"] = "Sapphire Necklace Silver", ["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_necklace_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["emerald_necklace_silver"] 	 = {["name"] = "emerald_necklace_silver", 		["label"] = "Emerald Necklace Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_necklace_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},

["goldearring"] 				 = {["name"] = "goldearring", 				  	["label"] = "Golden Earrings", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "gold_earring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["diamond_earring"] 			 = {["name"] = "diamond_earring", 			  	["label"] = "Diamond Earrings", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_earring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["ruby_earring"] 				 = {["name"] = "ruby_earring", 			  		["label"] = "Ruby Earrings", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_earring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["sapphire_earring"] 			 = {["name"] = "sapphire_earring", 				["label"] = "Sapphire Earrings", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_earring.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["emerald_earring"] 			 = {["name"] = "emerald_earring", 			  	["label"] = "Emerald Earrings", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_earring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},

["silverearring"] 				 = {["name"] = "silverearring", 				["label"] = "Silver Earrings", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "silver_earring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["diamond_earring_silver"] 		 = {["name"] = "diamond_earring_silver", 		["label"] = "Diamond Earrings Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_earring_silver.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["ruby_earring_silver"] 		 = {["name"] = "ruby_earring_silver", 			["label"] = "Ruby Earrings Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_earring_silver.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["sapphire_earring_silver"] 	 = {["name"] = "sapphire_earring_silver", 		["label"] = "Sapphire Earrings Silver", ["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_earring_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["emerald_earring_silver"] 		 = {["name"] = "emerald_earring_silver", 		["label"] = "Emerald Earrings Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_earring_silver.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},

["carbon"] 					 	 = {["name"] = "carbon", 			  	  		["label"] = "Carbon", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "carbon.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Carbon, a base ore."},
["ironore"] 					 = {["name"] = "ironore", 			  	  		["label"] = "Iron Ore", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "ironore.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Iron, a base ore."},
["copperore"] 					 = {["name"] = "copperore", 			  	  	["label"] = "Copper Ore", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "copperore.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Copper, a base ore."},
["goldore"] 					 = {["name"] = "goldore", 			  	  		["label"] = "Gold Ore", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "goldore.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Gold Ore"},
["silverore"] 					 = {["name"] = "silverore", 			  	  	["label"] = "Silver Ore", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "silverore.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Silver Ore"},

["goldingot"] 					 = {["name"] = "goldingot", 			  	  	["label"] = "Gold Ingot", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "goldingot.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["silveringot"] 				 = {["name"] = "silveringot", 			  	  	["label"] = "Silver Ingot", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "silveringot.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},

["pickaxe"] 					 = {["name"] = "pickaxe", 			  	  		["label"] = "Pickaxe", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "pickaxe.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "" },
["miningdrill"] 				 = {["name"] = "miningdrill", 			  	  	["label"] = "Mining Drill", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "miningdrill.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "" },
["mininglaser"] 				 = {["name"] = "mininglaser", 			  	  	["label"] = "Mining Laser", 			["weight"] = 900, 		["type"] = "item", 		["image"] = "mininglaser.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "" },
["drillbit"] 					 = {["name"] = "drillbit", 			  	  		["label"] = "Drill Bit", 				["weight"] = 10, 		["type"] = "item", 		["image"] = "drillbit.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "" },

["goldpan"] 					 = {["name"] = "goldpan", 			  	  		["label"] = "Gold Panning Tray", 		["weight"] = 10, 		["type"] = "item", 		["image"] = "goldpan.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "" },

["bottle"] 						 = {["name"] = "bottle", 			  	  		["label"] = "Empty Bottle", 			["weight"] = 10, 		["type"] = "item", 		["image"] = "bottle.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A glass bottle"},
["can"] 						 = {["name"] = "can", 			  	  			["label"] = "Empty Can", 				["weight"] = 10, 		["type"] = "item", 		["image"] = "can.png", 					["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "An empty can, good for recycling"},

-- Jim-Recycle Items
["recyclablematerial"]  = {["name"] = "recyclablematerial",   ["label"] = "Recycle Box",      ["weight"] = 100, ["type"] = "item", 		["image"] = "recyclablematerial.png",   ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A box of Recyclable Materials"},
["bottle"]              = {["name"] = "bottle",               ["label"] = "Empty Bottle",     ["weight"] = 10,  ["type"] = "item", 		["image"] = "bottle.png",               ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A glass bottle"},
["can"]                 = {["name"] = "can",                  ["label"] = "Empty Can",        ["weight"] = 10,  ["type"] = "item", 		["image"] = "can.png",                  ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "An empty can, good for recycling"},


--Jim-Mechanic Vehicles
["mechanic_tools"] 				= {["name"] = "mechanic_tools", 			["label"] = "Mechanic tools", 		    ["weight"] = 0, 		["type"] = "item", 		["image"] = "mechanic_tools.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Needed for vehicle repairs"},
["toolbox"] 					= {["name"] = "toolbox", 			 	  	["label"] = "Toolbox", 		            ["weight"] = 0, 		["type"] = "item", 		["image"] = "toolbox.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Needed for Performance part removal"},
["ducttape"] 					= {["name"] = "ducttape", 			 	  	["label"] = "Duct Tape", 		       	["weight"] = 0, 		["type"] = "item", 		["image"] = "bodyrepair.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Good for quick fixes"},
["mechboard"] 					= {["name"] = "mechboard", 			 	  	["label"] = "Mechanic Sheet", 		   	["weight"] = 0, 		["type"] = "item", 		["image"] = "mechboard.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

--Performance
["turbo"] 		 	 		 	= {["name"] = "turbo", 						["label"] = "Supercharger Turbo", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "turbo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Who doesn't need a 65mm Turbo??"},
["car_armor"] 					= {["name"] = "car_armor", 					["label"] = "Vehicle Armor", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "armour.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

["nos"] 					    = {["name"] = "nos", 			 	  	  	["label"] = "NOS Bottle", 		        ["weight"] = 0, 		["type"] = "item", 		["image"] = "nos.png", 				    ["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "A full bottle of NOS"},
["noscan"] 					    = {["name"] = "noscan", 			 	  	["label"] = "Empty NOS Bottle", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "noscan.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,  ["combinable"] = nil,   ["description"] = "An Empty bottle of NOS"},
["noscolour"] 					= {["name"] = "noscolour", 			 	  	["label"] = "NOS Colour Injector", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "noscolour.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,  ["combinable"] = nil,   ["description"] = "Make that purge spray"},

["engine1"] 				    = {["name"] = "engine1", 			 	  	["label"] = "Shonen Engine",            ["weight"] = 0, 		["type"] = "item", 		["image"] = "shonen.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["engine2"] 				    = {["name"] = "engine2", 			 	  	["label"] = "V8 Engine",        	    ["weight"] = 0, 		["type"] = "item", 		["image"] = "v8engine.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["engine3"] 				    = {["name"] = "engine3", 			 	  	["label"] = "V10 Engine",          		["weight"] = 0, 		["type"] = "item", 		["image"] = "v10engine.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["engine4"] 				    = {["name"] = "engine4", 			 	  	["label"] = "V12 Engine",               ["weight"] = 0, 		["type"] = "item", 		["image"] = "v12engine.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

["transmission1"] 				= {["name"] = "transmission1", 				["label"] = "Transmission Lvl 1",       ["weight"] = 0, 		["type"] = "item", 		["image"] = "transmission1.png",  		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["transmission2"] 				= {["name"] = "transmission2", 				["label"] = "Transmission Lvl 2",       ["weight"] = 0, 		["type"] = "item", 		["image"] = "transmission2.png",  		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["transmission3"] 				= {["name"] = "transmission3",				["label"] = "Transmission Lvl 3",       ["weight"] = 0, 		["type"] = "item", 		["image"] = "transmission3.png",   		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

["brakes1"] 					= {["name"] = "brakes1", 			 		["label"] = "Performance Brakes",       ["weight"] = 0, 		["type"] = "item", 		["image"] = "brakes1.png", 		    	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["brakes2"] 					= {["name"] = "brakes2", 			 		["label"] = "GT Big Brakes",            ["weight"] = 0, 		["type"] = "item", 		["image"] = "brakes2.png", 		    	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["brakes3"] 					= {["name"] = "brakes3", 			 		["label"] = "Competition Brakes",       ["weight"] = 0, 		["type"] = "item", 		["image"] = "brakes3.png", 		    	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

["suspension1"] 				= {["name"] = "suspension1", 				["label"] = "Lowered Suspension", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "suspension1.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["suspension2"] 				= {["name"] = "suspension2",  				["label"] = "Street Suspension",		["weight"] = 0, 		["type"] = "item", 		["image"] = "suspension2.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Street Racing level Suspension"},
["suspension3"] 				= {["name"] = "suspension3",  				["label"] = "Racing Suspension",		["weight"] = 0, 		["type"] = "item", 		["image"] = "suspension3.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Street Racing level Suspension"},
["suspension4"] 				= {["name"] = "suspension4",  				["label"] = "Rally Suspension",			["weight"] = 0, 		["type"] = "item", 		["image"] = "suspension4.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Street Racing level Suspension"},

["bprooftires"] 				= {["name"] = "bprooftires", 			   	["label"] = "Bulletproof Tires", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "bprooftires.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["drifttires"] 					= {["name"] = "drifttires", 			   	["label"] = "Drift Tires", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "drifttires.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

--Cosmetics
["underglow_controller"] 		 = {["name"] = "underglow_controller", 		["label"] = "Neon Controller", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "underglow_controller.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   	["description"] = "RGB LED Vehicle Remote"},
["headlights"] 		 	 		 = {["name"] = "headlights", 				["label"] = "Xenon Headlights", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "headlights.png", 			["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   	["description"] = "8k HID headlights"},

["tint_supplies"] 				 = {["name"] = "tint_supplies", 			["label"] = "Tint Supplies", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "tint_supplies.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,    ["description"] = "Supplies for window tinting"},

["customplate"] 				 = {["name"] = "customplate", 				["label"] = "Customized Plates", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "plate.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["hood"] 						 = {["name"] = "hood", 						["label"] = "Vehicle Hood", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "hood.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["roof"] 						 = {["name"] = "roof", 						["label"] = "Vehicle Roof", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "roof.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["spoiler"] 					 = {["name"] = "spoiler", 					["label"] = "Vehicle Spoiler", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "spoiler.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["bumper"] 						 = {["name"] = "bumper", 					["label"] = "Vehicle Bumper", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "bumper.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["skirts"] 						 = {["name"] = "skirts", 					["label"] = "Vehicle Skirts", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "skirts.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["exhaust"] 					 = {["name"] = "exhaust", 					["label"] = "Vehicle Exhaust", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "exhaust.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["seat"] 						 = {["name"] = "seat", 						["label"] = "Seat Cosmetics", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "seat.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["rollcage"] 					 = {["name"] = "rollcage", 					["label"] = "Roll Cage", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "rollcage.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

["rims"] 						 = {["name"] = "rims", 						["label"] = "Custom Wheel Rims", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "rims.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

["livery"] 						 = {["name"] = "livery", 					["label"] = "Livery Roll", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "livery.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["paintcan"] 					 = {["name"] = "paintcan", 					["label"] = "Vehicle Spray Can", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "spraycan.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["tires"] 						 = {["name"] = "tires", 					["label"] = "Drift Smoke Tires",        ["weight"] = 0, 		["type"] = "item", 		["image"] = "tires.png", 	  		    ["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

["horn"] 						 = {["name"] = "horn", 						["label"] = "Custom Vehicle Horn", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "horn.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},

["internals"] 					 = {["name"] = "internals", 				["label"] = "Internal Cosmetics", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "internals.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},
["externals"] 					 = {["name"] = "externals", 				["label"] = "Exterior Cosmetics", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "mirror.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = ""},


vehicletracker              = { name = 'vehicletracker', label = 'Vehicle GPS Tracker', weight = 1000, type = 'item', image = 'vehicletracker.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A device placed to track a vehicle\'s location.'},
vehicletrackertablet        = { name = 'vehicletrackertablet', label = 'Vehicle Tracker Tablet', weight = 1000, type = 'item', image = 'vehicletrackertablet.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Connects to a vehicle tracker to show it\'s location.'},
vehicletrackerscanner       = { name = 'vehicletrackerscanner', label = 'Vehicle Tracker Scanner', weight = 1000, type = 'item', image = 'vehicletrackerscanner.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Scans a vehicle for existence of GPS tracker.'},


["pistol_parts"] 	= {["name"] = "pistol_parts", 	["label"] = "Pistol Parts", 	["weight"] = 500, 	["type"] = "item", 		["image"] = "pistol_parts.png", 	["unique"] = false, ["useable"] = false, ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Pistol Parts"},
["smg_parts"] 		= {["name"] = "smg_parts", 		["label"] = "SMG Parts", 		["weight"] = 500, 	["type"] = "item", 		["image"] = "smg_parts.png", 		["unique"] = false, ["useable"] = false, ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "SMG Parts"},
["shotgun_parts"] 	= {["name"] = "shotgun_parts", 	["label"] = "Shotgun Parts",	["weight"] = 500, 	["type"] = "item", 		["image"] = "shotgun_parts.png", 	["unique"] = false, ["useable"] = false, ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Shotgun Parts"},
["rifle_parts"] 	= {["name"] = "rifle_parts", 	["label"] = "Rifle Parts", 		["weight"] = 500, 	["type"] = "item", 		["image"] = "rifle_parts.png", 		["unique"] = false, ["useable"] = false, ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Rifle Parts"},

["rentalpapers"]				 = {["name"] = "rentalpapers", 					["label"] = "Rental Papers", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "rentalpapers.png", 		["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false, 	["combinable"] = nil, 	["description"] = "Yea, this is my car i can prove it!"},

["casino_goldchip"] 			 = {["name"] = "casino_goldchip", 			 ["label"] = "Casino Chip", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "casino_goldchip.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Diamond Casino Chip"},
["casino_member"] 				 = {["name"] = "casino_member", 			 ["label"] = "Casino Membership", 		["weight"] = 500, 		["type"] = "item", 		["image"] = "casino_member.png", 				["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Diamond Casino Member Card"},
["casino_vip"] 					 = {["name"] = "casino_vip", 			 	 ["label"] = "V.I.P Membership", 		["weight"] = 500, 		["type"] = "item", 		["image"] = "casino_vip.png", 				    ["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Diamond Casino V.I.P Card"},

["wheeltoken"] = {
    ["name"] = "wheeltoken",
    ["label"] = "Lucky Wheel Token",
    ["weight"] = 100,
    ["type"] = "item",
    ["image"] = "token.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["expire"] = 9,
},
['thermite_h'] = {['name'] = 'thermite_h', ['label'] = 'Thermite', ['weight'] = 1000, ['type'] = 'item', ['ammotype'] = nil, ['image'] = 'thermite_h.png', ['unique'] = true, ['useable'] = true, ['description'] = 'A low-yield thermite charge..'},
['cokelabnote']                        = {['name'] = 'cokelabnote',                          ['label'] = 'Lab Note',           ['weight'] = 1000,          ['type'] = 'item',    ['image'] = 'cokelabnote.png',                ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'A Useable note that has some information on it...'},

['fish-finder'] = { --## name goes here
    ["name"] = "fish-finder", --## name goes here
    ["label"] = "Fish Finder",  --##label goes here
    ["weight"] = 500, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "fish-finder.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "A Fish finder for locating fish in bodies of water",
},  



 ['linesnifferreel'] = { 
    ["name"] = "linesnifferreel", --## name goes here
    ["label"] = "LineSniffer Reel",  --##label goes here
    ["weight"] = 500, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "linesnifferreel.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Line Sniffer Reel used for fishing fishes & sniffing lines."
},




['rockbottomreel'] = { --## name goes here
    ["name"] = "rockbottomreel", --## name goes here
    ["label"] = "Rock Bottom Reel",  --##label goes here
    ["weight"] = 500, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "rockbottomreel.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Fishing for rock bottom used for fishing fishes."
},




['fishrusreel'] = { --## name goes here
    ["name"] = "fishrusreel", --## name goes here
    ["label"] = "Fish R Us Reel",  --##label goes here
    ["weight"] = 500, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "fishrusreel.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "The legendary fishing pole from 'Fish R Us' used for fishing fishes." --## Dscription goes here
},

['thunderreel'] = { --## name goes here
    ["name"] = "thunderreel", --## name goes here
    ["label"] = "Thunder Reel",  --##label goes here
    ["weight"] = 500, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "thunderreel.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "The thunder of reels used for fishing mega fishes." --## DEscription goes here
  },

  ['zillareel'] = { --## name goes here
    ["name"] = "zillareel", --## name goes here
    ["label"] = "Zilla Reel",  --##label goes here
    ["weight"] = 500, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "zillareel.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "The 'zilla' of all reels!" --## DEscription goes here
  },

--LINES -------------------------------------------------------------------------------

 ['kingbraid'] = { --## name goes here
    ["name"] = "kingbraid", --## name goes here
    ["label"] = "KingBraid Line",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "kingbraid.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "The kings braid for catching the most powerful fish in the sea!" --## DEscription goes here
  },

 ['cheapmono'] = { --## name goes here
    ["name"] = "cheapmono", --## name goes here
    ["label"] = "Cheap Mono Line",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "cheapmono.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Mine as well use your shoe string..." --## DEscription goes here
  },

['bitesizemono'] = { --## name goes here
    ["name"] = "bitesizemono", --## name goes here
    ["label"] = "Bite-size Mono Line",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "bitesizedmono.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "You can fit the line between your teeth!" --## DEscription goes here
  },

  ['mobeymono'] = { --## name goes here
    ["name"] = "mobeymono", --## name goes here
    ["label"] = "Mobey Mono Line",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "mobeymono.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Finally some real fishing line, time to reel em' in!" --## DEscription goes here
  },

 ['noodlebraid'] = { --## name goes here
    ["name"] = "noodlebraid", --## name goes here
    ["label"] = "NoodleBraid Line",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "noodlebraid.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "A professional grade fishing line." --## DEscription goes here
  },

  ['lightningbraid'] = { --## name goes here
    ["name"] = "lightningbraid", --## name goes here
    ["label"] = "Lightning Braid",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "lightningbraid.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "The line of lightning ready to catch fish in any waters!." --## DEscription goes here
  },
--------------------------------------------------------------------HOOKS-------
 ['no1'] = { --## name goes here
    ["name"] = "no1", --## name goes here
    ["label"] = "#1/0 Fish Hook",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "no1.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Better off using your hands. Good luck!" --## DEscription goes here
  },

  ['no2'] = { --## name goes here
    ["name"] = "no2", --## name goes here
    ["label"] = "#2/0 Fish Hook",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "no2.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "At least you can catch seaweed with this thing" --## DEscription goes here
  },

  ['no3'] = { --## name goes here
    ["name"] = "no3", --## name goes here
    ["label"] = "#3/0 Fish Hook",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "no3.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Finally a real fishing hook!" --## DEscription goes here
  },

  ['no6'] = { --## name goes here
    ["name"] = "no6", --## name goes here
    ["label"] = "#6/0 Fish Hook",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "no6.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "A deep sea fishing hook." --## DEscription goes here
  },

  ['no10'] = { --## name goes here
    ["name"] = "no10", --## name goes here
    ["label"] = "#10/0 Fish Hook",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "no10.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "A professional grade fishing hook!" --## DEscription goes here
  },
   
 ['towhook'] = { --## name goes here
    ["name"] = "towhook", --## name goes here
    ["label"] = "Tow Hook",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "towhook.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "You trying to catch a great white shark with that thing?!" --## DEscription goes here
  },

 ['valuecastrod'] = { --## name goes here
    ["name"] = "valuecastrod", --## name goes here
    ["label"] = "Value Cast Rod",  --##label goes here
    ["weight"] = 400, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "valuecastrod.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Dollar store fishing rod." --## DEscription goes here
  },
    
 ['elementalrod'] = { --## name goes here
    ["name"] = "elementalrod", --## name goes here
    ["label"] = "Elemental Rod",  --##label goes here
    ["weight"] = 350, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "elementalrod.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "A rod that can adapt to all elements." --## DEscription goes here
  },
            
   ['nerorod'] = { --## name goes here
    ["name"] = "nerorod", --## name goes here
    ["label"] = "Nero Rod",  --##label goes here
    ["weight"] = 325, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "nerorod.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Extremely durable fishing rod." --## DEscription goes here
  },

   ['brutasrod'] = { --## name goes here
    ["name"] = "brutasrod", --## name goes here
    ["label"] = "Brutas Rod",  --##label goes here
    ["weight"] = 300, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "brutasrod.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "A brute fishing pole." --## DEscription goes here
  },
 
  ['zeusrod'] = { --## name goes here
    ["name"] = "zeusrod", --## name goes here
    ["label"] = "Zeus Rod",  --##label goes here
    ["weight"] =250, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "zeusrod.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "The Zeus of fishing poles!" --## DEscription goes here
  },

  ['magnumxlrod'] = { --## name goes here
    ["name"] = "magnumxlrod", --## name goes here
    ["label"] = "Magnum XL Rod",  --##label goes here
    ["weight"] = 250, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "magnumxlrod.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "The best fishing pole on the market the 'magnum'!" --## DEscription goes here
  },

-----BAITS----------------------------------------------------------------------------------
    ['nightworms'] = { --## name goes here
    ["name"] = "nightworms", --## name goes here
    ["label"] = "Night Worms",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "nightworms.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: NightWorms" --## DEscription goes here
    },

    ['redworms'] = { --## name goes here
    ["name"] = "redworms", --## name goes here
    ["label"] = "Red Worms",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "redworms.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: RedWorms" --## DEscription goes here
    },

    ['leech'] = { --## name goes here
    ["name"] = "leech", --## name goes here
    ["label"] = "Leech",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "leech.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Leech" --## DEscription goes here
    },

    ['minnow'] = { --## name goes here
    ["name"] = "minnow", --## name goes here
    ["label"] = "Minnow",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "minnow.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Minnow" --## DEscription goes here
    },

    ['waxworms'] = { --## name goes here
    ["name"] = "waxworms", --## name goes here
    ["label"] = "Waxworms",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "waxworms.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Waxworms" --## DEscription goes here
    },

    ['mealworms'] = { --## name goes here
    ["name"] = "mealworms", --## name goes here
    ["label"] = "Mealworms",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "mealworms.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Mealworms" --## DEscription goes here
    },

    ['turtlemeat'] = { --## name goes here
    ["name"] = "turtlemeat", --## name goes here
    ["label"] = "Turtle Meat",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "turtlemeat.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Turtle Meat" --## DEscription goes here
    },

    ['bread'] = { --## name goes here
    ["name"] = "bread", --## name goes here
    ["label"] = "Bread",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "bread.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Bread" --## DEscription goes here
    },

    ['crab'] = { --## name goes here
    ["name"] = "crab", --## name goes here
    ["label"] = "Crab",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "crab.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Crab" --## DEscription goes here
    },

    ['hugecutbait'] = { --## name goes here
    ["name"] = "hugecutbait", --## name goes here
    ["label"] = "Huge Cut Bait",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "hugecutbait.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Huge Cut Bait" --## DEscription goes here
    },

    ['bacon'] = { --## name goes here
    ["name"] = "bacon", --## name goes here
    ["label"] = "Bacon",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "bacon.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Bacon" --## DEscription goes here
    },

    ['maggots'] = { --## name goes here
    ["name"] = "maggots", --## name goes here
    ["label"] = "Maggots",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "maggots.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Maggots" --## DEscription goes here
    },

    ['technoplankton'] = { --## name goes here
    ["name"] = "technoplankton", --## name goes here
    ["label"] = "Technoplankton",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "technoplankton.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Bait: Technoplankton" --## DEscription goes here
    },

--FISH-------------------------------------------------------------
    ['minnow'] = { --## name goes here
    ["name"] = "minnow", --## name goes here
    ["label"] = "Minnow",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "minnow.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Fresh Caught: Minnow" --## DEscription goes here
    },

    ['crappie'] = { --## name goes here
    ["name"] = "crappie", --## name goes here
    ["label"] = "Crappie",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "crappie.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Fresh Caught: Crappie" --## DEscription goes here
    },

    ['garfish'] = { --## name goes here
    ["name"] = "garfish", --## name goes here
    ["label"] = "Garfish",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "garfish.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Fresh Caught: Garfish" --## DEscription goes here
    },

    ['rainbowtrout'] = { --## name goes here
    ["name"] = "rainbowtrout", --## name goes here
    ["label"] = "Rainbow Trout",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "rainbowtrout.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Fresh Caught: Rainbow Trout" --## DEscription goes here
    },

    ['northernpike'] = { --## name goes here
    ["name"] = "northernpike", --## name goes here
    ["label"] = "Northern Pike",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "northernpike.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Fresh Caught: Northern Pike" --## DEscription goes here
    },

    ['salmon'] = { --## name goes here
    ["name"] = "salmon", --## name goes here
    ["label"] = "Salmon",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "salmon.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Fresh Caught: Salmon" --## DEscription goes here
    },

    ['stripedbass'] = { --## name goes here
    ["name"] = "stripedbass", --## name goes here
    ["label"] = "Striped Bass",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "stripedbass.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Fresh Caught: Striped Bass" --## DEscription goes here
    },

    ['trout'] = { --## name goes here
    ["name"] = "trout", --## name goes here
    ["label"] = "Trout",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "trout.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Fresh Caught: Trout" --## DEscription goes here
    },

    ['pollock'] = { --## name goes here
    ["name"] = "pollock", --## name goes here
    ["label"] = "Pollock",  --##label goes here
    ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
    ["type"] = "item",
    ["image"] = "pollock.png", --## name.png goes here
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = "Fresh Caught: Pollock" --## DEscription goes here
    },

    ['haddock'] = { --## name goes here
      ["name"] = "haddock", --## name goes here
      ["label"] = "Haddock",  --##label goes here
      ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
      ["type"] = "item",
      ["image"] = "haddock.png", --## name.png goes here
      ["unique"] = false,
      ["useable"] = false,
      ["shouldClose"] = true,
      ["combinable"] = nil,
      ["description"] = "Fresh Caught: Haddock" --## DEscription goes here
    },

    ['haddock'] = { --## name goes here
      ["name"] = "haddock", --## name goes here
      ["label"] = "Haddock",  --##label goes here
      ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
      ["type"] = "item",
      ["image"] = "haddock.png", --## name.png goes here
      ["unique"] = false,
      ["useable"] = false,
      ["shouldClose"] = true,
      ["combinable"] = nil,
      ["description"] = "Fresh Caught: Haddock" --## DEscription goes here
    },

    ['tuna'] = { --## name goes here
      ["name"] = "tuna", --## name goes here
      ["label"] = "Tuna",  --##label goes here
      ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
      ["type"] = "item",
      ["image"] = "tuna.png", --## name.png goes here
      ["unique"] = false,
      ["useable"] = false,
      ["shouldClose"] = true,
      ["combinable"] = nil,
      ["description"] = "Fresh Caught: Tuna" --## DEscription goes here
    },

    ['shark'] = { --## name goes here
      ["name"] = "shark", --## name goes here
      ["label"] = "Shark",  --##label goes here
      ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
      ["type"] = "item",
      ["image"] = "shark.png", --## name.png goes here
      ["unique"] = false,
      ["useable"] = false,
      ["shouldClose"] = true,
      ["combinable"] = nil,
      ["description"] = "Fresh Caught: Shark" --## DEscription goes here
    },

    ['dolphin'] = { --## name goes here
      ["name"] = "dolphin", --## name goes here
      ["label"] = "Dolphin",  --##label goes here
      ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
      ["type"] = "item",
      ["image"] = "dolphin.png", --## name.png goes here
      ["unique"] = false,
      ["useable"] = false,
      ["shouldClose"] = true,
      ["combinable"] = nil,
      ["description"] = "Fresh Caught: Dolphin" --## DEscription goes here
    },

    ['turtle'] = { --## name goes here
      ["name"] = "turtle", --## name goes here
      ["label"] = "Turtle",  --##label goes here
      ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
      ["type"] = "item",
      ["image"] = "turtle.png", --## name.png goes here
      ["unique"] = false,
      ["useable"] = false,
      ["shouldClose"] = true,
      ["combinable"] = nil,
      ["description"] = "Fresh Caught: Turtle" --## DEscription goes here
    },

    ['whale'] = { --## name goes here
      ["name"] = "whale", --## name goes here
      ["label"] = "Whale",  --##label goes here
      ["weight"] = 10, --## Think of a good weight for this item you'll know the weights better
      ["type"] = "item",
      ["image"] = "whale.png", --## name.png goes here
      ["unique"] = false,
      ["useable"] = false,
      ["shouldClose"] = true,
      ["combinable"] = nil,
      ["description"] = "Fresh Caught: Whale" --## DEscription goes here
    },

    -- sz-pizzajob
    ["pizzaslice"]=        {["name"] = "pizzaslice",		["label"] = "Pizzaslice",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzaslice.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Freshly made by Pizza This"},
    ["butter"]=        {["name"] = "butter",		["label"] = "Butter",	["weight"] = 1000, ["type"] = "item",  ["image"] = "butter.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Butter"},
    ["flour"]=        {["name"] = "flour",		["label"] = "Flour",	["weight"] = 1000, ["type"] = "item",  ["image"] = "flour.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Flour"},
    ["milk"]=        {["name"] = "milk",		["label"] = "Milk",	["weight"] = 1000, ["type"] = "item",  ["image"] = "milk.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Milk"},
    ["salt"]=        {["name"] = "salt",		["label"] = "Salt",	["weight"] = 1000, ["type"] = "item",  ["image"] = "salt.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Salt"},
    ["dough"]=        {["name"] = "dough",		["label"] = "Dough",	["weight"] = 1000, ["type"] = "item",  ["image"] = "dough.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Dough"},
    ["pizzabase"]=        {["name"] = "pizzabase",		["label"] = "Pizza Base",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzabase.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Pizza Base"},
    ["tomatosauce"]=        {["name"] = "tomatosauce",		["label"] = "Tomato Sauce",	["weight"] = 1000, ["type"] = "item",  ["image"] = "tomatosauce.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Tomato Sauce"},
    ["slicedpepperoni"]=        {["name"] = "slicedpepperoni",		["label"] = "Sliced Pepperoni",	["weight"] = 1000, ["type"] = "item",  ["image"] = "slicedpepperoni.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Sliced Pepperoni"},
    ["slicedonions"]=        {["name"] = "slicedonions",		["label"] = "Sliced Onions",	["weight"] = 1000, ["type"] = "item",  ["image"] = "slicedonion.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Sliced Onion"},
    ["slicedmeat"]=        {["name"] = "slicedmeat",		["label"] = "Sliced Meat",	["weight"] = 1000, ["type"] = "item",  ["image"] = "slicedmeat.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Sliced Meat"},
    ["gratedcheese"]=        {["name"] = "gratedcheese",		["label"] = "Grated Cheese",	["weight"] = 1000, ["type"] = "item",  ["image"] = "gratedcheese.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Grated Cheese"},
    ["pepperonipizza"]=        {["name"] = "pepperonipizza",		["label"] = "Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pepperonipizza.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Pepperoni Pizza"},
    ["uncookedpepperonipizza"]=        {["name"] = "uncookedpepperonipizza",		["label"] = "Uncooked Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "uncookedpepperonipizza.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Uncooked Pepperoni Pizza"},
    ["pepperonipizzaslice"]=        {["name"] = "pepperonipizzaslice",		["label"] = "Pepperoni Pizza Slice",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pepperonipizzaslice.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Pepperoni Pizza Slice"},
    ["pizzabox"]=        {["name"] = "pizzabox",		["label"] = "Pizza Box",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzabox.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Smell that?"},
    ["pepperonipizzabox"]=        {["name"] = "pepperonipizzabox",		["label"] = "Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzabox.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Smell that?"},
    ["cheesepizzabox"]=        {["name"] = "cheesepizzabox",		["label"] = "Cheese Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzabox.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Smell that?"},
    ["uncookedcheesepizza"]=        {["name"] = "uncookedcheesepizza",		["label"] = "Uncooked Cheese Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "uncookedcheesepizza.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Uncooked Cheese Pizza"},
    ["cheesepizzaslice"]=        {["name"] = "cheesepizzaslice",		["label"] = "Cheese Pizza Slice",	["weight"] = 1000, ["type"] = "item",  ["image"] = "cheesepizzaslice.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Cheese Pizza Slice"},
    ["cheesepizza"]=        {["name"] = "cheesepizza",		["label"] = "Cheese Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "cheesepizza.png",      ["unique"] = true,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Smell that?"},
    ["jalapenoandpepperonipizza"]=        {["name"] = "jalapenoandpepperonipizza",		["label"] = "Jalapeno & Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "jalapenoandpepperonipizza.png",      ["unique"] = false,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Jalapeno & Pepperoni Pizza"},
    ["jalapenoandpepperonipizzaslice"]=        {["name"] = "jalapenoandpepperonipizzaslice",		["label"] = "Jalapeno & Pepperoni Pizza Slice",	["weight"] = 1000, ["type"] = "item",  ["image"] = "jalapenoandpepperonipizzaslice.png",      ["unique"] = false,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Jalapeno & Pepperoni Pizza Slice"},
    ["uncookedjalapenoandpepperonipizza"]=        {["name"] = "uncookedjalapenoandpepperonipizza",		["label"] = "Uncooked Jalapeno & Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "uncookedjalapenoandpepperonipizza.png",      ["unique"] = false,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Jalapeno & Pepperoni Pizza"},
    ["jalapenoandpepperonipizzabox"]=        {["name"] = "jalapenoandpepperonipizzabox",		["label"] = "Jalapeno & Pepperoni Pizza",	["weight"] = 1000, ["type"] = "item",  ["image"] = "pizzabox.png",      ["unique"] = false,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Smell that?"},
    ["slicedjalapenos"]=        {["name"] = "slicedjalapenos",		["label"] = "Sliced Jalapenos",	["weight"] = 1000, ["type"] = "item",  ["image"] = "slicedjalapenos.png",      ["unique"] = false,  ["useable"] = false, ["shouldClose"] = false, ["description"] = "Sliced Jalapenos"},
    ["car_door"] 					 	 = {["name"] = "car_door", 			  	  		["label"] = "car door", 			["weight"] = 2000, 		["type"] = "item", 		["image"] = "car_door.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["car_hood"] 					 	 = {["name"] = "car_hood", 			  	  		["label"] = "car_hood", 			["weight"] = 2000, 		["type"] = "item", 		["image"] = "car_hood.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["car_trunk"] 					 	 = {["name"] = "car_trunk", 			  	  	["label"] = "car_trunk", 			["weight"] = 2000, 		["type"] = "item", 		["image"] = "car_trunk.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["mdlaptop"] 					 	 = {["name"] = "mdlaptop", 			  	  	    ["label"] = "Car Boost Laptop",     ["weight"] = 2000, 		["type"] = "item", 		["image"] = "mansionlaptop.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},

}







