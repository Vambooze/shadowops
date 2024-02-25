
if not Config.WeaponSystem then return end 
local Frame = GetFrame()
Frame.Functions.CreateUseableItem('pistol_ammo', function(source, item)
    TriggerClientEvent('origen_inventory:weapon:client:AddAmmo', source, 'AMMO_PISTOL', 12, item)
end)

Frame.Functions.CreateUseableItem('rifle_ammo', function(source, item)
    TriggerClientEvent('origen_inventory:weapon:client:AddAmmo', source, 'AMMO_RIFLE', 30, item)
end)

Frame.Functions.CreateUseableItem('smg_ammo', function(source, item)
    TriggerClientEvent('origen_inventory:weapon:client:AddAmmo', source, 'AMMO_SMG', 20, item)
end)

Frame.Functions.CreateUseableItem('shotgun_ammo', function(source, item)
    TriggerClientEvent('origen_inventory:weapon:client:AddAmmo', source, 'AMMO_SHOTGUN', 10, item)
end)

Frame.Functions.CreateUseableItem('mg_ammo', function(source, item)
    TriggerClientEvent('origen_inventory:weapon:client:AddAmmo', source, 'AMMO_MG', 30, item)
end)

Frame.Functions.CreateUseableItem('snp_ammo', function(source, item)
    TriggerClientEvent('origen_inventory:weapon:client:AddAmmo', source, 'AMMO_SNIPER', 10, item)
end)

-- TINTS
Frame.Functions.CreateUseableItem('weapontint_black', function(source)
    TriggerClientEvent('origen_inventory:weapons:client:EquipTint', source, 0)
end)

Frame.Functions.CreateUseableItem('weapontint_green', function(source)
    TriggerClientEvent('origen_inventory:weapons:client:EquipTint', source, 1)
end)

Frame.Functions.CreateUseableItem('weapontint_gold', function(source)
    TriggerClientEvent('origen_inventory:weapons:client:EquipTint', source, 2)
end)

Frame.Functions.CreateUseableItem('weapontint_pink', function(source)
    TriggerClientEvent('origen_inventory:weapons:client:EquipTint', source, 3)
end)

Frame.Functions.CreateUseableItem('weapontint_army', function(source)
    TriggerClientEvent('origen_inventory:weapons:client:EquipTint', source, 4)
end)

Frame.Functions.CreateUseableItem('weapontint_lspd', function(source)
    TriggerClientEvent('origen_inventory:weapons:client:EquipTint', source, 5)
end)

Frame.Functions.CreateUseableItem('weapontint_orange', function(source)
    TriggerClientEvent('origen_inventory:weapons:client:EquipTint', source, 6)
end)

Frame.Functions.CreateUseableItem('weapontint_plat', function(source)
    TriggerClientEvent('origen_inventory:weapons:client:EquipTint', source, 7)
end)

Frame.Functions.CreateUseableItem('pistol_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('pistol_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('pistol_flashlight', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'flashlight')
end)

Frame.Functions.CreateUseableItem('pistol_suppressor', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'suppressor')
end)

Frame.Functions.CreateUseableItem('pistol_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('combatpistol_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('combatpistol_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('combatpistol_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('appistol_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('appistol_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('appistol_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('pistol50_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('pistol50_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('pistol50_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('revolver_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('revolver_vipvariant', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'vipvariant')
end)

Frame.Functions.CreateUseableItem('revolver_bodyguardvariant', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'bodyguardvariant')
end)

Frame.Functions.CreateUseableItem('snspistol_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('snspistol_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('snspistol_grip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'grip')
end)

Frame.Functions.CreateUseableItem('heavypistol_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('heavypistol_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('heavypistol_grip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'grip')
end)

Frame.Functions.CreateUseableItem('vintagepistol_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('vintagepistol_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('combatpistol_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('microsmg_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('microsmg_scope', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'scope')
end)

Frame.Functions.CreateUseableItem('appistol_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('microsmg_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('smg_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('smg_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('smg_drum', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'drum')
end)

Frame.Functions.CreateUseableItem('smg_scope', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'scope')
end)

Frame.Functions.CreateUseableItem('smg_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('assaultsmg_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('assaultsmg_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('assaultsmg_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('minismg_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('minismg_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('machinepistol_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('machinepistol_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('machinepistol_drum', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'drum')
end)

Frame.Functions.CreateUseableItem('combatpdw_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('combatpdw_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('combatpistol_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('combatpdw_drum', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'drum')
end)

Frame.Functions.CreateUseableItem('combatpdw_grip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'grip')
end)

Frame.Functions.CreateUseableItem('combatpdw_scope', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'scope')
end)

Frame.Functions.CreateUseableItem('shotgun_suppressor', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'suppressor')
end)

Frame.Functions.CreateUseableItem('pumpshotgun_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('sawnoffshotgun_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('assaultshotgun_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('assaultshotgun_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('heavyshotgun_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('heavyshotgun_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('heavyshotgun_drum', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'drum')
end)

Frame.Functions.CreateUseableItem('assaultrifle_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('assaultrifle_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('assaultrifle_drum', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'drum')
end)

Frame.Functions.CreateUseableItem('rifle_flashlight', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'flashlight')
end)

Frame.Functions.CreateUseableItem('rifle_grip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'grip')
end)

Frame.Functions.CreateUseableItem('rifle_suppressor', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'suppressor')
end)

Frame.Functions.CreateUseableItem('assaultrifle_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('carbinerifle_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('carbinerifle_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('carbinerifle_drum', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'drum')
end)

Frame.Functions.CreateUseableItem('combatpdw_grip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'grip')
end)

Frame.Functions.CreateUseableItem('carbinerifle_scope', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'scope')
end)

Frame.Functions.CreateUseableItem('carbinerifle_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('advancedrifle_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('advancedrifle_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('advancedrifle_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('assaultshotgun_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('specialcarbine_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('specialcarbine_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('specialcarbine_drum', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'drum')
end)

Frame.Functions.CreateUseableItem('specialcarbine_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('specialcarbine_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('bullpuprifle_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('bullpuprifle_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('bullpuprifle_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('compactrifle_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('assaultrifle_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

Frame.Functions.CreateUseableItem('compactrifle_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('compactrifle_drum', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'drum')
end)

Frame.Functions.CreateUseableItem('carbinerifle_drum', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'drum')
end)

Frame.Functions.CreateUseableItem('gusenberg_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('gusenberg_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('sniperrifle_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('sniper_scope', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'scope')
end)

Frame.Functions.CreateUseableItem('snipermax_scope', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'scope')
end)

Frame.Functions.CreateUseableItem('sniper_grip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'grip')
end)

Frame.Functions.CreateUseableItem('heavysniper_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('marksmanrifle_defaultclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

Frame.Functions.CreateUseableItem('marksmanrifle_extendedclip', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

Frame.Functions.CreateUseableItem('marksmanrifle_scope', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'scope')
end)

Frame.Functions.CreateUseableItem('marksmanrifle_luxuryfinish', function(source, item)
    TriggerClientEvent('origen_inventory:weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)
