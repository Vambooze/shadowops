RegisterServerEvent('fhose:requestPermissions')
AddEventHandler('fhose:requestPermissions', function()
    local idFound = false
    for _, id in ipairs(GetPlayerIdentifiers(source)) do
        if listcontains(Config.Identifiers, id) then
            idFound = true
            TriggerClientEvent('fhose:canUseNozzles', source, true)
            break
        end
    end
    if not idFound then
        TriggerClientEvent('fhose:canUseNozzles', source, false)
    end
end)

function listcontains(list, var)
	for i = 1, #list do
        if list[i] == var then
            return true
        end
    end
	return false
end