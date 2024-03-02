local QBCore = exports[Config.QBCoreName]:GetCoreObject()
local Attempt = false

function VerifyVehicle()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    print(string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
    for a, i in pairs(Config.BlacklistedVehicles) do
        if tostring(i) == string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) then
            return false
        end
    end
    return true
end

function Minigame(Part)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local veh = QBCore.Functions.GetVehicleProperties(vehicle)
    local model = GetHashKey(Config.TuckModel)

    if VerifyVehicle() == true then
        QBCore.Functions.TriggerCallback('mt-chopshop:server:checkOwnedVehicle', function(result)
            if result == false then
                QBCore.Functions.TriggerCallback('mt-chopshop:server:checkPoliceCount', function(result)
                    if result == true then
                        QBCore.Functions.TriggerCallback('mt-chopshop:server:CheckCanInteract', function(result)
                            if result == true then
                                TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, false)
                                if Config.UseMinigame == true then
                                    exports['ps-ui']:Circle(function(success)
                                        if success then
                                            DismantleActions(Part)
                                        else
                                            PoliceAlert()
                                            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
                                        end
                                    end, Config.MinigameCircles, Config.MinigameTime)
                                else
                                    DismantleActions(Part)
                                end
                            else
                                QBCore.Functions.Notify(Lang.CantInteract, 'error', 500)
                            end
                        end, veh.plate)
                    else
                        QBCore.Functions.Notify(Lang.NeededPolice, 'error', 7500)
                    end
                end)
            else
                QBCore.Functions.Notify(Lang.VehicleOwned, 'error', 7500)
            end
        end, veh)
    else
        QBCore.Functions.Notify(Lang.VehicleBlacklisted, 'error', 7500)
    end
end

function loadAnimDict(dict)	
    if not HasAnimDictLoaded(dict) then 
        while not HasAnimDictLoaded(dict) do 
            RequestAnimDict(dict) Wait(5) 
        end 
    end 
end

function playAnim(animDict, animName, duration, flag)
    loadAnimDict(animDict)
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, flag, 1, false, false, false)
end

function stopAnim(animDict, animName)
    StopAnimTask(PlayerPedId(), animName, animDict)
    RemoveAnimDict(animDict)
end

local time = 1000
function loadModel(model) 
    if not HasModelLoaded(model) then
        while not HasModelLoaded(model) do
            if time > 0 then time = time - 1 RequestModel(model)
            else time = 1000 break
            end
            Wait(10)
        end
    end 
end

function makeProp(data, freeze, synced)
    loadModel(data.prop)
    local prop = CreateObject(data.prop, data.coords.x, data.coords.y, data.coords.z-1.03, synced or 0, synced or 0, 0)
    SetEntityHeading(prop, data.coords.w-180.0)
    FreezeEntityPosition(prop, freeze or 0)
    return prop
end

function PoliceAlert()
    local chance = 99
    if Attempt == false then
        if GetClockHours() >= 0 and GetClockHours() <= 6 then
--            chance = 50
        end
        if math.random(1, 100) <= chance then
            exports['ps-dispatch']:SuspiciousActivity()
            Attempt = true
        end
    end
end

function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
	local _, _, _, _, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end