local TRClassicBlackMarketPed

local QBCore = exports['qb-core']:GetCoreObject()
-- Remove ped model on resource stop.

local function RemoveTRPed()
    if DoesEntityExist(TRClassicBlackMarketPed) then
        DeletePed(TRClassicBlackMarketPed)
    end
end

AddEventHandler('onResourceStop', function(resourceName)
	if GetCurrentResourceName() == resourceName then
        RemoveTRPed()
	end
end)

-- Target and ped model

CreateThread(function()
    if Config.UseBlip then
        local BlackMarketBlip = AddBlipForCoord(Config.Location.Coords)
        SetBlipSprite (BlackMarketBlip, Config.Location.SetBlipSprite)
        SetBlipDisplay(BlackMarketBlip, Config.Location.SetBlipDisplay)
        SetBlipScale  (BlackMarketBlip, Config.Location.SetBlipScale)
        SetBlipAsShortRange(BlackMarketBlip, true)
        SetBlipColour(BlackMarketBlip, Config.Location.SetBlipColour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Location.BlipName)
        EndTextCommandSetBlipName(BlackMarketBlip)
    end
    local Coords = Config.Location.Coords
    local PedHash = Config.Location.ModelHash
    local PedModel = Config.Location.ModelName
    if not DoesEntityExist(TRClassicBlackMarketPed) then
        RequestModel( GetHashKey(PedModel) )
        while ( not HasModelLoaded( GetHashKey(PedModel) ) ) do
            Wait(1)
        end
        TRClassicBlackMarketPed = CreatePed(1, PedHash, Coords, false, true)
        FreezeEntityPosition(TRClassicBlackMarketPed, true)
        SetEntityInvincible(TRClassicBlackMarketPed, true)
        SetBlockingOfNonTemporaryEvents(TRClassicBlackMarketPed, true)
    end
    exports['qb-target']:AddTargetEntity(TRClassicBlackMarketPed, {
        options = {
            {
                num = 1,
                type = "client",
                event = "tr-blackmarket:OpenShop",
                label = Config.Text["TargetLabel"],
                icon = Config.Icons["Eyeicon"],
            }
        },
        distance = 1.5
    })
end)

if Config.EnableHacking then
    exports['qb-target']:AddTargetModel(Config.PhoneModels, {
        options = {
            {
                icon = "fas fa-ethernet",
                label = "Wiretap Connections",
                item = "crocodile_clips",
                canInteract = function()
                    return Config.EnableHacking
                end,
                action = function()
                    TriggerEvent('Mx::StartMinigameElectricCircuit', "50%", "50%", "1.0", "30vmin", "dial.ogg", function()
                        QBCore.Functions.Progressbar('dial_connect', 'Tapping Conenctions..', 21000, false, false, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = 'anim@gangops@facility@servers@',
                            anim = 'hotwire',
                            flags = 16,
                        }, {}, {}, function() -- Play When Done
                            TriggerEvent("ik-blackmarket:client:HackSuccess")
                        end, function() -- Play When Cancel
                            --Stuff goes here
                        end)
                    end)
                end
            },
        },
        distance = 2.5
    })

    CallBackFunction = nil
    
    RegisterNetEvent('Mx::StartMinigameElectricCircuit')
    AddEventHandler('Mx::StartMinigameElectricCircuit', function(x, y, scale, size_game, sound_name, Callback)
        CircuitGame(x, y, scale, size_game, sound_name, Callback)
    end)

    local function SendDispatch()
        if Config.Dispatch == "qbcore" then
            local pos = GetEntityCoords(PlayerPedId())
            TriggerServerEvent("ik-blackmarket:server:callCops", pos)
        end
    end

    local function FinishMinigame(faults)
        if faults > 0 then
            SendDispatch()
            QBCore.Functions.Notify('You fucked up, RUN !', 'error', 7500)
        else
            TriggerEvent("ik-blackmarket:client:GetLocation")
        end
    end

    RegisterNetEvent("ik-blackmarket:client:CreateBMBlip", function(coords)
        local transG = 250
        local blip = AddBlipForCoord(-426.25, 2971.43, 15.5, 331.7)
        SetBlipSprite(blip, 458)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.0)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Black Market")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end)

    RegisterNetEvent("ik-blackmarket:client:HackSuccess", function() 
        QBCore.Functions.Notify('Successfully hacked into phone connection.', 'success', 7500)
        if Config.Minigame == "keyminigame" then
            TriggerEvent('qb-keyminigame:show')
            TriggerEvent('qb-keyminigame:start', FinishMinigame)
        elseif Config.Minigame == "howdys" then
            local success = exports['howdy-hackminigame']:Begin(3, 5000)
            if not success then
                SendDispatch()
            else
                TriggerEvent("ik-blackmarket:client:GetLocation")
            end
        end
    end)

    RegisterNetEvent("ik-blackmarket:client:GetLocation", function() 
        QBCore.Functions.Notify('You will get the location now', 'success', 7500)
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, 458)
            SetBlipColour(blip, 1)
            SetBlipDisplay(blip, 4)
            SetBlipAlpha(blip, transG)
            SetBlipScale(blip, 1.0)
    end)

    RegisterNetEvent("ik-blackmarket:client:wiretappingCall", function(coords)
        local job = QBCore.Functions.GetPlayerData().job
        if job.name == "police" and job.onduty then
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            TriggerServerEvent('police:server:policeAlert', "Wire tapping in progress")

            local transG = 250
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, 458)
            SetBlipColour(blip, 1)
            SetBlipDisplay(blip, 4)
            SetBlipAlpha(blip, transG)
            SetBlipScale(blip, 1.0)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString("10-31 | Wiretapping")
            EndTextCommandSetBlipName(blip)
            while transG ~= 0 do
                Wait(180 * 4)
                transG = transG - 1
                SetBlipAlpha(blip, transG)
                if transG == 0 then
                    SetBlipSprite(blip, 2)
                    RemoveBlip(blip)
                    return
                end
            end
        end
    end)
    
    function CircuitGame(x, y, scale, size_game, sound_name, Callback)
        SetNuiFocus(true,true)
        SendNUIMessage({
            ui = 'ui',
            NuiOpen = true,
            x = x,
            y = y,
            scale = scale,
            size_game = size_game,
            sound_name = sound_name,
            name_resource = GetCurrentResourceName()
        })
        CallBackFunction = Callback
    end
    
    RegisterNUICallback('electric_circuit_completed', function(data, cb)
        CallBackFunction()
        CloseNui()
        cb('ok')
    end)
    
    RegisterNUICallback('CloseNui', function(data, cb)
        CloseNui()
        cb('ok')
    end)
    
    function CloseNui()
        local ped = PlayerPedId()
        ClearPedTasks(ped)
    
        SetNuiFocus(false, false)
        SendNUIMessage({
            ui = 'ui',
            NuiOpen = false,
        })
    end
end




-- qb-menu

RegisterNetEvent('tr-blackmarket:OpenShop', function()
    local BlackMarket = {
        {
            header = Config.Text['PedHeader'],
            isMenuHeader = true,
            icon = Config.Icons["Header"]
        },
        {
            header = Config.Text['Pistols'],
            icon = Config.Icons['Pistol'],
            params = {
                event = "tr-blackmarket:PistolShop",
            }
        },
        {
            header = Config.Text['SubMachineGuns'],
            icon = Config.Icons['SubMachineGuns'],
            params = {
                event = "tr-blackmarket:SubMachineGunsShop",
            }
        },
        {
            header = Config.Text['Shotguns'],
            icon = Config.Icons['Shotguns'],
            params = {
                event = "tr-blackmarket:ShotGunsShop",
            }
        },
        {
            header = Config.Text['AssaultWeapons'],
            icon = Config.Icons['AssaultWeapons'],
            params = {
                event = "tr-blackmarket:AssaultWeaponsShop",
            }
        },
        {
            header = Config.Text['Miscellanceous'],
            icon = Config.Icons['Miscellanceous'],
            params = {
                event = "tr-blackmarket:MiscellanceousShop",
            }
        },
		{
            header = Config.Text['Hacking'],
            icon = Config.Icons['Miscellanceous'],
            params = {
                event = "tr-blackmarket:HackingShop",
            }
        },
    }
    exports['qb-menu']:openMenu(BlackMarket)
end)

-- BlackMarket Shop Event
RegisterNetEvent("tr-blackmarket:PistolShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.PistolShop)
end)

RegisterNetEvent("tr-blackmarket:SubMachineGunsShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.SubMachineGunShop)
end)

RegisterNetEvent("tr-blackmarket:ShotGunsShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.ShotGunShop)
end)

RegisterNetEvent("tr-blackmarket:AssaultWeaponsShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.AssaultWeaponsShop)
end)

RegisterNetEvent("tr-blackmarket:MiscellanceousShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.MiscellanceousShop)
end)

RegisterNetEvent("tr-blackmarket:HackingShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.HackingShop)
end)