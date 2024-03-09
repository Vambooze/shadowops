Frame = GetFrame()
Custom = {}
if Config.UseInvetoryComsumables then
    local Frame = GetFrame()
    local alcoholCount = 0
   function AddStatus(type, value)
        if Config.Framework == 'esx' then 
            if type == 'alcohol' then type = 'drunk' end
            TriggerEvent('esx_status:add',type, value *1000)
       --     print ('^2[Origen_Inventory] ^7Added status', type, value)
        elseif Config.Framework == 'qbcore' then
            if type == 'hunger' then 
                TriggerServerEvent("consumables:server:addHunger", Frame.Functions.GetPlayerData().metadata["hunger"] + value)
                TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
            elseif type == 'thirst' then
                TriggerServerEvent("consumables:server:addThirst", Frame.Functions.GetPlayerData().metadata["thirst"] + value)
            elseif type == 'alcohol' then
                TriggerServerEvent("consumables:server:addThirst", Frame.Functions.GetPlayerData().metadata["thirst"] + value)
                alcoholCount += 1
                AlcoholLoop()
                if alcoholCount > 1 and alcoholCount < 4 then
                    TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
                elseif alcoholCount >= 4 then
                    TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
                end
            end
        end
   end

   local looped = false
    function AlcoholLoop()
        if not looped then
            looped = true
            CreateThread(function()
                while true do
                    Wait(10)
                    if alcoholCount > 0 then
                        Wait(1000 * 60 * 15)
                        alcoholCount -= 1
                    else
                        looped = false
                        break
                    end
                end
            end)
        end
    end
end

function Custom.OrigenProgressbar(id,label, time, controls, anim, props, cb)
    if Config.Progressbar == 'ox_lib' then 
        if lib.progressCircle({
            position = 'bottom',
            duration = time,
            label = label,
            useWhileDead = false,
            canCancel = true,
            anim = anim,
            prop = props,
            disable = {
                car = true
            },
        }) then cb(true) else cb(false) end 
    elseif Config.Progressbar == 'qs-progressbar' then
        exports['progressbar']:Progress({
            name = id,
            duration = time,
            label = label,
            useWhileDead = false,
            canCancel = true,
            controlDisables = controls,
            animation = anim,
            prop = props or {}
        }, function(status)
            if not status then
                cb(true)
            else
                cb(false)
            end
        end)
    elseif Config.Progressbar == 'qb-progressbar' then
        Frame.Functions.Progressbar(id, label, time or 1000,false,true,controls or {} , anim or {}, props or {},{}, function() -- Done
            cb(true)
        end,
        function() -- Cancel
            cb(false)
        end)
    else 
        Progress({
            name = id,
            duration = time,
            label = label,
            useWhileDead = false,
            controlDisables = controls,
            canCancel = true,
            animation = anim,
            prop = props
        }, function(status)
            if not status then
                cb(true)
            else
                cb(false)
            end
        end)

    end
end

if Config.Framework == 'esx' then
    isDead = false
    AddEventHandler('esx:onPlayerDeath', function(data) isDead = true end)
    AddEventHandler('esx:onPlayerSpawn', function(spawn) isDead = false end)
end


function Custom.CanOpenInventory()
    if Config.Framework == 'qbcore' then 
        local PlayerData = Frame.Functions.GetPlayerData()
        return not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"]
    elseif Config.Framework == 'esx' then
        return not isDead
    end
end
