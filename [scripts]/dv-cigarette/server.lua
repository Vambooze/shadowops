local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("cigarette", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
		TriggerClientEvent("dv-cigarette:client:UseCigarette", src)
end)


RegisterNetEvent('dv-cigarette:server:removecigarette', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('cigarette', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cigarette"], "remove")
end)