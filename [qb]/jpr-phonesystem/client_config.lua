local QBCore                  = exports[Config.CoreName]:GetCoreObject()

function VehicleKeys(plate, vehicle)
    Citizen.Wait(1000) -- leave this
    TriggerEvent("vehiclekeys:client:SetOwner", plate)
end

function OpenPhone()
    if Config.CustomEventsFramework == false then
        if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then
            QBCore.Functions.TriggerCallback('jpr-phonesystem:server:verificarSlotPrimarioKey', function(serial)
                if (serial) then
                    TriggerEvent("jpr-phonesystem:client:abrirtelemovel", serial.id, serial.name)
                end
            end)
        else
            QBCore.Functions.Notify(Config.Locales["56"], "error")
        end
    else
        if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then
            exports[Config.CoreName]:TriggerCallback('jpr-phonesystem:server:verificarSlotPrimarioKey', function(serial)
                if (serial) then
                    TriggerEvent("jpr-phonesystem:client:abrirtelemovel", serial.id, serial.name)
                end
            end)
        else
            exports[Config.CoreName]:Notify(Config.Locales["56"], "error")
        end
    end
end