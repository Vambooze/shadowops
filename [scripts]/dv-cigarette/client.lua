local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('dv-cigarette:client:UseCigarette')
AddEventHandler('dv-cigarette:client:UseCigarette', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting cigarette...", 1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
   TriggerServerEvent('dv-cigarette:server:removecigarette')
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        exports["rpemotes"]:EmoteCommandStart(smoke, 1)
    else
        exports["rpemotes"]:EmoteCommandStart(smoke)
    end
	for i = 1, 5, 1 do -- You can edit 5 for amount you want
            Wait(15000) -- Wait 15 seconds to exec event.
            TriggerServerEvent('hud:server:RelieveStress', 10) -- Remove stress.
        end
    end)
end)