
RegisterCommand('help', function()
    msg("Discord: discord.gg/shadowops")

end, false)


--
function msg()
    TriggerEvent("chatMessage",  "[Server]", {255,0,0}, text)
end