RegisterNetEvent('scully_holster:getPermission', function()
    local src = source
    local hasPermission = IsPlayerAceAllowed(src, 'holster')

    TriggerClientEvent('scully_holster:sendPermission', src, hasPermission)
end)