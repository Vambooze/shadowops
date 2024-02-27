local QBCore                  = exports[Config.CoreName]:GetCoreObject()

function PayToSociety(society, amount, senderCitizenid)
    exports[Config.JobManageScript]:AddMoney(society, amount)

    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        local item = GetPhoneItem(v)

        if item then
            if Config.Inventory == "ox_inventory" then
                if item.metadata.serial ~= nil or item.metadata.serial ~= "" then
                    if v.PlayerData.citizenid == senderCitizenid then
                        TriggerClientEvent("jpr-phonesystem:client:customnotification", v.PlayerData.source, {
                            app = "Custom", -- dont change
                            title = Config.Locales["69"],
                            img = "https://i.imgur.com/ey4BGlT.png",
                            text = Config.Locales["70"]..amount..Config.Locales["3"],
                            time = 2600,
                        })

                        break
                    end
                end
            else
                if item.info.serie ~= nil or item.info.serie ~= "" then
                    if v.PlayerData.citizenid == senderCitizenid then
                        TriggerClientEvent("jpr-phonesystem:client:customnotification", v.PlayerData.source, {
                            app = "Custom", -- dont change
                            title = Config.Locales["69"],
                            img = "https://i.imgur.com/ey4BGlT.png",
                            text = Config.Locales["70"]..amount..Config.Locales["3"],
                            time = 2600,
                        })

                        break
                    end
                end
            end
        end
    end
end

function SendWebhookSocial(app, webhook, message, photo, title, image, color, perfil, mostraravatar)
    local webhook = webhook
    if webhook == '' then
        return
    end

    local headers = {
        ['Content-Type'] = 'application/json'
    }
    local data = nil
    
    if perfil ~= nil and mostraravatar then
        if perfil == '' or perfil == nil or perfil == 'default' then
            perfil = 'https://i.imgur.com/F6C40Ij.png'
        end

        data = {
            ["username"] = app,
            ["embeds"] = {{
                    ["thumbnail"] = {
                        ["url"] = perfil
                    },
                    ["color"] = color
            }}
        }
    else
        data = {
            ["username"] = app,
            ["embeds"] = {{
                    ["color"] = color
            }}
        }
    end

    if image ~= "" and image ~= nil then
        if string.match(image, "%.webm$") then
            data['embeds'][1]['description'] = '**'..title..' ** \n ' ..message..'\n'..image
        else
            data['embeds'][1]['image'] = {['url'] = image}
            data['embeds'][1]['description'] = '**'..title..' ** \n ' ..message
        end
    else
        data['embeds'][1]['description'] = '**'..title..' ** \n ' ..message
    end
    
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode(data), headers)
end

function PegarVeiculosJogadorFunction(citizenid)
    local Veiculos = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ?', {citizenid})

    return Veiculos
end

if Config.CustomEventsFramework == false then
    QBCore.Commands.Add(Config.BillingCommand, 'Bill A Player', {{name = 'id', help = 'Player ID'}, {name = 'amount', help = 'Amount'}}, false, function(source, args)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(args[1]))
        local amount = tonumber(args[2])
        if biller.PlayerData.job.name == "police" or biller.PlayerData.job.name == 'ambulance' or biller.PlayerData.job.name == 'mechanic' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        local idunico = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
                        MySQL.insert(
                            'INSERT INTO jpr_phonesystem_faturas (citizenid, senderCitizenID, amount, society, joblabel, date, idfatura) VALUES (?, ?, ?, ?, ?, now(), ?)',
                            {billed.PlayerData.citizenid, biller.PlayerData.citizenid, amount, biller.PlayerData.job.name,
                             biller.PlayerData.job.label, idunico})
    
                        TriggerEvent('jpr-phonesystem:server:RefreshBank', billed.PlayerData.source, billed.PlayerData.citizenid)
                        
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
    end)
else
    QBCore.Commands.Add(Config.BillingCommand, 'Bill A Player', {{name = 'id', help = 'Player ID'}, {name = 'amount', help = 'Amount'}}, false, function(source, args)
        local biller = exports[Config.CoreName]:GetPlayer(source)
        local billed = exports[Config.CoreName]:GetPlayer(tonumber(args[1]))
        local amount = tonumber(args[2])
        if biller.PlayerData.job.name == "police" or biller.PlayerData.job.name == 'ambulance' or biller.PlayerData.job.name == 'mechanic' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        local idunico = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
                        MySQL.insert(
                            'INSERT INTO jpr_phonesystem_faturas (citizenid, amount, society, joblabel, date, idfatura) VALUES (?, ?, ?, ?, now(), ?)',
                            {billed.PlayerData.citizenid, amount, biller.PlayerData.job.name,
                             biller.PlayerData.job.label, idunico})
    
                        TriggerEvent('jpr-phonesystem:server:RefreshBank', billed.PlayerData.source, billed.PlayerData.citizenid)
                        
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
    end)
end