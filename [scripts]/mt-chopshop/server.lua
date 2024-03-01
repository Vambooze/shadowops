local QBCore = exports[Config.QBCoreName]:GetCoreObject()
--local HaveBonnet, HaveTrunk, HaveTire1, HaveTire2, HaveTire3, HaveTire4, HaveDoor1, HaveDoor2, HaveDoor3, HaveDoor4 = {}
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
local CanInteract = {}

RegisterNetEvent('mt-chopshop:server:AddItems', function(CPart)
    local Player = QBCore.Functions.GetPlayer(source)

    if CPart == 'Bonnet' then
        for i = 0, Config.Rewards.Bonnet.ItemsPerTime do
            local Item = math.random(1, #Config.Rewards.Bonnet.Items)
            Player.Functions.AddItem(Config.Rewards.Bonnet.Items[Item].ItemName, Config.Rewards.Bonnet.Items[Item].ItemAmount)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards.Bonnet.Items[Item].ItemName], "add", Config.Rewards.Bonnet.Items[Item].ItemAmount)
        end
    elseif CPart == 'Tire1' or CPart == 'Tire2' or CPart == 'Tire3' or CPart == 'Tire4' then
        for i = 0, Config.Rewards.Tire.ItemsPerTime do
            local Item = math.random(1, #Config.Rewards.Tire.Items)
            Player.Functions.AddItem(Config.Rewards.Tire.Items[Item].ItemName, Config.Rewards.Tire.Items[Item].ItemAmount)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards.Tire.Items[Item].ItemName], "add", Config.Rewards.Tire.Items[Item].ItemAmount)
        end
    elseif CPart == 'Door1' or CPart == 'Door2' or CPart == 'Door3' or CPart == 'Door4' then
        for i = 0, Config.Rewards.Door.ItemsPerTime do
            local Item = math.random(1, #Config.Rewards.Door.Items)
            Player.Functions.AddItem(Config.Rewards.Door.Items[Item].ItemName, Config.Rewards.Door.Items[Item].ItemAmount)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards.Door.Items[Item].ItemName], "add", Config.Rewards.Door.Items[Item].ItemAmount)
        end
    elseif CPart == 'Trunk' then
        for i = 0, Config.Rewards.Trunk.ItemsPerTime do
            local Item = math.random(1, #Config.Rewards.Trunk.Items)
            Player.Functions.AddItem(Config.Rewards.Trunk.Items[Item].ItemName, Config.Rewards.Trunk.Items[Item].ItemAmount)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards.Trunk.Items[Item].ItemName], "add", Config.Rewards.Trunk.Items[Item].ItemAmount)
        end
    end
end)

RegisterNetEvent('mt-chopshop:server:SetVariable', function(part, plate, info)
    for _, psource in ipairs(GetPlayers()) do
        local src = psource
        if part == 'Bonnet' then
            HaveBonnet[plate] = info
            TriggerClientEvent('mt-chopshop:client:SetVariable', src, part, plate, info)
        elseif part == 'Trunk' then
            HaveTrunk[plate] = info
            TriggerClientEvent('mt-chopshop:client:SetVariable', src, part, plate, info)
        elseif part == 'Tire1' then
            HaveTire1[plate] = info
            TriggerClientEvent('mt-chopshop:client:SetVariable', src, part, plate, info)
        elseif part == 'Tire2' then
            HaveTire2[plate] = info
            TriggerClientEvent('mt-chopshop:client:SetVariable', src, part, plate, info)
        elseif part == 'Tire3' then 
            HaveTire3[plate] = info
            TriggerClientEvent('mt-chopshop:client:SetVariable', src, part, plate, info)
        elseif part == 'Tire4' then
            HaveTire4[plate] = info
            TriggerClientEvent('mt-chopshop:client:SetVariable', src, part, plate, info)
        elseif part == 'Door1' then
            HaveDoor1[plate] = info
            TriggerClientEvent('mt-chopshop:client:SetVariable', src, part, plate, info)
        elseif part == 'Door2' then
            HaveDoor2[plate] = info
            TriggerClientEvent('mt-chopshop:client:SetVariable', src, part, plate, info)
        elseif part == 'Door3' then
            HaveDoor3[plate] = info
            TriggerClientEvent('mt-chopshop:client:SetVariable', src, part, plate, info)
        elseif part == 'Door4' then
            HaveDoor4[plate] = info
            TriggerClientEvent('mt-chopshop:client:SetVariable', src, part, plate, info)
        end
    end
end)

QBCore.Functions.CreateCallback('mt-chopshop:server:checkPoliceCount', function(source, cb, NeededPolice)
    local players = QBCore.Functions.GetPlayers()
    local policeCount = 0

    for i = 1, #players do
        local player = QBCore.Functions.GetPlayer(players[i])
        if player.PlayerData.job.name == 'police' then
            policeCount = policeCount + 1
        end
    end
    if policeCount >= Config.NeededPolice then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('mt-chopshop:server:CheckCanInteract', function(source, cb, plate)
    if CanInteract[plate] ~= nil then
        if CanInteract[plate] == true then
            cb(true)
        elseif CanInteract[plate] == false then
            cb(false)
        end
    else
        cb(true)
    end
end)

local function IsVehicleOwned(plate)
    local retval = false
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then retval = true end
    return retval
end

QBCore.Functions.CreateCallback('mt-chopshop:server:checkOwnedVehicle', function(source, cb, vehicle)
    if IsVehicleOwned(vehicle.plate) then
        cb(true)
    else
        cb(false)
        return
    end
end)

QBCore.Functions.CreateCallback('mt-chopshop:server:CheckVariable', function(source, cb, part, plate)
    if part == 'Bonnet' then
        if HaveBonnet[plate] == true then
            cb(true)
        else
            cb(false)
        end
    elseif part == 'Trunk' then
        if HaveTrunk[plate] == true then
            cb(true)
        else
            cb(false)
        end
    elseif part == 'Tire1' then
        if HaveTire1[plate] == true then
            cb(true)
        else
            cb(false)
        end
    elseif part == 'Tire2' then
        if HaveTire2[plate] == true then
            cb(true)
        else
            cb(false)
        end
    elseif part == 'Tire3' then
        if HaveTire3[plate] == true then
            cb(true)
        else
            cb(false)
        end
    elseif part == 'Tire4' then
        if HaveTire4[plate] == true then
            cb(true)
        else
            cb(false)
        end
    elseif part == 'Door1' then
        if HaveDoor1[plate] == true then
            cb(true)
        else
            cb(false)
        end
    elseif part == 'Door2' then
        if HaveDoor2[plate] == true then
            cb(true)
        else
            cb(false)
        end
    elseif part == 'Door3' then
        if HaveDoor3[plate] == true then
            cb(true)
        else
            cb(false)
        end
    elseif part == 'Door4' then
        if HaveDoor4[plate] == true then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterNetEvent('mt-chopshop:server:AddMoney', function(MoneyType, Quantity)
    local Player = QBCore.Functions.GetPlayer(source)

    Player.Functions.AddMoney(MoneyType, Quantity)
end)

RegisterNetEvent('mt-chopshop:server:RemoveMoney', function(MoneyType, Quantity)
    local Player = QBCore.Functions.GetPlayer(source)

    Player.Functions.RemoveMoney(MoneyType, Quantity)
end)

RegisterNetEvent('mt-chopshop:server:SetCanInteract', function(plate, info)
    CanInteract[plate] = info
end)