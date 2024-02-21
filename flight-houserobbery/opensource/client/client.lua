local zones = {}

if Config.Framework == "qb-core" then
    local QBCore = exports[Config.Core.resource]:GetCoreObject()

    RegisterNetEvent(Config.Core.name..':Client:OnPlayerLoaded', function()
        lib.callback('flight-houserobbery:server:GetConfig', false, function(sync) Config.IPL = sync end)
        lib.callback('flight-houserobbery:server:GetConfigShells', false, function(sync) Config.Shells = sync end)
        lib.callback('flight-houserobbery:server:CooldownSync', false, function(sync) Config.Cooldowns = sync end)
        TriggerEvent('flight-houserobbery:client:SpawnZonesShells')
        TriggerEvent('flight-houserobbery:client:SpawnZones')
        TriggerEvent('flight-houserobbery:client:addbox')
        Wait(1000)
    end)

    function Notification(notification, notificationType, duration)
        TriggerEvent(Config.Core.name..':Notify', notification, notificationType, duration)
    end

    function HasItem(item)
        return QBCore.Functions.HasItem(item)
    end

    function EnableWeather()
        TriggerEvent(Config.Core.abbrev..'-weathersync:client:EnableSync')
    end

    function DisableWeather()
        TriggerEvent(Config.Core.abbrev..'-weathersync:client:DisableSync')
    end

    function Progressbar(name, label, duration, success, fail, icon)
        QBCore.Functions.Progressbar(name, label, duration, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
            }, {}, {}, {}, success, fail, icon)
    end
elseif Config.Framework == "esx" then
    RegisterNetEvent('esx:playerLoaded', function()
        lib.callback('flight-houserobbery:server:GetConfig', false, function(sync) Config.IPL = sync end)
        lib.callback('flight-houserobbery:server:GetConfigShells', false, function(sync) Config.Shells = sync end)
        lib.callback('flight-houserobbery:server:CooldownSync', false, function(sync) Config.Cooldowns = sync end)
        TriggerEvent('flight-houserobbery:client:SpawnZonesShells')
        TriggerEvent('flight-houserobbery:client:SpawnZones')
        TriggerEvent('flight-houserobbery:client:addbox')
        Wait(1000)
    end)
    
    function Notification(notification, notificationType, duration)
        TriggerEvent('esx:showNotification', notification, notificationType, duration)
    end
    
    function HasItem(item)
        local p = promise.new()
        lib.callback('flight-houserobbery:server:hasitem', false, function(result)
            p:resolve(result)
        end, item)
        return Citizen.Await(p)
    end
    
    RegisterNetEvent('flight-houserobbery:client:PdNotify', function(coords)
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 364)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, 59)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("House Robbery")
        EndTextCommandSetBlipName(blip)
        SetTimeout(120000, function()
            RemoveBlip(blip)
        end)
    end)
    
    function EnableWeather()
        TriggerEvent(Config.Core.abbrev..'-weathersync:client:EnableSync')
    end
    
    function DisableWeather()
        TriggerEvent(Config.Core.abbrev..'-weathersync:client:DisableSync')
    end
    
    function Progressbar(name, label, duration, success, fail, icon)
        if lib.progressBar({
            duration = duration,
            label = label,
            useWhileDead = false,
            canCancel = true,
            disable = {car = true},
            anim = {},
            prop = {},
        }) then success() else fail() end
    end
else

end

function CreateBoxZones(name, coords, size1 ,size2, minz, maxz, heading, event, icon, label)
    local Target
    if Config.Target == "ox_target" or Config.Target == "qb-target" then Target = "qb-target" else Target = Config.Target end
    exports[Target]:AddBoxZone(name, vector3(coords.x, coords.y, coords.z - Config.Minus1), size1, size2,
    {name = name, debugPoly = Config.debug, heading = heading, minZ = minz, maxZ = maxz},
        {
        options = {
            {
            name = name,
            type = "client",
            action = event,
            icon = icon,
            label = label,
            }
        },
        distance = 1.5
    })
end

function RemoveZonesFunction(name, name2)
    local Target
    if Config.Target == "ox_target" or Config.Target == "qb-target" then Target = "qb-target" else Target = Config.Target end
    exports[Target]:RemoveZone(name..name2)
end

function drawTextUi(bool, text)
    if Config.Drawtext == "OX" then
        if bool then lib.showTextUI(text) else lib.hideTextUI() end
    elseif Config.Drawtext == "QB" then
        if bool then exports[Config.Core.abbrev..'-core']:DrawText(text) else exports[Config.Core.abbrev..'-core']:HideText() end
    elseif Config.Drawtext == "OLDQB" then
        if bool then exports[Config.Core.abbrev..'-drawtext']:DrawText(text) else exports[Config.Core.abbrev..'-drawtext']:HideText() end    
    end
end

function zoneDestroy(name)
    for k, v in pairs(zones) do
        if v.name == name then
            zones[k]:remove() zones[k] = nil
        end
    end
end

function zoneCreate(name, coords, size, rotation, onEnter, onExit)
    zones[#zones + 1] = lib.zones.box({
        name = name,
        coords = coords,
        size = size,
        rotation = rotation,
        debug = Config.debug,
        onEnter = onEnter,
        onExit = onExit,
    })
end

function Emote(name)
    if Config.EmoteMenu == "dpemotes" then
        TriggerEvent('animations:client:EmoteCommandStart', {name})
    elseif Config.EmoteMenu == "rpemotes" then
        exports["rpemotes"]:EmoteCommandStart(name, 1)
    elseif Config.EmoteMenu == "scully" then
        exports.scully_emotemenu:playEmoteByCommand(name)
    else
        -- Add your other emote menu export here if it's none of the above
    end
end

function Evidence(chance)
    if math.random(1, 100) <= chance and not IsWearingHandshoes() then
        local pos = GetEntityCoords(PlayerPedId())
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
end

function Stress(chance)
    TriggerServerEvent('hud:server:GainStress', chance)
end

function Dispatch()
    if Config.Dispatch == "cd" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', }, 
            coords = data.coords,
            title = '10-15 - House Robbery',
            message = 'A '..data.sex..' robbing a house at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = '911 - House Robbery',
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Dispatch == "qs" then
        exports['qs-dispatch']:HouseRobbery()
    elseif Config.Dispatch == "ps" then
        exports['ps-dispatch']:HouseRobbery()
    else
        if Config.Framework == "esx" then
            TriggerServerEvent('flight-houserobbery:server:PdNotify')
            -- (ESX) Add your disptach script here if it's none of the above and remove the line above this one
        else
            -- (Qbcore) Add your disptach script here if it's none of the above
        end
    end
end

function Despawn(houseObj, house)
    DespawnInterior(houseObj, function() interior(house) end)
end

function CreateInterior(coords)
    return CreateHouseRobbery(coords)
end

function DoorUnlockSound()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
end

function AlarmSounds()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "metaldetected", 0.1)
end

function CreateHouseRobbery(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(10) end
	RequestModel(`furnitured_midapart`)
	while not HasModelLoaded(`furnitured_midapart`) do Wait(1000) end
	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

------ Minigames ------
function LockpickIPLMinigame()
    local p = promise.new()
    local seconds = math.random(Config.LockIPLCircleMinigame.seconds.min, Config.LockIPLCircleMinigame.seconds.max)
    local circles = math.random(Config.LockIPLCircleMinigame.circles.min, Config.LockIPLCircleMinigame.circles.max)
    exports['ps-ui']:Circle(function(yes)
        p:resolve(yes)
    end, circles, seconds)
    return Citizen.Await(p)
end

function LockpickShell()
    local p = promise.new()
    local seconds = math.random(Config.LockShellCircleMinigame.seconds.min, Config.LockShellCircleMinigame.seconds.max)
    local circles = math.random(Config.LockShellCircleMinigame.circles.min, Config.LockShellCircleMinigame.circles.max)
    exports['ps-ui']:Circle(function(yes)
        p:resolve(yes)
    end, circles, seconds)
    return Citizen.Await(p)
end

function SearchingMinigameIPL()
    local p = promise.new()
    local seconds = math.random(Config.SearchIPLCircleMinigame.seconds.min, Config.SearchIPLCircleMinigame.seconds.max)
    local circles = math.random(Config.SearchIPLCircleMinigame.circles.min, Config.SearchIPLCircleMinigame.circles.max)
    exports['ps-ui']:Circle(function(yes)
        p:resolve(yes)
    end, circles, seconds)
    return Citizen.Await(p)
end

function SearchingMinigameShell()
    local p = promise.new()
    local seconds = math.random(Config.SearchShellCircleMinigame.seconds.min, Config.SearchShellCircleMinigame.seconds.max)
    local circles = math.random(Config.SearchShellCircleMinigame.circles.min, Config.SearchShellCircleMinigame.circles.max)
    exports['ps-ui']:Circle(function(yes)
        p:resolve(yes)
    end, circles, seconds)
    return Citizen.Await(p)
end

function SafecrackingMinigameIPL()
    local result = exports["pd-safe"]:createSafe({math.random(0,99)})
    return result
end

------ Ped related functions and events ------
function CreatePeds()
    local pedModel = Config.NpcModel
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do Wait(0) end
    local ped = CreatePed(0, pedModel, Config.NpcCoords.x, Config.NpcCoords.y, Config.NpcCoords.z, Config.NpcCoords.w, false, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, Config.NpcAnimation, 0, true)
end

----- NPC interaction
RegisterNetEvent('flight-houserobbery:client:addbox', function()
    if Config.Interaction["NPC"] then
        CreateBoxZones("robberynpc", Config.NpcTargetCoords, 1.5 , 1.5, Config.NpcTargetMinZ, Config.NpcTargetMaxZ, 27.91,
        function()
            lib.callback("flight-houserobbery:server:CheckGlobalCooldown", false, function(result)
                if not result then return Notification(Loc[Config.Lan].group["npc_time"], 'error', Config.NotificationDurations) end
                if Config.GlobalCooldown["Status"] then TriggerEvent("flight-houserobbery:server:GlobalCooldown") end
                lib.callback("flight-houserobbery:server:cooldown", false, function(result)
                    if not result then return Notification(Loc[Config.Lan].group["npc_time"], 'error', Config.NotificationDurations) end
                    if Config.Framework ~= 'esx' then
                        local wait = lib.callback.await("flight-houserobbery:getOnlinePoliceCountQB", false)
                        if not wait then return Notification(Loc[Config.Lan].error["cops"], 'error', Config.NotificationDurations) end
                    else
                        local wait = lib.callback.await("flight-houserobbery:getOnlinePoliceCount", false)
                        if not wait then return Notification(Loc[Config.Lan].error["cops"], 'error', Config.NotificationDurations) end
                    end
                    local time = GetClockHours() if not (time >= Config.TimeFrame.min or time <= Config.TimeFrame.max) then return Notification(Loc[Config.Lan].group["not_time"], 'error', Config.NotificationDurations) end
                    if Config.GroupWork then
                        TriggerServerEvent('flight-houserobbery:server:GroupExports')
                    else
                        TriggerServerEvent("flight-houserobbery:server:MarkHouseNonGroup")
                    end
                end)
            end)
        end, Config.NpcIcon, Loc[Config.Lan].group["npc"])
    else
        zoneCreate("robberynpc", Config.NpcTargetCoords, vec3(2, 2, 3), 0, function() drawTextUi(true, Loc[Config.Lan].info["button"]..Loc[Config.Lan].group["npc"]) PressKey('RobberyNpc', true, Config.Interaction.Button) end, function() drawTextUi(false) Breaker() end)
    end
end)

----- Adding blip for non-group systems (Config.NPCStatus = true)
RegisterNetEvent('flight-houserobbery:client:AddBlipForPlayerIPL', function(house)
    local blip = AddBlipForCoord(house.DoorCoords.x, house.DoorCoords.y, house.DoorCoords.z)
    SetBlipSprite(blip, 364)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 59)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Target House")
    EndTextCommandSetBlipName(blip)
    Wait(Config.Failed * 60000)
    RemoveBlip(blip)
end)

RegisterNetEvent('flight-houserobbery:client:AddBlipForPlayerShell', function(house)
    local blip = AddBlipForCoord(house.coords.x, house.coords.y, house.coords.z)
    SetBlipSprite(blip, 364)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 59)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Target House")
    EndTextCommandSetBlipName(blip)
    Wait(Config.Failed * 60000)
    RemoveBlip(blip)
end)

RegisterNetEvent("flight-houserobbery:client:setTime", function()
    NetworkOverrideClockTime(23, 0, 0)
end)

----- Client Side EXP Events (Only use this if Config.ServerSideEvents is false and your skill system has client sided functions)
RegisterNetEvent("flight-houserobbery:client:AddExperience", function(exp)
    -- add exp function here and insert exp as a parameter
end)

lib.callback.register("flight-houserobbery:client:CheckExpLevel", function()
    -- Add "return" then add your check exp level function here
end)

------ Commands ------
RegisterCommand('getshelloffset', function()
    lib.callback('flight-houserobbery:CheckPerms', false, function(result)
        if not result then return Notification(Loc[Config.Lan].error["no_permission"], 'error', Config.NotificationDurations) end
        local pos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Shells) do
            if #(pos - vector3(v["coords"]["x"], v["coords"]["y"], v["coords"]["z"])) <= 50.0 then
                local houseCoords = vector3(
                    v["coords"]["x"],
                    v["coords"]["y"],
                    v["coords"]["z"] - Config.MinZOffset
                )
                local xdist = pos.x - houseCoords.x
                local ydist = pos.y - houseCoords.y
                local zdist = pos.z - houseCoords.z
                print('X: '..xdist)
                print('Y: '..ydist)
                print('Z: '..zdist)
                break
            end
            Wait(10)
        end
    end)
end, false)

RegisterCommand('lockshell', function()
    lib.callback('flight-houserobbery:CheckPerms', false, function(result)
        if not result then return Notification(Loc[Config.Lan].error["no_permission"], 'error', Config.NotificationDurations) end
        local pos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Shells) do
            if #(pos - vector3(v["coords"]["x"], v["coords"]["y"], v["coords"]["z"])) <= 10.0 then
                TriggerServerEvent('flight-houserobbery-shell:server:ResetHouseStateTimer', k)
                break
            end
            Wait(50)
        end
    end)
end, false)

RegisterCommand('lockipl', function()
    lib.callback('flight-houserobbery:CheckPerms', false, function(result)
        if not result then return Notification(Loc[Config.Lan].error["no_permission"], 'error', Config.NotificationDurations) end
        local pos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.IPL) do
            if #(pos - vector3(v["DoorCoords"]["x"], v["DoorCoords"]["y"], v["DoorCoords"]["z"])) < 10.0 then
                TriggerServerEvent('flight-houserobbery:server:ResetHouse', k)
                break
            end
            Wait(50)
        end
    end)
end, false)