Mercy, LoggedIn = exports['qb-core']:GetCoreObject(), false, false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Mercy.Functions.TriggerCallback('mc-adminmenu/server/get-permission', function(pGroup) 
        Group = pGroup
    end)
    Citizen.Wait(250)
    InitAdminMenu()
    -- exports[GetCurrentResourceName()]:CreateLog('Logged In', 'Player Logged In')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    Mercy.Functions.TriggerCallback('mc-adminmenu/server/get-permission', function(pGroup) 
        Group = pGroup
    end)
    -- exports[GetCurrentResourceName()]:CreateLog('Logged Out', 'Player Logged Out')
    LoggedIn = false
end)

-- [ Code ] --

-- [ Events ] --

RegisterKeyMapping('o_adminmenu', Lang:t('info.keymapping_desc'), 'keyboard', Config.Settings['DefaultOpenKeybind'])
RegisterCommand('o_adminmenu', function(source, args, RawCommand) TriggerServerEvent('mc-admin/server/try-open-menu', true) end, false)

RegisterNetEvent('mc-admin/client/try-open-menu', function(KeyPress)
    if not IsPlayerAdmin() then return end
    if KeyPress then if not CanBind() then return end end
    ToggleMenu(false)
end)

RegisterNetEvent("mc-admin/client/reset-menu", function()
    if not IsPlayerAdmin() then return end
    ResetMenuKvp()
    TriggerEvent('mc-admin/client/force-close')
end)

RegisterNetEvent("mc-admin/client/force-close", function()
    SendNUIMessage({ Action = 'Close', })
end)

RegisterNetEvent("mc-admin/client/toggle-debug", function()
    if not IsPlayerAdmin() then return end
    Config.Settings['Debug'] = not Config.Settings['Debug']
    local Msg = Config.Settings['Debug'] and Lang:t('commands.enabled') or Lang:t('commands.disabled')
    local EnabledType = Config.Settings['Debug'] and 'success' or 'error'
    Mercy.Functions.Notify('Debug '..Msg, EnabledType)
end)

RegisterNetEvent("mc-admin/client/do-perms-action", function(Action, CommandId, Group)
    DoPermsAction(Action, CommandId, Group)
end)

-- [ NUI Callbacks ] --

RegisterNUICallback('ToggleKVP', function(Data, Cb)
    SetKvp(Data.Type, Data.Id, Data.Toggle)
    Cb('Ok')
end)

RegisterNUICallback("UnbanPlayer", function(Data, Cb)
    TriggerServerEvent('mc-admin/server/unban-player', Data.PData.BanId)
    SetTimeout(500, function()
        ToggleMenu(true)
    end)
    Cb('Ok')
end)

RegisterNUICallback('GetCharData', function(Data, Cb)
    Mercy.Functions.TriggerCallback('mc-admin/server/get-player-data', function(PlayerData)
        Cb(PlayerData)
    end, Data.Identifier)
end)

RegisterNUICallback("Close", function(Data, Cb)
   SetNuiFocus(false, false)
   Cb('Ok')
end)

RegisterNUICallback("DevMode", function(Data, Cb)
    local Bool = Data.Toggle
    ToggleDevMode(Bool)
    Cb('Ok')
end)

RegisterNUICallback("GetDateDifference", function(Data, Cb)
    Mercy.Functions.TriggerCallback('mc-admin/server/get-date-difference', function(FBans, CAmount)
        Cb({
            Bans = FBans, 
            Amount = CAmount,
        })
    end, Data.BanList, Data.CType)
end)

RegisterNUICallback('TriggerAction', function(Data, Cb) 
    if not IsPlayerAdmin() then return end
    if Data.EventType == nil then Data.EventType = 'Client' end
    if Data.Event ~= nil and Data.EventType ~= nil then
        if Data.EventType == 'Client' then
            TriggerEvent(Data.Event, Data.Result)
        else
            TriggerServerEvent(Data.Event, Data.Result)
        end
    end
    Cb('Ok')
end)

RegisterNUICallback("DeleteReport", function(Data, Cb)
    if not IsPlayerAdmin() then return end
    local Success, ServerId = DeleteReport(Data.Report['Id'])
    if Success then
        TriggerServerEvent('mc-admin/server/send-chat-report', ServerId, 
            '\n^0─────────────────────────────────────\n^1[Report '..Lang:t('info.report_close')..'] ^0→ '..
            Lang:t('info.report_closed', { chatcommand = Config.Commands['ReportNew'] })..
            '\n^0─────────────────────────────────────'
        )
    end
    Cb("Ok")
end)

RegisterNUICallback('SendChatsMessage', function(Data, Cb)
    local ChatChannel = Data.ChatChannel
    local ChatTime = Data.ChatTime
    local ChatMessage = Data.ChatMessage
    if ChatChannel == 'Staffchat' then
        Config.StaffChat[#Config.StaffChat + 1] = {
            ['Message'] = ChatMessage,
            ['Time'] = ChatTime,
            ['Sender'] = Mercy.Functions.GetPlayerData().name,
        }
        TriggerServerEvent('mc-admin/server/sync-chat-data', ChatChannel, Config.StaffChat, 0)
    else
        local Report = GetReportIdFromId(Data.ReportId)
        if Report then -- Check if report exists
            if Config.Reports[Report] ~= nil then
                Config.Reports[Report]['Chats'][#Config.Reports[Report]['Chats'] + 1] = {
                    ['Message'] = ChatMessage,
                    ['Time'] = ChatTime,
                    ['Sender'] = Mercy.Functions.GetPlayerData().name,
                }
                TriggerServerEvent('mc-admin/server/send-chat-report', Config.Reports[Report]['ServerId'], 
                '\n^0───────────────────────────\n^1[Admin] ^0→ ^5'..
                Mercy.Functions.GetPlayerData().name..'^0: '..ChatMessage..'\n^7→ '..
                Lang:t('info.report_reply', { chatcommand = Config.Commands['ReportChat'] })..
                '\n^0───────────────────────────')
                TriggerServerEvent('mc-admin/server/sync-chat-data', ChatChannel, Config.Reports, 0)
            end
        end
    end
    Cb("Ok")
end)