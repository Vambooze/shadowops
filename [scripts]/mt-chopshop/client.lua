local QBCore = exports[Config.QBCoreName]:GetCoreObject()
local HaveProp = false
local CanInteract = false
local TruckOut = false
local Truck = nil
local CProp = nil
local CPart = nil
local HaveBonnet = {}
local HaveTrunk = {}
local HaveTire1 = {}
local HaveTire2 = {}
local HaveTire3 = {}
local HaveTire4 = {}
local HaveDoor1 = {}
local HaveDoor2 = {}
local HaveDoor3 = {}
local HaveDoor4 = {}
local MenuRadial = nil
local CurrentTow = nil
local HaveAttachedVehicle = false
local IsInMission = false

-- Functions

local function DestroyPiece()
    DeleteEntity(CProp)
    CProp = nil
    QBCore.Functions.Progressbar('name', Lang.DestruingPart, Config.DestroyPartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { task = "WORLD_HUMAN_WELDING" }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mt-chopshop:server:AddItems', CPart)
        CPart = nil
        HaveProp = false
    end, function()
        ClearPedTasks(PlayerPedId())
    end)
end

local function CreateMachine(Coords, Zone)
    local machine = makeProp({ prop = Config.MachineProp, coords = Coords}, 1, 1)
    exports[Config.QBTargetName]:AddTargetEntity(machine, {
        options = {
            {
                icon = "fas fa-hand-paper",
                targeticon = "fas fa-car-crash",
                canInteract = function()
                    if HaveProp == true then return true end return false
                end,
                action = function()
                    DestroyPiece()
                end,
                label = Lang.UseMachine,
            },
        },
        distance = 1.5
    })
end

local function CheckTyres(wheel)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    if IsVehicleTyreBurst(vehicle, tonumber(wheel), true) then return false else return true end
end

function DismantleActions(Part)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local veh = QBCore.Functions.GetVehicleProperties(vehicle)
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    if Part == 'Bonnet' then
        SetVehicleDoorOpen(vehicle, 4, false, false)
        QBCore.Functions.Progressbar('name', Lang.RemovingVehiclePart, Config.RemovePartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { task = "WORLD_HUMAN_WELDING" }, {}, {}, function()
            CPart = 'Bonnet'
            ClearPedTasks(PlayerPedId())
            SetVehicleDoorBroken(vehicle, 4, true)
            playAnim('anim@heists@box_carry@', 'idle', 10000, 60)
            prop = makeProp({ prop = `imp_prop_impexp_bonnet_02a`, coords = vector4(x, y, z, 0)}, 0, 1)
            AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 56604), 0.0, 0.75, 0.0, 2.0, 10.0, 0.0, true, true, false, true, 1, true)
            CProp = prop
            HaveProp = true
            TriggerServerEvent('mt-chopshop:server:SetVariable', 'Bonnet', veh.plate, true)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end, function()
            ClearPedTasks(PlayerPedId())
            SetVehicleDoorShut(vehicle, 4, false)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end)
    elseif Part == 'Trunk' then
        SetVehicleDoorOpen(vehicle, 5, false, false)
        QBCore.Functions.Progressbar('name', Lang.RemovingVehiclePart, Config.RemovePartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { task = "WORLD_HUMAN_WELDING" }, {}, {}, function()
            CPart = 'Trunk'
            ClearPedTasks(PlayerPedId())
            SetVehicleDoorBroken(vehicle, 5, true)
            playAnim('anim@heists@box_carry@', 'idle', 10000, 60)
            prop = makeProp({ prop = `imp_prop_impexp_trunk_01a`, coords = vector4(x, y, z, 0)}, 0, 1)
            AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 56604), 0.0, 0.40, 0.1, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
            CProp = prop
            HaveProp = true
            TriggerServerEvent('mt-chopshop:server:SetVariable', 'Trunk', veh.plate, true)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end, function()
            ClearPedTasks(PlayerPedId())
            SetVehicleDoorShut(vehicle, 4, false)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end)
    elseif Part == 'Tire1' then
        QBCore.Functions.Progressbar('name', Lang.RemovingVehicleTire, Config.RemovePartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', anim = 'machinic_loop_mechandplayer' }, {}, {}, function()
            CPart = 'Tire1'
            ClearPedTasks(PlayerPedId())
            SetVehicleTyreBurst(vehicle, 0, true, 1000.0)
            HaveProp = true
            playAnim('anim@heists@box_carry@', 'idle', 10000, 60)
            prop = makeProp({ prop = `prop_wheel_tyre`, coords = vector4(x, y, z, 0)}, 0, 1)
            AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), -0.05, 0.16, 0.32, -130.0, -55.0, 150.0, true, true, false, true, 1, true)
            CProp = prop
            TriggerServerEvent('mt-chopshop:server:SetVariable', 'Tire1', veh.plate, true)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end)
    elseif Part == 'Tire2' then
        QBCore.Functions.Progressbar('name', Lang.RemovingVehiclePart, Config.RemovePartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { task = "WORLD_HUMAN_WELDING" }, {}, {}, function()
            CPart = 'Tire2'
            ClearPedTasks(PlayerPedId())
            SetVehicleTyreBurst(vehicle, 1, true, 1000.0)
            HaveProp = true
            playAnim('anim@heists@box_carry@', 'idle', 10000, 60)
            prop = makeProp({ prop = `prop_wheel_tyre`, coords = vector4(x, y, z, 0)}, 0, 1)
            AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), -0.05, 0.16, 0.32, -130.0, -55.0, 150.0, true, true, false, true, 1, true)
            CProp = prop
            TriggerServerEvent('mt-chopshop:server:SetVariable', 'Tire2', veh.plate, true)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end)
    elseif Part == 'Tire3' then
        QBCore.Functions.Progressbar('name', Lang.RemovingVehiclePart, Config.RemovePartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { task = "WORLD_HUMAN_WELDING" }, {}, {}, function()
            CPart = 'Tire3'
            ClearPedTasks(PlayerPedId())
            SetVehicleTyreBurst(vehicle, 4, true, 1000.0)
            HaveProp = true
            playAnim('anim@heists@box_carry@', 'idle', 10000, 60)
            prop = makeProp({ prop = `prop_wheel_tyre`, coords = vector4(x, y, z, 0)}, 0, 1)
            AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), -0.05, 0.16, 0.32, -130.0, -55.0, 150.0, true, true, false, true, 1, true)
            CProp = prop
            TriggerServerEvent('mt-chopshop:server:SetVariable', 'Tire3', veh.plate, true)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end)
    elseif Part == 'Tire4' then
        QBCore.Functions.Progressbar('name', Lang.RemovingVehiclePart, Config.RemovePartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { task = "WORLD_HUMAN_WELDING" }, {}, {}, function()
            CPart = 'Tire4'
            ClearPedTasks(PlayerPedId())
            SetVehicleTyreBurst(vehicle, 5, true, 1000.0)
            HaveProp = true
            playAnim('anim@heists@box_carry@', 'idle', 10000, 60)
            prop = makeProp({ prop = `prop_wheel_tyre`, coords = vector4(x, y, z, 0)}, 0, 1)
            AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), -0.05, 0.16, 0.32, -130.0, -55.0, 150.0, true, true, false, true, 1, true)
            CProp = prop
            TriggerServerEvent('mt-chopshop:server:SetVariable', 'Tire4', veh.plate, true)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end)
    elseif Part == 'Door1' then
        SetVehicleDoorOpen(vehicle, 0, false, false)
        QBCore.Functions.Progressbar('name', Lang.RemovingVehiclePart, Config.RemovePartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { task = "WORLD_HUMAN_WELDING" }, {}, {}, function()
            CPart = 'Door1'
            ClearPedTasks(PlayerPedId())
            SetVehicleDoorBroken(vehicle, 0, true)
            HaveProp = true
            playAnim('anim@heists@box_carry@', 'idle', 10000, 60)
            prop = makeProp({ prop = `prop_car_door_01`, coords = vector4(x, y, z, 0)}, 0, 1)
            AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 56604), 0.1, 0.40, -0.65, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
            CProp = prop
            TriggerServerEvent('mt-chopshop:server:SetVariable', 'Door1', veh.plate, true)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end)
    elseif Part == 'Door2' then
        SetVehicleDoorOpen(vehicle, 1, false, false)
        QBCore.Functions.Progressbar('name', Lang.RemovingVehiclePart, Config.RemovePartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { task = "WORLD_HUMAN_WELDING" }, {}, {}, function()
            CPart = 'Door2'
            ClearPedTasks(PlayerPedId())
            SetVehicleDoorBroken(vehicle, 1, true)
            HaveProp = true
            playAnim('anim@heists@box_carry@', 'idle', 10000, 60)
            prop = makeProp({ prop = `prop_car_door_01`, coords = vector4(x, y, z, 0)}, 0, 1)
            AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 56604), 0.1, 0.40, -0.65, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
            CProp = prop
            TriggerServerEvent('mt-chopshop:server:SetVariable', 'Door2', veh.plate, true)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end)
    elseif Part == 'Door3' then
        SetVehicleDoorOpen(vehicle, 2, false, false)
        QBCore.Functions.Progressbar('name', Lang.RemovingVehiclePart, Config.RemovePartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { task = "WORLD_HUMAN_WELDING" }, {}, {}, function()
            CPart = 'Door3'
            ClearPedTasks(PlayerPedId())
            SetVehicleDoorBroken(vehicle, 2, true)
            HaveProp = true
            playAnim('anim@heists@box_carry@', 'idle', 10000, 60)
            prop = makeProp({ prop = `prop_car_door_01`, coords = vector4(x, y, z, 0)}, 0, 1)
            AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 56604), 0.1, 0.40, -0.65, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
            CProp = prop
            TriggerServerEvent('mt-chopshop:server:SetVariable', 'Door3', veh.plate, true)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end)
    elseif Part == 'Door4' then
        SetVehicleDoorOpen(vehicle, 3, false, false)
        QBCore.Functions.Progressbar('name', Lang.RemovingVehiclePart, Config.RemovePartTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { task = "WORLD_HUMAN_WELDING" }, {}, {}, function()
            CPart = 'Door4'
            ClearPedTasks(PlayerPedId())
            SetVehicleDoorBroken(vehicle, 3, true)
            HaveProp = true
            playAnim('anim@heists@box_carry@', 'idle', 10000, 60)
            prop = makeProp({ prop = `prop_car_door_01`, coords = vector4(x, y, z, 0)}, 0, 1)
            AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 56604), 0.1, 0.40, -0.65, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
            CProp = prop
            TriggerServerEvent('mt-chopshop:server:SetVariable', 'Door4', veh.plate, true)
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end, function()
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('mt-chopshop:server:SetCanInteract', veh.plate, true)
        end)
    end
end

local function CheckPart(part)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local myCar = QBCore.Functions.GetVehicleProperties(vehicle)
    local plate = myCar.plate
    if part == 'Bonnet' then
        if HaveBonnet[plate] == true then
            return false
        else
            return true
        end
    elseif part == 'Trunk' then
        if HaveTrunk[plate] == true then
            return false
        else
            return true
        end
    elseif part == 'Tire1' then
        if HaveTire1[plate] == true then
            return false
        else
            return true
        end
    elseif part == 'Tire2' then
        if HaveTire2[plate] == true then
            return false
        else
            return true
        end
    elseif part == 'Tire3' then
        if HaveTire3[plate] == true then
            return false
        else
            return true
        end
    elseif part == 'Tire4' then
        if HaveTire4[plate] == true then
            return false
        else
            return true
        end
    elseif part == 'Door1' then
        if HaveDoor1[plate] == true then
            return false
        else
            return true
        end
    elseif part == 'Door2' then
        if HaveDoor2[plate] == true then
            return false
        else
            return true
        end
    elseif part == 'Door3' then
        if HaveDoor3[plate] == true then
            return false
        else
            return true
        end
    elseif part == 'Door4' then
        if HaveDoor4[plate] == true then
            return false
        else
            return true
        end
    end
end

RegisterNetEvent('mt-chopshop:client:SetVariable', function(part, plate, info)
    if part == 'Bonnet' then
        HaveBonnet[plate] = info
    elseif part == 'Trunk' then
        HaveTrunk[plate] = info
    elseif part == 'Tire1' then
        HaveTire1[plate] = info
    elseif part == 'Tire2' then
        HaveTire2[plate] = info
    elseif part == 'Tire3' then 
        HaveTire3[plate] = info
    elseif part == 'Tire4' then
        HaveTire4[plate] = info
    elseif part == 'Door1' then
        HaveDoor1[plate] = info
    elseif part == 'Door2' then
        HaveDoor2[plate] = info
    elseif part == 'Door3' then
        HaveDoor3[plate] = info
    elseif part == 'Door4' then
        HaveDoor4[plate] = info
    end
end)

function TakeTruck(Coords)
    QBCore.Functions.SpawnVehicle(Config.TuckModel, function(veh)
        SetVehicleNumberPlateText(veh, "MTFN"..tostring(math.random(1000, 9999)))
        exports[Config.LegacyFuelName]:SetFuel(veh, 100.0)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        TriggerServerEvent('mt-chopshop:server:RemoveMoney', Config.MoneyType, Config.TruckComission)
        TruckOut = true
        Truck = veh
    end, Coords, true)
end

function DeleteTruck()
    DeleteEntity(Truck)
    TriggerServerEvent('mt-chopshop:server:AddMoney', Config.MoneyType, Config.TruckComission)
    TruckOut = false
    Truck = nil
end

function DeleteDeliveryLoc()
    RemoveBlip(CurrentBlip)
    ClearAllBlipRoutes()
    CurrentBlip = nil
    IsInMission = false
    HaveAttachedVehicle = false
end

function CreateDelieryLoc()
    coords = math.random(1, #Config.DeliveryLocations)
    CurrentBlip = AddBlipForCoord(Config.DeliveryLocations[coords].Coords.x, Config.DeliveryLocations[coords].Coords.y, Config.DeliveryLocations[coords].Coords.z)
    SetBlipColour(CurrentBlip, 3)
    SetBlipRoute(CurrentBlip, true)
    SetBlipRouteColour(CurrentBlip, 3)
    CreateThread(function()
        while IsInMission do
            Wait(1)
            local Ppos = GetEntityCoords(PlayerPedId())
            local pos = vector3(Ppos.x, Ppos.y, Ppos.z)
            local Coords = vector3(Config.DeliveryLocations[coords].Coords.x, Config.DeliveryLocations[coords].Coords.y, Config.DeliveryLocations[coords].Coords.z)
            local takeDist = #(pos - Coords)
            if HaveAttachedVehicle == true then
                if IsPedInAnyVehicle(PlayerPedId(), true) then
                    if takeDist <= 5.0 then
                        exports[Config.QBCoreName]:DrawText(Lang.EButtom, 'left')
                        if IsControlJustPressed(0, 46) then
                            DeleteEntity(CurrentTow)
                            DeleteDeliveryLoc()
                            CurrentTow = nil
                            TriggerServerEvent('mt-chopshop:server:AddMoney', Config.MoneyType, Config.Payment)
                            exports[Config.QBCoreName]:HideText()
                        end
                    else
                        exports[Config.QBCoreName]:HideText()
                    end
                end
            end
        end
    end)
end

RegisterNetEvent('mt-chopshop:client:TowVehicle', function(Coords)
    CreateThread(function()
        while not HaveAttachedVehicle do
            exports[Config.QBCoreName]:DrawText(Lang.EToTow, 'right')
            Wait(1)
            local coordA = GetEntityCoords(PlayerPedId(), 1)
            local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 5.0, 0.0)
            local targetVehicle = getVehicleInDirection(coordA, coordB)
            if not IsPedInAnyVehicle(PlayerPedId()) then
                if GetHashKey(targetVehicle) ~= GetHashKey(Config.TuckModel) then
                    local pedPos = GetEntityCoords(PlayerPedId(), 1)
                    local targetPos = GetEntityCoords(targetVehicle)
                    if IsEntityAVehicle(targetVehicle) then
                        if #(pedPos - targetPos) <= 5.0 then
                            DrawMarker(2, targetPos.x, targetPos.y, targetPos.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 50, false, true, 2, nil, nil, false)
                            if IsControlJustPressed(0, 38) then
                                TakeTruck(Coords)
                                Wait(500)
                                AttachEntityToEntity(targetVehicle, Truck, GetEntityBoneIndexByName(Truck, 'bodyshell'), 0.0, -1.5 + -0.85, 0.0 + 0.85, 0, 0, 0, 1, 1, 0, 1, 0, 1)
                                FreezeEntityPosition(targetVehicle, true)
                                CreateDelieryLoc()
                                CurrentTow = targetVehicle
                                IsInMission = true
                                HaveAttachedVehicle = true
                                exports[Config.QBCoreName]:HideText()
                                QBCore.Functions.Notify(Lang.VehicleTowed, "success")
                            end
                        end
                    end
                end
            end
        end
    end)
end)

-- Threads

CreateThread(function()
    local vehicle = QBCore.Functions.GetClosestVehicle()

    for k, v in pairs(Config.Zones) do
        local _name = tostring('Scrap-Zone-'..k)
        local newSpot = BoxZone:Create(v.PolyCoords, v.PolyLenght, v.PolyWidth, { name = _name, debugPoly = Config.DebugPoly, heading = v.PolyHeading })
        newSpot:onPlayerInOut(function(isPointInside, _)
            if isPointInside then
                CanInteract = true
                if TruckOut == true then
                    MenuRadial = exports[Config.QBRadialMenuName]:AddOption({
                        id = 'towvehicle',
                        title = Lang.TowVehicle,
                        icon = 'car',
                        type = 'client',
                        event = 'mt-chopshop:client:TowVehicle',
                        shouldClose = true,
                    })
                end
            else
                CanInteract = false
                if TruckOut == true then
                    if MenuRadial ~= nil then
                        exports[Config.QBRadialMenuName]:RemoveOption(MenuRadial)
                    end
                end
            end
        end)
        CreateMachine(v.MachineCoords, k)

        local Ped = v.TruckPedCoords
        RequestModel(GetHashKey(v.PedModel))
        while not HasModelLoaded(GetHashKey(v.PedModel)) do
            Wait(1)
        end
        TruckPed =  CreatePed(4, GetHashKey(v.PedModel), Ped.x, Ped.y, Ped.z, v.PedHeading, false, true)
        SetEntityHeading(TruckPed, v.PedHeading)
        FreezeEntityPosition(TruckPed, true)
        SetEntityInvincible(TruckPed, true)
        SetBlockingOfNonTemporaryEvents(TruckPed, true)
        TaskStartScenarioInPlace(TruckPed, v.PedAnimation, 0, true)
    
        exports[Config.QBTargetName]:AddTargetEntity(TruckPed, {
            options = {
                {
                    icon = 'fas fa-hand-paper',
                    targeticon = 'fas fa-car',
                    label = tostring(Lang.TakeTruck..' - '..Config.TruckComission..'$'),
                    action = function()
                        TriggerEvent('mt-chopshop:client:TowVehicle', v.TruckSpawnCoords)
                    end,
                    canInteract = function()
                        if TruckOut == false then return true end
                    end,
                },
                {
                    icon = 'fas fa-ban',
                    targeticon = 'fas fa-car',
                    label = tostring(Lang.DeleteTruck),
                    action = function()
                        DeleteTruck()
                    end,
                    canInteract = function()
                        if TruckOut == true then return true end
                    end,
                },
            },
            distance = 1.5
        })
    end
    exports[Config.QBTargetName]:AddTargetBone('bonnet', { -- Capô
        options = {
            {
                icon = 'fas fa-tools',
                label = Lang.RemoveBonnet,
                action = function()
                    Minigame('Bonnet')
                end,
                canInteract = function()
                    local vehicle = QBCore.Functions.GetClosestVehicle()
                    local myCar = QBCore.Functions.GetVehicleProperties(vehicle)
                    if CanInteract and HaveProp == false and CheckPart('Bonnet') == true then return true end
                end,
            },
        },
        distance = 1.5,
    })
    exports[Config.QBTargetName]:AddTargetBone('boot', { -- Mala
        options = {
            {
                icon = 'fas fa-tools',
                label = Lang.RemoveTrunk,
                action = function()
                    Minigame('Trunk')
                end,
                canInteract = function()
                    if CanInteract and HaveProp == false and CheckPart('Trunk') == true then return true end
                end,
            },
        },
        distance = 1.5,
    })
    exports[Config.QBTargetName]:AddTargetBone('wheel_lf', { -- Roda Frente Esquerca
        options = {
            {
                icon = 'fas fa-tools',
                label = Lang.RemoveTire,
                action = function()
                    Minigame('Tire1')
                end,
                canInteract = function()
                    if CanInteract and HaveProp == false and CheckTyres('0') == true and CheckPart('Tire1') == true then return true end
                end,
            },
        },
        distance = 1.5,
    })
    exports[Config.QBTargetName]:AddTargetBone('wheel_rf', { -- Roda Frente Direita
        options = {
            {
                icon = 'fas fa-tools',
                label = Lang.RemoveTire2,
                action = function()
                    Minigame('Tire2')
                end,
                canInteract = function()
                    if CanInteract and HaveProp == false and CheckTyres('1') == true and CheckPart('Tire2') == true then return true end
                end,
            },
        },
        distance = 1.5,
    })
    exports[Config.QBTargetName]:AddTargetBone('wheel_lr', { -- Roda Traseira Esquerda
        options = {
            {
                icon = 'fas fa-tools',
                label = Lang.RemoveTire3,
                action = function()
                    Minigame('Tire3')
                end,
                canInteract = function()
                    if CanInteract and HaveProp == false and CheckTyres('4') == true and CheckPart('Tire3') == true then return true end
                end,
            },
        },
        distance = 1.5,
    })
    exports[Config.QBTargetName]:AddTargetBone('wheel_rr', { -- Roda Traseira Direita
        options = {
            {
                icon = 'fas fa-tools',
                label = Lang.RemoveTire4,
                action = function()
                    Minigame('Tire4')
                end,
                canInteract = function()
                    if CanInteract and HaveProp == false and CheckTyres('5') == true and CheckPart('Tire4') == true then return true end
                end,
            },
        },
        distance = 1.5,
    })
    exports[Config.QBTargetName]:AddTargetBone('door_dside_f', { -- Porta Condutor
        options = {
            {
                icon = 'fas fa-tools',
                label = Lang.RemoveDoor,
                action = function()
                    Minigame('Door1')
                end,
                canInteract = function()
                    if CanInteract and HaveProp == false and CheckPart('Door1') == true then return true end
                end,
            },
        },
        distance = 1.5,
    })
    exports[Config.QBTargetName]:AddTargetBone('door_pside_f', { -- Porta Condutor Traseira
        options = {
            {
                icon = 'fas fa-tools',
                label = Lang.RemoveDoor2,
                action = function()
                    Minigame('Door2')
                end,
                canInteract = function()
                    if CanInteract and HaveProp == false and CheckPart('Door2') == true then return true end
                end,
            },
        },
        distance = 1.5,
    })
    exports[Config.QBTargetName]:AddTargetBone('door_dside_r', { -- Porta Passageiro
        options = {
            {
                icon = 'fas fa-tools',
                label = Lang.RemoveDoor3,
                action = function()
                    Minigame('Door3')
                end,
                canInteract = function()
                    if CanInteract and HaveProp == false and CheckPart('Door3') == true then return true end
                end,
            },
        },
        distance = 1.5,
    })
    exports[Config.QBTargetName]:AddTargetBone('door_pside_r', { -- Porta Passageiro Traseira
        options = {
            {
                icon = 'fas fa-tools',
                label = Lang.RemoveDoor4,
                action = function()
                    Minigame('Door4')
                end,
                canInteract = function()
                    if CanInteract and HaveProp == false and CheckPart('Door4') == true then return true end
                end,
            },
        },
        distance = 1.5,
    })
end)