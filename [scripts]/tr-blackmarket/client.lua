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

RegisterNetEvent('ik-blackmarket:client:CreatePed', function ()
    QBCore.Functions.TriggerCallback('ik-blackmarket:server:PedLocation', function(data)
        local bm = data.bm
        loc = data.loc
        local sdata = data.data
        if not sdata["hideblip"] then -- Create blip if set to false
            StoreBlip = AddBlipForCoord(b)
            SetBlipSprite(StoreBlip, sdata["blipsprite"])
            SetBlipScale(StoreBlip, 0.7)
            SetBlipDisplay(StoreBlip, 6)
            SetBlipColour(StoreBlip, sdata["blipcolour"])
            SetBlipAsShortRange(StoreBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(sdata["label"])
            EndTextCommandSetBlipName(StoreBlip)
        end
        -- Create ped for random location number in m
        local i = math.random(1, #sdata["model"]) -- Get random ped model
        RequestModel(sdata["model"][i]) while not HasModelLoaded(sdata["model"][i]) do Wait(0) end
        if ped["['"..bm.."("..loc..")']"] == nil then ped["['"..bm.."("..loc..")']"] = CreatePed(0, sdata["model"][i], sdata["coords"][loc].x, sdata["coords"][loc].y, sdata["coords"][loc].z-1.0, sdata["coords"][loc].a, false, false) end
        if not sdata["killable"] then SetEntityInvincible(ped["['"..bm.."("..loc..")']"], true) end
        local scenarios = { "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", "WORLD_HUMAN_GUARD_PATROL", "WORLD_HUMAN_JANITOR", "WORLD_HUMAN_MUSCLE_FLEX", "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", "PROP_HUMAN_STAND_IMPATIENT", }
        local scenario = math.random(1, #scenarios) -- Get random scenario
        TaskStartScenarioInPlace(ped["['"..bm.."("..loc..")']"], scenarios[scenario], -1, true)
        SetBlockingOfNonTemporaryEvents(ped["['"..bm.."("..loc..")']"], true)
        FreezeEntityPosition(ped["['"..bm.."("..loc..")']"], true)
        SetEntityNoCollisionEntity(ped["['"..bm.."("..loc..")']"], PlayerPedId(), false)
        if Config.Debug then print("Ped Created for Shop - ['"..bm.."("..loc..")']") end

        if Config.Debug then print("Shop - ['"..bm.."("..loc..")']") end
        exports['qb-target']:AddCircleZone("['"..bm.."("..loc..")']", vector3(sdata["coords"][loc].x, sdata["coords"][loc].y, sdata["coords"][loc].z), 2.0, { name="['"..bm.."("..loc..")']", debugPoly=Config.Debug, useZ=true, },{ options = { { event = "ik-blackmarket:ShopMenu", icon = "fas fa-certificate", label = Lang:t("target.browse"),item = (sdata.openwith or nil),gang = (sdata.gang or nil), shoptable = sdata, products = productstable, name = sdata["label"], k = bm, l = loc, }, }, distance = 2.0 })
    end)
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