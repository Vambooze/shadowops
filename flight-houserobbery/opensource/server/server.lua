Webhook = "" -- Add your webhook here

if Config.Framework == "qb-core" then
    local QBCore = exports[Config.Core.resource]:GetCoreObject()

    function AddItem(source, item, amount)
        QBCore.Functions.GetPlayer(source).Functions.AddItem(item, amount)
    end

    function RemoveItem(source, item, amount)
        return QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item, amount)
    end

    function ItemBox(source, item, addRemove, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], addRemove, amount)
    end

    function NotificationServer(source, notification, notificationType, duration)
        TriggerClientEvent(Config.Core.name..':Notify', source, notification, notificationType, duration)
    end

    lib.callback.register("flight-houserobbery:getOnlinePoliceCountQB", function(source)
        local jobs = {"police", "statepolice", "fib"}
        local CurrentCops = 0
        for k, v in pairs(jobs) do
            local players = QBCore.Functions.GetPlayers()
            for i = 1, #players do
                local Player = QBCore.Functions.GetPlayer(players[i])
                if Player ~= nil then
                    if Player.PlayerData.job.name == v then
                        CurrentCops = CurrentCops + 1
                    end
                end
            end
        end
        return CurrentCops >= Config.MinimumHouseRobberyPolice
    end)

    function DiscordLogCash(source, amount)
        if Config.DiscordLogStatus then
            local player = QBCore.Functions.GetPlayer(source)
            DiscordLog("**Name:** **"..player.PlayerData.charinfo.firstname.."** **"..player.PlayerData.charinfo.lastname.."**".."\n".."**Server ID:** "..player.PlayerData.cid.."\n".."**Citizen ID:** "..player.PlayerData.citizenid.."\n".."**License:** "..player.PlayerData.license.." \n \n".."Log info: ".." **+** **"..amount.."**")
        end
    end

    function DiscordLogItem(source, item, amount, info)
        if Config.DiscordLogStatus then
            local player = QBCore.Functions.GetPlayer(source)
            if not info then 
                DiscordLog("**Name:** **"..player.PlayerData.charinfo.firstname.."** **"..player.PlayerData.charinfo.lastname.."**".."\n".."**Server ID:** "..player.PlayerData.cid.."\n".."**Citizen ID:** "..player.PlayerData.citizenid.."\n".."**License:** "..player.PlayerData.license.." \n \n".."Log info: ".." **+** **"..amount.."** **"..item.."**")
            else
                DiscordLog("**Name:** **"..player.PlayerData.charinfo.firstname.."** **"..player.PlayerData.charinfo.lastname.."**".."\n".."**Server ID:** "..player.PlayerData.cid.."\n".."**Citizen ID:** "..player.PlayerData.citizenid.."\n".."**License:** "..player.PlayerData.license.." \n \n".."Log info: ".." **+** **"..amount.."** **"..item.."**".."**:"..info.."**")
            end
        end
    end
elseif Config.Framework == "esx" then

    CreateThread(function()
        while ESX == nil do Wait(1000) end
    end)
    
    function AddItem(source, item, amount)
        ESX.GetPlayerFromId(source).addInventoryItem(item, amount)
    end

    function RemoveItem(source, item, amount)
        ESX.GetPlayerFromId(source).removeInventoryItem(item, amount)
    end

    function ItemBox(source, item, addRemove, amount)

    end

    function NotificationServer(source, notification, notificationType, duration)
        TriggerClientEvent('esx:showNotification', source, notification, notificationType, duration)
    end

    lib.callback.register('flight-houserobbery:server:hasitem', function(source, item)
        if Config.Inventory == "ox" then
            local check = exports.ox_inventory:GetItemCount(source, item)
            if check >= 1 then return true else return false end
        elseif Config.Inventory == "qs" then
            local check = exports['qs-inventory']:GetItemTotalAmount(source, item)
            if check >= 1 then return true else return false end
        else
            local check = ESX.GetPlayerFromId(source).hasItem(item)
            if check.count >= 1 then return true else return false end
        end
    end)

    lib.callback.register("flight-houserobbery:getOnlinePoliceCount", function(source)
        local Players = ESX.GetPlayers()
        local policeOnline = 0
        for i = 1, #Players do
            local xPlayer = ESX.GetPlayerFromId(Players[i])
            if xPlayer["job"]["name"] == "police" then
                policeOnline = policeOnline + 1
            end
        end
        return policeOnline >= Config.MinimumHouseRobberyPolice
    end)

    RegisterServerEvent('flight-houserobbery:server:PdNotify', function()
        local xPlayer = ESX.GetPlayerFromId(source)
        local Players = ESX.GetPlayers()
        for i = 1, #Players do
            local xPlayer = ESX.GetPlayerFromId(Players[i])
            if xPlayer["job"]["name"] == "police" then
                TriggerClientEvent('esx:showNotification', source, 'Someone is robbing a house, check your map for the location')
            end
        end
        local coords = xPlayer.getCoords(true)
        TriggerClientEvent('flight-houserobbery:client:PdNotify', coords)
    end)

    function DiscordLogCash(source, amount)
        if Config.DiscordLogStatus then
            local player = ESX.GetPlayerFromId(source)
            DiscordLog(player.getName().. ' - '..player.getIdentifier().."\n".."Log info: ".." **+** **"..amount.."**")
        end
    end

    function DiscordLogItem(source, item, amount, info)
        if Config.DiscordLogStatus then
            local player = ESX.GetPlayerFromId(source)
            if not info then
                DiscordLog(player.getName().. ' - '..player.getIdentifier().."\n".."Log info: ".." **+** **"..amount.."** **"..item.."**")
            else
                DiscordLog(player.getName().. ' - '..player.getIdentifier().."\n".."Log info: ".." **+** **"..amount.."** **"..item.."**".."**:"..info.."**")
            end
        end
    end
else

end

----- Group work functions -----
function GroupgetGroupByMembers(source)
    local group = exports[Config.Core.abbrev..'-phone']:GetGroupByMembers(source)
    return group
end

function GroupgetGroupMembers(group)
    local group = exports[Config.Core.abbrev..'-phone']:getGroupMembers(group)
    return group
end

function GroupgetJobStatus(group)
    local group = exports[Config.Core.abbrev..'-phone']:getJobStatus(group)
    return group
end

function GroupgetGroupSize(group)
    local group = exports[Config.Core.abbrev..'-phone']:getGroupSize(group)
    return group
end

function GroupisGroupLeader(source, group)
    local group = exports[Config.Core.abbrev..'-phone']:isGroupLeader(source, group)
    return group
end

function GroupCreateBlipForGroupIPL(house, group)
    exports[Config.Core.abbrev..'-phone']:CreateBlipForGroup(group, "targethouse", {
        label = Loc[Config.Lan].group["blip_name"], 
        coords = vector3(house.DoorCoords.x, house.DoorCoords.y, house.DoorCoords.z),
        sprite = 364,
        color = 59,
        scale = 1.0,
    })
end

function GroupCreateBlipForGroupShell(house, group)
    exports[Config.Core.abbrev..'-phone']:CreateBlipForGroup(group, "targethouse", {
        label = Loc[Config.Lan].group["blip_name"], 
        coords = vector3(house.coords.x, house.coords.y, house.coords.z), 
        sprite = 364,
        color = 59,
        scale = 1.0,
    })
end

function GroupNotifyGroup(group, message, successFail)
    exports[Config.Core.abbrev..'-phone']:NotifyGroup(group, message, successFail)
end

function GroupRemoveBlipForGroup(group)
    if not group then return end
    exports[Config.Core.abbrev..'-phone']:RemoveBlipForGroup(group, "targethouse")
end

function GroupresetJobStatus(group)
    exports[Config.Core.abbrev..'-phone']:resetJobStatus(group)
end

function GroupsetJobStatus(group, status, stage)
    exports[Config.Core.abbrev..'-phone']:setJobStatus(group, status, stage)
end

function AddExperience(source, exp)
    if not Config.ClientSideEvents then
        exports[""]:addExp("theft", source, exp)
    else
        TriggerClientEvent("flight-houserobbery:client:AddExperience", source, exp)
    end
end

function CheckExpLevel(source)
    if not Config.ClientSideEvents then
        local level = exports[""]:GetSkillLevel('theft', source)
        return level.level
    else
        local level = lib.callback.await("flight-houserobbery:client:CheckExpLevel", source, false)
        return level
    end
end

lib.callback.register('flight-houserobbery:CheckPerms', function(source)
    return IsPlayerAceAllowed(source, "qbcore.admin") or IsPlayerAceAllowed(source, "qbcore.god") or IsPlayerAceAllowed(source, "group.admin") or IsPlayerAceAllowed(source, "group.god")
    -- return true
end)