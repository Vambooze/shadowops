local QBCore = exports['qb-core']:GetCoreObject()

local pedSpawned = false

local looted1 = true
local looted2 = true
local looted3 = true
local looted4 = true
local looted5 = true
local looted6 = true

local boxesObj = {}

local hacked = false
local unlocked = true


-- Minigame and Heist Starting 

RegisterNetEvent('sd-warehouse:client:checkitem', function()
	QBCore.Functions.TriggerCallback("sd-warehouse:ItemCheck", function(result)
		if result then
            TriggerEvent('sd-warehouse:startHeist')
		else
			QBCore.Functions.Notify('You do not have the required equipment.', "error")
		end
	end, 'thermite_h')

end)

RegisterNetEvent('sd-warehouse:targetsync', function()
hacked = true
end)

RegisterNetEvent('sd-warehouse:startHeist', function() 
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    QBCore.Functions.TriggerCallback("sd-warehouse:server:getCops", function(enoughCops)  
        if enoughCops >= Config.MinimumPolice then   
            QBCore.Functions.TriggerCallback("sd-warehouse:server:cooldown", function(cooldown)  
                if not cooldown then
                    if #(coords - Config.FirstHack) < 2.0 then  
                        exports["memorygame"]:thermiteminigame(Config.Blocks, Config.Attempts, Config.Show, Config.Time, function() 
                            if Config.EnableMultiplayer then
                                TriggerServerEvent('sd-warehouse:server:targetsync')
                            end
                            hacked = true
                            firsthack()
                            policeAlert()
                            if Config.SpawnGuards then
                                TriggerEvent('sd-warehouse:client:npcSync')
                            end
                            if Config.PoliceCanRaid then
                            TriggerServerEvent('sd-warehouse:server:PoliceRaid')
                            end
                            QBCore.Functions.Notify('The Electronic Locks have been disabled!', 'success')
                            TriggerServerEvent('sd-warehouse:server:startCooldown')
                            print('cooldown started')

                        end, function() 
                            QBCore.Functions.Notify('You failed!', "error")
                        end) 
                    end
                else
                    QBCore.Functions.Notify('This place has been robbed recently!', 'error')
                end
            end)
            
        else
            QBCore.Functions.Notify('Not enough cops!', 'error')
        end
    end)
end)

-- Police Alert

function policeAlert()
    exports['ps-dispatch']:Warehouse()
	-- TriggerServerEvent('police:server:policeAlert', 'Bobcat Robbery') -- Regular qbcore
    -- These are just examples, you'll have to implement your own police alert system!
end 

-- Blip Creation

Citizen.CreateThread(function()
	for _, info in pairs(Config.BlipLocation) do
		if Config.UseBlip then
	   		info.blip = AddBlipForCoord(info.x, info.y, info.z)
	   		SetBlipSprite(info.blip, info.id)
	   		SetBlipDisplay(info.blip, 4)
	   		SetBlipScale(info.blip, 0.6)	
	   		SetBlipColour(info.blip, info.colour)
	   		SetBlipAsShortRange(info.blip, true)
	   		BeginTextCommandSetBlipName("STRING")
	   		AddTextComponentString(info.title)
	   		EndTextCommandSetBlipName(info.blip)
	 	end
   	end	
end)

Citizen.CreateThread(function()
	for _, info in pairs(Config.BlipLocation) do
		if Config.UseBlip then
	   		info.blip = AddBlipForCoord(info.x, info.y, info.z)
	   		SetBlipSprite(info.blip, info.id)
	   		SetBlipDisplay(info.blip, 4)
	   		SetBlipScale(info.blip, 0.6)	
	   		SetBlipColour(info.blip, info.colour)
	   		SetBlipAsShortRange(info.blip, true)
	   		BeginTextCommandSetBlipName("STRING")
	   		AddTextComponentString(info.title)
	   		EndTextCommandSetBlipName(info.blip)
	 	end
   	end	
end)

-- Front door Escape

RegisterNetEvent('sd-warehouse:targetsync2', function()
unlocked = true
end)

local function frontdoorunlock(success)
    if success then
        TriggerEvent('mhacking:hide')
        if Config.EnableMultiplayer then
            TriggerServerEvent('sd-warehouse:server:targetsync2')
        end
        unlocked = true
        Wait(1000) 
    else
    TriggerEvent('mhacking:hide')
    end
end

RegisterNetEvent('sd-warehouse:openFrontDoor', function()    
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)   
    if #(coords - Config.SecondHack) < 2.0 then  
    
        Wait(1000)
        TriggerEvent("mhacking:show")
        TriggerEvent("mhacking:start", math.random(2, 11), 25, frontdoorunlock)
    end
end)

-- Police - enable outside locks

RegisterNetEvent('sd-warehouse:enablelocks', function()    
    hacked = false
end)

-- Spawn Props

function buildInteriorDesign()
    for _, pickuploc in pairs(Config.RandomLocations) do
      local model = GetHashKey(Config.WarehouseObjects[math.random(1, #Config.WarehouseObjects)])
      RequestModel(model)
      while not HasModelLoaded(model) do
        Wait(0)
      end
      local obj = CreateObject(model, pickuploc.x, pickuploc.y, pickuploc.z, false, true, true)
      PlaceObjectOnGroundProperly(obj)
      FreezeEntityPosition(obj, true)
    end
  end

function buildInteriorBoxes()
    for _, pickuploc in pairs(Config.LootLocations) do
      local model = GetHashKey(Config.WarehouseLoot[math.random(1, #Config.WarehouseLoot)])
      RequestModel(model)
      while not HasModelLoaded(model) do
        Wait(0)
      end
      local obj = CreateObject(model, pickuploc.x, pickuploc.y, pickuploc.z, false, true, true)
      PlaceObjectOnGroundProperly(obj)
      FreezeEntityPosition(obj, true)
    end
  end

-- Teleport Functions

RegisterNetEvent('sd-warehouse:enableconfiglocks', function()
    unlocked = false
end)

RegisterNetEvent("sd-warehouse:teleportenter")
AddEventHandler("sd-warehouse:teleportenter", function()
	local p = PlayerPedId()
	DoScreenFadeOut(1000)
	Citizen.Wait(1500)
    buildInteriorDesign()
    buildInteriorBoxes()
	SetEntityHeading(p, 88.37)
	SetEntityCoords(p,1071.48, -3102.28, -38.99)	
	Citizen.Wait(1000)
	DoScreenFadeIn(500)
    RemoveBlip(Blip)
    if Config.EnableLocks then
    TriggerServerEvent('sd-warehouse:server:enableconfiglocks')
    QBCore.Functions.Notify('As you enter, the backup generators kick in! All exits automatically lock!', 'error')
    end
end)

RegisterNetEvent("sd-warehouse:teleportenter2")
AddEventHandler("sd-warehouse:teleportenter2", function()
	local p = PlayerPedId()
	DoScreenFadeOut(1000)
	Citizen.Wait(1500)
	SetEntityHeading(p, 273.71)
	SetEntityCoords(p,1048.68, -3097.18, -39.0)	
	Citizen.Wait(1000)
	DoScreenFadeIn(500)
end)

RegisterNetEvent("sd-warehouse:teleportleave")
AddEventHandler("sd-warehouse:teleportleave", function()
	local p = PlayerPedId()
	DoScreenFadeOut(1000)
	Citizen.Wait(1500)
	SetEntityHeading(p, 93.66)
	SetEntityCoords(p,-619.57, -1130.37, 22.18)	
	Citizen.Wait(1000)
	DoScreenFadeIn(500)
end)

RegisterNetEvent("sd-warehouse:teleportleave2")
AddEventHandler("sd-warehouse:teleportleave2", function()
	local p = PlayerPedId()
	DoScreenFadeOut(1000)
	Citizen.Wait(1500)
	SetEntityHeading(p, 267.38)
	SetEntityCoords(p,-601.26, -1135.79, 22.32)	
	Citizen.Wait(1000)
	DoScreenFadeIn(500)
end)

-- Animations

function firsthack()
    loadAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 3.37)
    Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(-600.95, -1163.79, 22.20, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), -600.95, -1163.79, 22.20,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomb = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bomb, false, true)
    AttachEntityToEntity(bomb, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomb, 1, 1)
    FreezeEntityPosition(bomb, true)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TriggerEvent("sd-warehouse:ptfxparticle")
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomb)
    StopParticleFxLooped(effect, 0)
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermite_h", 1) 
end 

-- Particles 

RegisterNetEvent("sd-warehouse:ptfxparticle", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Wait(1)
    end
        ptfx = vector3(-600.9, -1162.88, 22.24)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Wait(6500) 
    StopParticleFxLooped(effect, 0)
end)  


-- Guard Spawns

local guards = {} 

RegisterNetEvent('sd-warehouse:client:npcSync', function()
    SpawnGuards()
end) 


function SpawnGuards()
    ClearAreaOfEverything(894.35, -2278.84, 30.44, 65.34, true, true, true, true)
    local ped = PlayerPedId() 

    SetPedRelationshipGroupHash(ped, GetHashKey("PLAYER"))
    AddRelationshipGroup("Guards")

    for i = 1, #Config.Guards do 
        local guard = Config.Guards[i]
        RequestModel(GetHashKey(guard.ped))
        while not HasModelLoaded(GetHashKey(guard.ped)) do 
            Wait(1)
        end
        guards[i] = CreatePed(4, GetHashKey(guard.ped), guard.pos[1], guard.pos[2], guard.pos[3], guard.pos[4], true, true)  
        SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(guards[i]), true) 
        GiveWeaponToPed(guards[i], GetHashKey(guard.weapon), 255, false, false) 
        SetPedRelationshipGroupHash(guards[i], GetHashKey("Guards"))
        SetPedAccuracy(guards[i], guard.accuracy)
        SetPedArmour(guards[i], guard.armor)
        SetPedFleeAttributes(guards[i], 0, false)
        SetPedCanSwitchWeapon(guards[i], true)
        SetPedDropsWeaponsWhenDead(guards[i], false)
        SetPedAsEnemy(guards[i], true)
        SetPedCombatMovement(guards[i], guard.aggresiveness)
        SetPedAlertness(guards[i], guard.alertness)
        SetPedCombatRange(guards[i], guard.range)
        SetPedSeeingRange(guards[i], 150.0)
        SetPedHearingRange(guards[i], 150.0)
        SetPedCombatAttributes(guards[i], 5000, 1)
        SetPedCanRagdollFromPlayerImpact(guards[i], false)
        SetEntityAsMissionEntity(guards[i])
        SetEntityVisible(guards[i], true)
        SetEntityMaxHealth(guards[i], guard.health)
        SetEntityHealth(guards[i], guard.health) 
        TaskGuardCurrentPosition(guards[i], 5.0, 5.0, 1) 
    end

    SetRelationshipBetweenGroups(0, GetHashKey("Guards"), GetHashKey("Guards"))
    SetRelationshipBetweenGroups(5, GetHashKey("Guards"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("Guards"))	
end

-- Looting Animations & Events

local currentRegister   = 0

RegisterNetEvent('sd-warehouse:client:giveRandomBox1', function()
    QBCore.Functions.Progressbar("LootCrate", "Looting Crate", 4500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "creatures@rottweiler@tricks@",
            anim = "petting_franklin",
            flags = 16,
        }, {}, {}, function() -- Done
        TriggerServerEvent('sd-warehouse:giveRandomBox1')
        looted1 = false  
    end, function()
        QBCore.Functions.Notify('Canceled', 'error', 2500)
    end)
end)

RegisterNetEvent('sd-warehouse:client:giveRandomBox2', function()
    QBCore.Functions.Progressbar("LootCrate", "Looting Crate", 4500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "creatures@rottweiler@tricks@",
        anim = "petting_franklin",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('sd-warehouse:giveRandomBox2')
        looted2 = false
    end, function()
        QBCore.Functions.Notify('Canceled', 'error', 2500)
    end)
end)

RegisterNetEvent('sd-warehouse:client:giveRandomBox3', function()
    QBCore.Functions.Progressbar("LootCrate", "Looting Crate", 4500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "creatures@rottweiler@tricks@",
        anim = "petting_franklin",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('sd-warehouse:giveRandomBox3') 
        looted3 = false
    end, function()
        QBCore.Functions.Notify('Canceled', 'error', 2500)
    end)
end)

RegisterNetEvent('sd-warehouse:client:giveRandomBox4', function()
    QBCore.Functions.Progressbar("LootCrate", "Looting Crate", 4500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "creatures@rottweiler@tricks@",
        anim = "petting_franklin",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('sd-warehouse:giveRandomBox4') 
        looted4 = false
    end, function()
        QBCore.Functions.Notify('Canceled', 'error', 2500)
    end)
end)

RegisterNetEvent('sd-warehouse:client:giveRandomBox5', function()
    QBCore.Functions.Progressbar("LootCrate", "Looting Crate", 4500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "creatures@rottweiler@tricks@",
        anim = "petting_franklin",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('sd-warehouse:giveRandomBox5') 
        looted5 = false
    end, function()
        QBCore.Functions.Notify('Canceled', 'error', 2500)
    end)
end)

RegisterNetEvent('sd-warehouse:client:giveRandomBox6', function()
    QBCore.Functions.Progressbar("LootCrate", "Looting Crate", 4500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "creatures@rottweiler@tricks@",
        anim = "petting_franklin",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('sd-warehouse:giveRandomBox6') 
        looted6 = false
    end, function()
        QBCore.Functions.Notify('Canceled', 'error', 2500)
    end)
end)


-- Ending Event

RegisterNetEvent('sd-warehouse:client:endHeist', function()  
    local looted1 = true
    local looted2 = true
    local looted3 = true
    local looted4 = true
    local looted5 = true
    local looted6 = true
    
    local hacked = false
    local unlocked = false
end)

-- Target Export for the first Hack

CreateThread(function()
exports["qb-target"]:AddCircleZone("FirstHack", vector3(-601.01, -1163.98, 22.66), 1.5, {
    name = "FirstHack",
    useZ = true,
    --debugPoly=true
    }, {
        options = {
            {
                type = "client",
                event = "sd-warehouse:client:checkitem",
                icon = "fas fa-user-secret",
                label = "Disable Security",

            },
         },
        distance = 2.1
    })
end)

-- Target Exports for looting.

CreateThread(function()
exports["qb-target"]:AddCircleZone("Box1", vector3(1067.38, -3102.51, -39.08), 1.5, {
        name = "Box1",
        useZ = true,
        --debugPoly=true
        }, {
            options = {
                {
                    type = "client",
                    event = "sd-warehouse:client:giveRandomBox1",
                    icon = "fas fa-box",
                    label = "Loot Crate",

                    canInteract = function()
                        if looted1 then return true else return false end 
                    end
                },
             },
            distance = 2.1
        })

exports["qb-target"]:AddCircleZone("Box2", vector3(1065.13, -3095.64, -38.96),  1.5, {
            name = "Box2",
            useZ = true,
            --debugPoly=true
            }, {
                options = {
                    {
                        type = "client",
                        event = "sd-warehouse:client:giveRandomBox2",
                        icon = "fas fa-box",
                        label = "Loot Crate",

                        canInteract = function()
                            if looted2 then return true else return false end 
                        end
                    },
                 },
                distance = 2.1
            })


exports["qb-target"]:AddCircleZone("Box3", vector3(1055.6, -3096.04, -39.06),  1.5, {
                name = "Box3",
                useZ = true,
                --debugPoly=true
                }, {
                    options = {
                        {
                            type = "client",
                            event = "sd-warehouse:client:giveRandomBox3",
                            icon = "fas fa-box",
                            label = "Loot Crate",

                            canInteract = function()
                                if looted3 then return true else return false end 
                            end
                        },
                     },
                    distance = 2.1
                })


exports["qb-target"]:AddCircleZone("Box4", vector3(1053.02, -3102.57, -39.07),  1.5, {
                name = "Box4",
                useZ = true,
                --debugPoly=true
                }, {
                    options = {
                        {
                            type = "client",
                            event = "sd-warehouse:client:giveRandomBox4",
                            icon = "fas fa-box",
                            label = "Loot Crate",

                            canInteract = function()
                                if looted4 then return true else return false end 
                            end
                        },
                     },
                    distance = 2.1
                })

exports["qb-target"]:AddCircleZone("Box5", vector3(1052.95, -3110.12, -39.21), 1.5, {
                name = "Box5",
                useZ = true,
                --debugPoly=true
                }, {
                    options = {
                        {
                            type = "client",
                            event = "sd-warehouse:client:giveRandomBox5",
                            icon = "fas fa-box",
                            label = "Loot Crate",

                            canInteract = function()
                                if looted5 then return true else return false end 
                            end
                        },
                     },
                    distance = 2.1
                })

exports["qb-target"]:AddCircleZone("Box6", vector3(1055.45, -3110.29, -39.17), 1.5, {
                name = "Box6",
                useZ = true,
                --debugPoly=true
                }, {
                    options = {
                        {
                            type = "client",
                            event = "sd-warehouse:client:giveRandomBox6",
                            icon = "fas fa-box",
                            label = "Loot Crate",

                            canInteract = function()
                                if looted6 then return true else return false end 
                            end
                        },
                     },
                    distance = 2.1
                })


-- Target Exports / Teleportation, Hacking etc.

exports["qb-target"]:AddCircleZone("Hack", vector3(1048.4, -3100.69, -39.0), 0.3, {
    name = "Hack",
    useZ = true,
    --debugPoly=true
    }, {
        options = {
            {
                type = "client",
                event = "sd-warehouse:openFrontDoor",
                icon = "fas fa-user-secret",
                label = "Disable Locks"
            },
            {
                type = "server",
                event = "sd-warehouse:server:lockdoors",
                icon = "fas fa-user-secret",
                label = "Enable Locks",
                job = "police",
            },
         },
        distance = 2.1
    })    

exports["qb-target"]:AddCircleZone("Enter", vector3(-618.15, -1130.59, 22.18), 2.0, {
        name = "Enter",
        useZ = true,
        --debugPoly=true
        }, {
            options = {
                {
                    type = "client",
                    event = "sd-warehouse:teleportenter",
                    icon = "fas fa-sign-in-alt",
                    label = "Enter Warehouse",

                    canInteract = function()
                        if hacked then return true else return false end 
                    end
                },
             },
            distance = 2.1
        })

exports["qb-target"]:AddCircleZone("Enter2", vector3(-602.27, -1135.73, 22.77), 2.0, {
        name = "Enter2",
        useZ = true,
        --debugPoly=true
        }, {
            options = {
                {
                    type = "client",
                    event = "sd-warehouse:teleportenter2",
                    icon = "fas fa-sign-in-alt",
                    label = "Enter Warehouse",
                    job = "police",

                    canInteract = function()
                        if policeraid then return true else return false end 
                    end
                },
             },
            distance = 2.1
        })

exports["qb-target"]:AddCircleZone("Leave", vector3(1073.61, -3102.64, -39.0), 2.0, {
            name = "Leave",
            useZ = true,
            --debugPoly=true
            }, {
                options = {
                    {
                        type = "client",
                        event = "sd-warehouse:teleportleave",
                        icon = "fas fa-sign-in-alt",
                        label = "Leave Warehouse",

                        canInteract = function()
                            if unlocked then return true else return false end 
                        end
                    },
                 },
                distance = 2.1
            }) 

exports["qb-target"]:AddCircleZone("Leave2", vector3(1047.34, -3097.14, -39.0), 1.3, {
            name = "Leave2",
            useZ = true,
            --debugPoly=true
            }, {
                options = {
                    {
                        type = "client",
                        event = "sd-warehouse:teleportleave2",
                        icon = "fas fa-sign-in-alt",
                        label = "Leave Warehouse",

                        canInteract = function()
                            if unlocked then return true else return false end 
                        end
                    },
                 },
                distance = 2.1
            }) 
        end)

-- Police Raid Teleport

RegisterNetEvent('sd-warehouse:PoliceRaid', function() 
    if Config.PoliceCanRaid == true then 
exports["qb-target"]:AddCircleZone("Enter2", vector3(-602.01, -1135.69, 22.32), 2.0, {
        name = "Enter2",
        useZ = true,
        --debugPoly=true
        }, {
            options = {
                {
                    type = "client",
                    event = "sd-warehouse:teleportenter2",
                    icon = "fas fa-sign-in-alt",
                    label = "Enter Warehouse",
                    job = "police"

                },
             },
            distance = 2.1
        })
    end
end) 

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end 



