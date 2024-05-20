
-------------------------------------------- General --------------------------------------------
Config = {}
Config.Framework = "newqb" -- newqb, oldqb, esx
Config.Mysql = "oxmysql" -- mysql-async, ghmattimysql, oxmysql
Config.DefaultHud = "radial" -- Default hud when player first login avaliable huds [radial, classic, text]
Config.DefaultSpeedUnit = "kmh" -- Default speed unit when player first login avaliable speed units [kmh, mph]
Config.HudSettingsCommand = 'hud' -- Command for open hud settings
Config.DisplayMapOnWalk = false -- true - Show map when walking | false - Hide map when walking
Config.DisplayRealTime = false -- if you set this to true will show the real time according to player local time | if false it will show the game time
Config.EnableSpamNotification = true -- Spam preventation for seatbelt, cruise etc.
Config.EnableDateDisplay = false -- Determines if display date or nor
Config.DefaultMap = "rectangle" -- rectangle, radial
Config.DefaultSpeedometerSize = 0.7 -- 0.5 - 1.3
Config.DefaultHudSize = 1.0 -- 0.5 - 1.3
Config.EnableAmmoHud = true -- Determines if display ammo hud or nor
Config.DefaultRefreshRate = 200 -- Refresh rate for vehicle hud
Config.EnableHealth = true
Config.EnableHunger = true
Config.EnableThirst = true
Config.EnableHud = true
Config.EnableArmor = true
Config.EnableStamina = true
Config.EnableSpeedometer = true



Config.DefaultHudColors = {
    ["radial"] = {
        ["health"] = "#FF4848ac",
        ["armor"] = "#2E3893",
        ["hunger"] = "#FFA048ac",
        ["thirst"] = "#4886FFac", 
        ["stress"] = "#f56f6f",
        ["stamina"] = "#C4FF48ac",
        ["oxy"] = "#48A7FFac",
        ["parachute"] = "#48FFBDac", 
        ["nitro"] = "#AFFF48ac", 
        ["altitude"] = "#00FFF0ac", 
    },
    ["text"] = {
        ["health"] = "#FF4848ac",
        ["armor"] = "#2E3893",
        ["hunger"] = "#FFA048ac",
        ["thirst"] = "#4886FFac", 
        ["stress"] = "#f56f6f",
        ["stamina"] = "#C4FF48ac",
        ["parachute"] = "#48FFBDac", 
        ["oxy"] = "#48A7FFac",
        ["nitro"] = "#AFFF48ac", 
        ["altitude"] = "#00FFF0ac", 
    },    
    ["classic"] = {
        ["health"] = "#9F2929",
        ["armor"] = "#2E3893",
        ["hunger"] = "#B3743A",
        ["thirst"] = "#2F549C", 
        ["stress"] = "#f56f6f",
        ["oxy"] = "#48A7FFac",
        ["stamina"] = "#c4ff48",
        ["parachute"] = "#48ffde", 
        ["nitro"] = "#8eff48", 
        ["altitude"] = "#48deff", 
    },      
}


-------------------------------------------- Watermark hud --------------------------------------------
Config.DisableWaterMarkTextAndLogo = true -- true - Disable watermark text and logo 
Config.UseWaterMarkText = false -- if true text will be shown | if  false logo will be shown
Config.WaterMarkText1 = "Adriatic" -- Top right server text
Config.WaterMarkText2 = "RP"  -- Top right server text
-- Config.WaterMarkLogo = "https://cdn.discordapp.com/attachments/984848349083619379/1069440389020405800/myLogo.png" -- Logo url
Config.WaterMarkLogo = "https://remote-tools-images.s3.amazonaws.com/invisible-discord-name/invisible-profile-pic.png"
Config.LogoWidth = "120px"
Config.LogoHeight = "100px"
Config.EnableId = false -- Determines if display server id or nor
Config.EnableWatermarkCash = false -- Determines if display cash or nor
Config.EnableWatermarkBankMoney = false -- Determines if display bank money or nor
Config.EnableWatermarkJob = false -- Determines if display job or nor
Config.EnableWatermarkWeaponImage = true -- Determines if display weapon image or nor
Config.EnableWaterMarkHud = true -- Determines if right-top hud is enabled or not

Config.Text1Style = {
    ["color"] = '#e960c7',
    ["text-shadow"] = "0px 0.38rem 2.566rem rgba(116, 5, 147, 0.55)",
}

Config.Text2Style = {
    ["color"] = "#ffffff",
}

-------------------------------------------- Keys --------------------------------------------
Config.DefaultCruiseControlKey = "CAPITAL" -- Default control key for cruise. Players can change the key according to their desire 
Config.DefaultSeatbeltControlKey = "B" -- Default control key for seatbelt. Players can change the key according to their desire 
Config.VehicleEngineToggleKey = "M" -- Default control key for toggle engine. Players can change the key according to their desire 
Config.NitroKey = "X" -- Default control key for use nitro. Players can change the key according to their desire 

-------------------------------------------- Nitro --------------------------------------------
Config.RemoveNitroOnpress = 2 -- Determines of how much you want to remove nitro when player press nitro key
Config.NitroItem = "nitro" -- item to install nitro to a vehicle
Config.EnableNitro = false -- Determines if nitro system is enabled or not
Config.NitroForce = 50.0 -- Nitro force when player using nitro

-------------------------------------------- Money commands --------------------------------------------
Config.EnableCashAndBankCommands = true -- Determines if money commands are enabled or not
Config.CashCommand = "cash"  -- command to see cash
Config.BankCommand = "bank" -- command to see bank money

-------------------------------------------- Engine Toggle --------------------------------------------
Config.EnableEngineToggle = false -- Determines if engine toggle is enabled or not

-------------------------------------------- Vehicle Functionality --------------------------------------------
Config.EnableCruise = true -- Determines if cruise mode is active
Config.EnableSeatbelt = true -- Determines if seatbelt is active

-------------------------------------------- Settings text --------------------------------------------
Config.SettingsLocale = { -- Settings texts
    ["text_hud_1"] = "test",
    ["text_hud_2"] = "hud",
    ["classic_hud_1"] = "classic",
    ["classic_hud_2"] = "hud",
    ["radial_hud_1"] = "radial",
    ["radial_hud_2"] = "hud",
    ["hide_hud"] = "Hide Hud",
    ["health"] = "Health",
    ["armor"] = "Armor",
    ["thirst"] = "Thirsty",
    ["stress"] = "Stress",
    ["oxy"] = "Oxygen",
    ["hunger"] = "Hungry",
    ["show_hud"] = "Show Hud",
    ["stamina"] = "Stamina",
    ["nitro"] = "Nitro",
    ["Altitude"] = "Altitude",
    ["Parachute"] = "Parachute",
    ["enable_cinematicmode"] = "Activate Cinematic",
    ["disable_cinematicmode"] = "Deactivate Cinematic",
    ["exit_settings_1"] = "Exit",
    ["exit_settings_2"] = "Settings",
    ["speedometer"] = "SPEEDOMETER",
    ["map"] = "MAP",
    ["show_compass"] = "Show Street Name",
    ["hide_compass"] = "Hide Street Namen",
    ["rectangle"] = "Rectangle",
    ["radial"] = "Rounded",
    ["dynamic"] = "Dynamic",
    ["status"] = "STATUS",
    ["enable"] = "Aktif",
    ["hud_size"] = "Hud Size",
    ["disable"] = "Disable",
    ["hide_at"] = "Hide in",
    ["and_above"] = "and above",
    ["enable_edit_mode"] = "Customize icon HUD",
    ["enable_edit_mode_2"] = "Customize all HUD",
    ["change_status_size"] = "Change Hud Size",
    ["change_color"] = "Change Hud Colors",
    ["disable_edit_mode"] = "Disable Edit Mode",
    ["reset_hud_positions"] = "Reset Hud Position",
    ["info_text"] = "Keep in mind that increasing the refresh rate may reduce game performance!",
    ["speedometer_size"] = "Speedometer size",
    ["refresh_rate"] = "Refresh Rate",
    ["esc_to_exit"] = "PRESS ESC TO EXIT EDIT MODE"
}

-------------------------------------------- Fuel --------------------------------------------
Config.UseLegacyFuel = true --Enable this if you use legacy fuel

Config.GetVehicleFuel = function(vehicle) -- you can change LegacyFuel export if you use another fuel system 
    if Config.UseLegacyFuel then
        return exports["LegacyFuel"]:GetFuel(vehicle)
    else
        return GetVehicleFuelLevel(vehicle)
    end
end

-------------------------------------------- Stress --------------------------------------------

Config.UseStress = true -- if you set this to false the stress hud will be removed
Config.StressWhitelistJobs = { -- Add here jobs you want to disable stress 
    -- 'police', 'ambulance'
}

Config.WhitelistedWeaponStress = {
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`
}

Config.AddStress = {
    ["on_shoot"] = {
        min = 1,
        max = 3,
        enable = false,
    },
    ["on_fastdrive"] = {
        min = 1,
        max = 3,
        enable = false,
    },
}

Config.RemoveStress = { -- You can set here amounts by your desire
    ["on_eat"] = {
        min = 5,
        max = 10,
        enable = true,

    },
    ["on_drink"] = {
        min = 5,
        max = 10,
        enable = true,

    },
    ["on_swimming"] = {
        min = 5,
        max = 10,
        enable = true,

    },
    ["on_running"] = {
        min = 5,
        max = 10,
        enable = true,
    },

}



-------------------------------------------- Notifications --------------------------------------------

Config.Notifications = { -- Notifications
    ["stress_gained"] = {
        message = 'Getting Stressed',
        type = "error",
        time = 5000
    },
    ["stress_relive"] = {
        message =  'You Are Relaxing',
        type = "success",
        time = 5000
    },
    ["took_off_seatbelt"] = {
        type = "error",
        message = "Seatbelt Off.",
        time = 5000
    },
    ["took_seatbelt"] = {
        type = "success",
        message = "Seatbelt On.",
        time = 5000
    },
    ["cruise_actived"] = {
        type = "success",
        message = "Cruise activated.",
        time = 5000
    },
    ["cruise_disabled"] = {
        type = "error",
        message = "Cruise deactivated.",
        time = 5000
    },
    ["spam"] = {
        type = "error",
        message = "Wait a few seconds.",
        time = 5000
    },
    ["engine_on"] = {
        type = "success",
        message = "Engine On.",
        time = 5000
    }, 
    ["engine_off"] = {
        type = "success",
        message = "Engine Off.",
        time = 5000
    }, 
    ["cant_install_nitro"] = {
        type = "error",
        message = "You cannot use Nitro from inside the vehicle.",
        time = 5000
    }, 
    ["no_veh_nearby"] = {
        type = "error",
        message = "There is no vehicle nearby.",
        time = 5000
    }, 
    ["cash_display"] = {
        type = "success",
        message = "You have $%s in your pocket.",
        time = 5000
    }, 
    ["bank_display"] = {
        type = "success",
        message = "You have $%s in your bank.",
        time = 5000
    }, 
}

Config.Notification = function(message, type, isServer, src) -- You can change here events for notifications
    if isServer then
        if Config.Framework == "esx" then
            TriggerClientEvent('okokNotify:Alert', src, "HUD", message, 3000, type)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" then
            exports["okokNotify"]:Alert("HUD", message, 3000, type)
        else
            TriggerEvent('QBCore:Notify', message, type, 1500)
        end
    end
end 