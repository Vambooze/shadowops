local QBCore = exports['qb-core']:GetCoreObject()

local CurrentCops = 0
local PlayerData = QBCore.Functions.GetPlayerData()
local Goodies = false
local ValidPackages = false
local VehicleSpawned = false
local GotTimer = false
local GotPackages = false
local GotMeetLoc = false
local SupplierSpawned = false
local CollectedItems = 0
local DeliveredItems = 0
local PedSpawned = false
local canDrop = false
local CanCollect = false
local caseprop = false
local GotCase = false

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

CreateThread(function()
    QBCore.Functions.LoadModel(Config.PedHash)
    local MethPed = CreatePed(0, Config.PedHash, Config.PedPos.x, Config.PedPos.y, Config.PedPos.z-1.0, Config.PedPos.w, false, false)
	TaskStartScenarioInPlace(MethPed, 'WORLD_HUMAN_SMOKING_POT', true)
	FreezeEntityPosition(MethPed, true)
	SetEntityInvincible(MethPed, true)
	SetBlockingOfNonTemporaryEvents(MethPed, true)

    exports['qb-target']:AddTargetEntity(MethPed, {
        options = {
            {
                icon = 'fas fa-box',
                label = 'Hand Goodies',
                canInteract = function()
                    if not ValidPackages then return true end
                    return false
                end,
                action = function()
                    StartItems()
                end,
            },
            {
                icon = 'fas fa-list-check',
                label = 'Get Task',
                canInteract = function()
                    if not Goodies then return true end
                    return false
                end,
                action = function()
                    TriggerEvent('kevin-methruns:client:GetTask')
                end,
            },
            {
                icon = 'fas fa-check',
                label = 'Check Goods',
                canInteract = function()
                    if not ValidPackages then return true end
                    return false
                end,
                action = function()
                    if CurrentCops >= Config.CopNeeded then
                        if Config.UseMethCooldown then
                            QBCore.Functions.TriggerCallback("kevin-methruns:server:coolc",function(isCooldown)
                                if not isCooldown then
                                    TriggerServerEvent('kevin-methruns:server:verifyitems')
                                else
                                    QBCore.Functions.Notify("No deliveries available right now..", 'error')
                                end
                            end)
                        else
                            TriggerServerEvent('kevin-methruns:server:verifyitems')
                        end
                    else
                        QBCore.Functions.Notify("You cannot do this right now..", 'error', 4000)
                    end
                end,
            },
            {
                icon = 'fas fa-mobile-screen-button',
                label = 'Check Status',
                action = function()
                    TriggerServerEvent('kevin-methruns:server:GetRep')
                end,
            },
            {
                icon = 'fas fa-list-check',
                label = 'Collect Reward',
                canInteract = function()
                    if CanCollect then return true end
                    return false
                end,
                action = function()
                    TriggerServerEvent('kevin-methruns:server:getCase')
                    CanCollect = false
                    GotCase = true
                end,
            },
        },
        distance = 2.0
    })
end)

function StartItems()
    TriggerEvent("inventory:client:SetCurrentStash", "Handoff")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Handoff", {
        maxweight = 4000000,
        slots = 50,
    })
end

RegisterNetEvent('kevin-methruns:client:verifypackages', function ()
    ValidPackages = true
    QBCore.Functions.Notify("These look good to me, you can grab your task now.", 'success', 3500)
end)

RegisterNetEvent('kevin-methruns:client:GetTask', function ()
    TriggerServerEvent("kevin-methruns:server:coolout")
    if ValidPackages then
        Goodies = true
        if Config.Notify == 'phone' then
            if Config.Phone == 'qb' then
                TriggerServerEvent('qb-phone:server:sendNewMail', {
                    sender = ('Boss'),
                    subject = ('Meth Run'),
                    message = ('Get the vehicle marked on your gps..'),
                    })
            elseif Config.Phone == 'gks' then
                TriggerEvent('gksphone:notifi', {title = "TASK NOTIFICATION", message = "Get the vehicle marked on your gps..", img= '/html/static/img/icons/messages.png'})
            end
        elseif Config.Notify == 'qb' then
            QBCore.Functions.Notify('Get the vehicle marked on your gps..', 'primary', 4000)
        end
        carloc = Config.CarSpawns[math.random(#Config.CarSpawns)]

        VehBlip = AddBlipForCoord(carloc.x, carloc.y, carloc.z)
        SetBlipSprite(VehBlip, 1)
        SetBlipColour(VehBlip, 13)
        SetBlipScale(VehBlip, 0.85)
        SetBlipRoute(VehBlip, true)
        SetBlipRouteColour(VehBlip, 43)

        local StartZone = CircleZone:Create(vector3(carloc), 200.5, {
            name = 'Start Location',
            debugPoly = false,
        })
        StartZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                if not VehicleSpawned then
                    StartZone:destroy()
                    ClearAreaOfVehicles(carloc.x, carloc.y, carloc.z, 15.0, false, false, false, false, false)
                    local VehHash = Config.VehicleNames[math.random(#Config.VehicleNames)]
                    QBCore.Functions.LoadModel(VehHash)
                    RunVehicle = CreateVehicle(VehHash, carloc.x, carloc.y, carloc.z, carloc.w, true, true)
                    SetVehicleDirtLevel(RunVehicle, 0)

                    SetEntityAsMissionEntity(RunVehicle)
                    VehicleSpawned = true
                    
                    CreateThread(function ()
                        while true do
                            if IsPedInVehicle(PlayerPedId(), RunVehicle) and not GotTimer then
                                RemoveBlip(VehBlip)
                                Start()
                            end
                            Wait(100)
                        end
                    end)
                end
            end
        end)
    else
        QBCore.Functions.Notify("Wow there buddy, don't jump the gun now", 'error', 4000)
    end
end)

function Start()
    if Config.Notify == 'phone' then
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = ('Boss'),
                subject = ('Meth Run'),
                message = ('Meet the supplier and get the products.'),
                })
        elseif Config.Phone == 'gks' then
            TriggerEvent('gksphone:notifi', {title = "TASK NOTIFICATION", message = 'Meet the supplier and get the products', img= '/html/static/img/icons/messages.png'})
        end
    elseif Config.Notify == 'qb' then
        QBCore.Functions.Notify('Meet the supplier and get the products', 'primary', 4000)
    end
    GotTimer = true
    data = Config.PickupLocations[math.random(#Config.PickupLocations)]

    PedBlip = AddBlipForCoord(data.PedSpawn)
    SetBlipSprite(PedBlip, 1)
    SetBlipColour(PedBlip, 0)
    SetBlipScale(PedBlip, 0.75)
    SetBlipRoute(PedBlip, true)
    SetBlipRouteColour(PedBlip, 43)

    local PickUpZone = CircleZone:Create(vector3(data.PedSpawn.x, data.PedSpawn.y, data.PedSpawn.z), 200.5, {
        name = 'Pickup Location',
        debugPoly = false,
    })
    PickUpZone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            if not SupplierSpawned then
                QBCore.Functions.Notify('Be sure that you have enough space on you, these can be heavy', 'primary', 4000)
                PickUpZone:destroy()
                QBCore.Functions.LoadModel(Config.PedHash)
                Supplier = CreatePed(0, Config.PedHash, data.PedSpawn.x, data.PedSpawn.y, data.PedSpawn.z-1.0, data.PedSpawn.w, true, true)
                FreezeEntityPosition(Supplier, true)
                SetEntityInvincible(Supplier, true)

                SupplierSpawned = true
                CreateThread(function ()
                    exports['qb-target']:AddTargetEntity(Supplier, {
                        options = {
                            {
                                icon = 'fas fa-box',
                                label = 'Pickup Goods',
                                canInteract = function()
                                    if not GotPackages then return true end
                                    return false
                                end,
                                action = function()
                                    Collect()
                                end,
                            },
                        },
                        distance = 2.0
                    })
                end)
            end
        end
    end)
end

function Collect()
    RecievedPackages = Config.Items
    CollectedItems = CollectedItems +1
    TriggerServerEvent('kevin-methruns:server:giveproducts')
    if CollectedItems == RecievedPackages then
        SetPedAsNoLongerNeeded(Supplier)

        if PlayerData.metadata["methruns"] <= Config.LevelRep then
            for k, v in pairs(data.AmbushSpawn) do
                QBCore.Functions.LoadModel(Config.AmbushPed)
                AmbushPeds = CreatePed(0, Config.AmbushPed, v.x, v.y, v.z, v.w, true, true)
                SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(AmbushPeds), true)
                SetPedAccuracy(AmbushPeds, Config.LowRepPedAccuracy)
                SetPedArmour(AmbushPeds, Config.LowRepPedArmor)
                SetPedMaxHealth(AmbushPeds, Config.LowRepPedHealth)
                SetPedRelationshipGroupHash(AmbushPeds, `HATES_PLAYER`)
                SetPedKeepTask(AmbushPeds, true)
                SetCanAttackFriendly(AmbushPeds, false, true)
                TaskCombatPed(AmbushPeds, PlayerPedId(), 0, 16)
                SetPedCombatAttributes(AmbushPeds, 46, true)
                SetPedCombatAbility(AmbushPeds, 1)
                SetPedCombatAttributes(AmbushPeds, 0, true)
                GiveWeaponToPed(AmbushPeds, Config.LowRepPedWeapon, -1, false, true)
                SetPedDropsWeaponsWhenDead(AmbushPeds, false)
                SetPedCombatRange(AmbushPeds, 1)
                SetPedFleeAttributes(AmbushPeds, 0, 0)
                SetBlockingOfNonTemporaryEvents(AmbushPeds, true)
                SetPedSuffersCriticalHits(AmbushPeds, false)
                SetPedCanRagdoll(AmbushPeds, false)
            end
        elseif PlayerData.metadata["methruns"] >= Config.LevelRep then
            for k, v in pairs(data.AmbushSpawn) do
                QBCore.Functions.LoadModel(Config.AmbushPed)
                AmbushPeds = CreatePed(0, Config.AmbushPed, v.x, v.y, v.z, v.w, true, true)
                SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(AmbushPeds), true)
                SetPedAccuracy(AmbushPeds, Config.HighRepPedAccuracy)
                SetPedArmour(AmbushPeds, Config.HighRepPedArmor)
                SetPedMaxHealth(AmbushPeds, Config.HighRepPedHealth)
                SetPedRelationshipGroupHash(AmbushPeds, `HATES_PLAYER`)
                SetPedKeepTask(AmbushPeds, true)
                SetCanAttackFriendly(AmbushPeds, false, true)
                TaskCombatPed(AmbushPeds, PlayerPedId(), 0, 16)
                SetPedCombatAttributes(AmbushPeds, 46, true)
                SetPedCombatAbility(AmbushPeds, 1)
                SetPedCombatAttributes(AmbushPeds, 0, true)
                GiveWeaponToPed(AmbushPeds, Config.HighRepPedWeapon, -1, false, true)
                SetPedDropsWeaponsWhenDead(AmbushPeds, false)
                SetPedCombatRange(AmbushPeds, 1)
                SetPedFleeAttributes(AmbushPeds, 0, 0)
                SetBlockingOfNonTemporaryEvents(AmbushPeds, true)
                SetPedSuffersCriticalHits(AmbushPeds, false)
                SetPedCanRagdoll(AmbushPeds, false)
            end
        end

        RemoveBlip(PedBlip)
        GotPackages = true
        Phase2()
    end
end

RegisterNetEvent('kevin-methruns:coptracker', function (x,y,z)
    if PlayerData.job.type == Config.PoliceJobName then
        RemoveBlip(MethVehBlip)
        MethVehBlip =  AddBlipForCoord(x,y,z)
        SetBlipSprite(MethVehBlip, 161)
        SetBlipAsShortRange(MethVehBlip, true)
        SetBlipColour(MethVehBlip, 43)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Drug Marked Vehicle')
        EndTextCommandSetBlipName(MethVehBlip)
    end
end)

function Phase2()
    CreateThread(function ()
        while DoesEntityExist(RunVehicle) do
            if not GotMeetLoc then
                VehPos = GetEntityCoords(RunVehicle)
                TriggerServerEvent('kevin-methruns:coptracker',VehPos)
            end
            Wait(2500)
        end
    end)
    Alert()
    if Config.Notify == 'phone' then
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = ('Boss'),
                subject = ('Meth Run'),
                message = ('Wait for a Drop Location'),
                })
        elseif Config.Phone == 'gks' then
            TriggerEvent('gksphone:notifi', {title = "TASK NOTIFICATION", message = 'Wait for a Drop Location', img= '/html/static/img/icons/messages.png'})
        end
    elseif Config.Notify == 'qb' then
        QBCore.Functions.Notify('Wait for a Drop Location', 'primary', 4000)
    end
    Wait(Config.LocTimer)
    GotMeetLoc = true
    RemoveBlip(MethVehBlip)
    if Config.Notify == 'phone' then
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = ('Boss'),
                subject = ('Meth Run'),
                message = ('Deliver the goods and vehicle.'),
                })
        elseif Config.Phone == 'gks' then
            TriggerEvent('gksphone:notifi', {title = "TASK NOTIFICATION", message = 'Deliver the goods and vehicle', img= '/html/static/img/icons/messages.png'})
        end
    elseif Config.Notify == 'qb' then
        QBCore.Functions.Notify('Deliver the goods and vehicle', 'primary', 4000)
    end
    droploc = Config.DropLocations[math.random(#Config.DropLocations)]
    Dropblip = AddBlipForCoord(droploc)
    SetBlipSprite(Dropblip, 1)
    SetBlipColour(Dropblip, 0)
    SetBlipScale(Dropblip, 0.75)
    SetBlipRoute(Dropblip, true)
    SetBlipRouteColour(Dropblip, 43)

    local EndZone = CircleZone:Create(vector3(droploc), 150.0, {
        name = 'End Location',
        debugPoly = false,
    })
    EndZone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            EndZone:destroy()
            if not PedSpawned then
                MeetPed = CreatePed(0, Config.PedHash, droploc.x, droploc.y, droploc.z -1, droploc.w, true, true)
                TaskStartScenarioInPlace(MeetPed, 'WORLD_HUMAN_SMOKING_POT', true)
                FreezeEntityPosition(MeetPed, true)
                SetEntityInvincible(MeetPed, true)
                SetBlockingOfNonTemporaryEvents(MeetPed, true)
                PedSpawned = true
            end
            CreateThread(function()
                while PedSpawned do
                    local vehpos = GetEntityCoords(RunVehicle)
                    local dist = #(vehpos - vector3(droploc.x, droploc.y, droploc.z))
                    if not IsPedInVehicle(PlayerPedId(), RunVehicle) and dist <= 10 then
                        RemoveBlip(Dropblip)
                        FreezeEntityPosition(RunVehicle, true)
                        canDrop = true
                    end
                    exports['qb-target']:AddTargetEntity(MeetPed, {
                        options = {
                            {
                                icon = 'fas fa-boxes-stacked',
                                label = 'Drop off goods',
                                canInteract = function()
                                    if canDrop then return true end
                                    return false
                                end,
                                action = function()
                                    DropOff()
                                end,
                            },
                        },
                        distance = 2.0
                    })
                    Wait(1000)
                end
            end)
        end
    end)
end

function DropOff()
    QBCore.Functions.TriggerCallback('kevin-methruns:server:hasItems', function(Items)
        if Items then
            DeliveredItems = DeliveredItems +1
            if DeliveredItems == CollectedItems then
                CanCollect = true
                if Config.Notify == 'phone' then
                    if Config.Phone == 'qb' then
                        TriggerServerEvent('qb-phone:server:sendNewMail', {
                            sender = ('Boss'),
                            subject = ('Meth Run'),
                            message = ('Return to the boss for payment.'),
                            })
                    elseif Config.Phone == 'gks' then
                        TriggerEvent('gksphone:notifi', {title = "TASK NOTIFICATION", message = 'Return to the boss for payment', img= '/html/static/img/icons/messages.png'})
                    end
                elseif Config.Notify == 'qb' then
                    QBCore.Functions.Notify('Return to the boss for payment', 'primary', 4000)
                end
                PedSpawned = false
                canDrop = false
                FreezeEntityPosition(MeetPed, false)
                FreezeEntityPosition(RunVehicle, false)
                TaskEnterVehicle(MeetPed, RunVehicle, -1, -1, 1.0, 1, 0)
                SetPedAsNoLongerNeeded(MeetPed)
                Wait(18000)
                RemoveBlip(MethVehBlip)
                DeleteEntity(RunVehicle)
                DeleteEntity(MeetPed)
                Goodies = false
                ValidPackages = false
                VehicleSpawned = false
                GotTimer = false
                SupplierSpawned = false
                CollectedItems = 0
                DeliveredItems = 0
                GotMeetLoc = false
                GotPackages = false
            end
        else
            QBCore.Functions.Notify('You do not have the right items here..', 'error', 5000)
        end
    end)
end

CreateThread(function()
    while true do
        if GotCase then
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasCase)
                if hasCase then
                    if not caseprop then
                        caseprop = true
                        TriggerEvent('animations:client:EmoteCommandStart', {"suitcase2"})
                    end
                elseif caseprop then
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    caseprop = false
                end
            end, Config.Caseitem)
        end
        Wait(1000)
    end
end)

RegisterNetEvent('kevin-methruns:client:Rewards', function ()
    TriggerServerEvent('kevin-methruns:server:Rewards')
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    GotCase = false
end)

----- ALERTS PORTION
function Alert()
    if Config.Dispatch == 'ps-dispatch' then
        exports['ps-dispatch']:MethRuns()
    elseif Config.Dispatch == 'cd-dispatch' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police'},
            coords = data.coords,
            title = '10-31 - Suspicious Drug Activity',
            message = 'Drug Activity at '..data.street,
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 67,
                scale = 1.5,
                colour = 2,
                flashes = false,
                text = '911 - Suspicious Drug Activity',
                time = (5*60*1000),
                sound = 1,
            }
        })
    end
end
