Config = {}

--Max Amount Of Fires At Once
Config.MaxFires = 10
--Max Flames That Can Be Created Via Command
Config.MaxFlames = 20
--Max Spread That Can Be Created Via Command
Config.MaxSpread = 20

--Discord Webhooks
Config.Discord = {
    UseWebHooks = true,
    WEB_HOOK = "https://discord.com/api/webhooks/ YOUR WEBHOOK SHOULD BE HERE",
    STEAM_API = "",
    WEB_IMAGE = "https://cdn.discordapp.com/attachments/786356643491086368/939538836629893160/logo.png",
    BOT_NAME = "Toxic FireScript Logger",
}

--If you dont use esx nor use qbus set UseESX to false and UseQBUS to false
--You can then use the job identifier whitelist as standalone

--If you use esx enable this
Config.UseESX = false

--If you use qbus enable this
Config.UseQBUS = false

--Required Job To Use The FireHose
Config.JobName = "firefighter"

--This is a whitelist for the firefighers (Standalone Only)
Config.UseFireJobWhitelist = false
Config.FireJobIdentifiers = {
    "steam:11000012430xfa",
    "license:1123d12313"
}

--Identifier Admin whitelist
--Set UseWhitelist To True To Use The Whitelist (Standalone Only)
--Set this to true to enable the admin whitelist so that no one can use the admin commands
Config.UseWhitelist = false
Config.Identifiers = {
    "steam:11000012430xfa",
    "license:1123d12313"
}


--This Is The Fire Blips
--Check https://docs.fivem.net/docs/game-references/blips/ For The Blip Sprites And Colors
Config.FireWarnings = {
    Ping = {
        Enabled = true,
        Radius = 40.0,
        FadeTimer = 40,
        Color = 1,--Color 1 Is Red
        StartAlpha = 255,--Alpha Is The Opacity
    },
    Blip = {
        Enabled = true,
        Name = "Active Fire",
        Sprite = 436,
        Color = 1,--Color 1 Is Red
        Alpha = 255,--Alpha Is The Opacity
    },
    Message = {
        Enabled = true,
    }
}

--Lifetime is the life of the flame, how hard it is to take out
--Some flames are considered a fire on their own which makes them not affected by water, add isFireScript = true to fix that
--The Smoke is added after or before the flame is out, and the timeout is the amount of time it stays
Config.FireTypes = {
    ["normal"] = {
        dict = "scr_trevor3", 
        part = "scr_trev3_trailer_plume", 
        scale = 0.7, 
        lifetime = 5, 
        zoffset = 0.4, 
        isFireScript = false,
        smoke = {
            dict = "core",
            part = "ent_amb_stoner_vent_smoke",
            scale = 1,
            timeout = 15,--In Seconds
            playduring = true,
            playafter = true,
            zoffset = 1.0
        }
    },
    ["normal2"] = {
        dict = "core", 
        part = "fire_wrecked_truck_vent", 
        scale = 3, 
        lifetime = 6, 
        zoffset = 0.4, 
        isFireScript = false,
        smoke = {
            dict = "core",
            part = "ent_amb_smoke_factory_white",
            scale = 1,
            timeout = 15,--In Seconds
            playduring = true,
            playafter = true,
            zoffset = 0.0
        }
    },
    ["chemical"] = {
        dict = "core", 
        part = "fire_petroltank_truck", 
        scale = 4, 
        lifetime = 8, 
        zoffset = 0.0, 
        isFireScript = false,
        smoke = {
            dict = "core",
            part = "ent_amb_smoke_general",
            scale = 1,
            timeout = 15,--In Seconds
            playduring = true,
            playafter = true,
            zoffset = 1.0
        }
    },
    ["electrical"] = {
        dict = "core", 
        part = "ent_ray_meth_fires", 
        scale = 1, 
        lifetime = 10, 
        zoffset = 0.0, 
        isFireScript = true,
        smoke = {
            dict = "core",
            part = "ent_amb_smoke_foundry",
            scale = 1,
            timeout = 15,--In Seconds
            playduring = true,
            playafter = true,
            zoffset = 1.0
        }
    },
    ["bonfire"] = {
        dict = "scr_michael2", 
        part = "scr_mich3_heli_fire", 
        scale = 1, 
        lifetime = 12, 
        zoffset = 0.0, 
        isFireScript = true,
        smoke = {
            dict = "scr_agencyheistb",
            part = "scr_env_agency3b_smoke",
            scale = 1,
            timeout = 15,--In Seconds
            playduring = true,
            playafter = true,
            zoffset = 1.0
        }
    }
}

--Random Fires Configurations
--Select The Type From The Fire Types
--Fire timeout is to set the fire off if it hasn't been taken out
Config.RandomFires = {
    Enabled = true,
    AOP = "LS",--Current AOP
    Delay = 1800,--In Seconds (30 Minutes)
    Locations = {
        ["LS"] = {--Lossantos Is The AOP
            [1] = {
                position = vector3(122.14, -223.04, 54.56),--Clothes shop
                location = "Clothes Shop",
                flames = 20,
                spread = 15,
                type = "normal",
                timeout = 300--In Seconds
            },
            [2] = {
                position = vector3(-41.45, -1097.81, 26.42),--Dealership
                location = "Dealer Ship",
                flames = 20,
                spread = 15,
                type = "electrical",
                timeout = 300--In Seconds
            },
            [3] = {
                position = vector3(265.09, -1259.29, 29.14),--Gas Station
                location = "Gas Station",
                flames = 20,
                spread = 15,
                type = "chemical",
                timeout = 300--In Seconds
            },
            [4] = {
                position = vector3(855.61, -285.82, 65.52),--Skate Park
                location = "Skate Park",
                flames = 20,
                spread = 20,
                type = "bonfire",
                timeout = 300--In Seconds
            },
        },
        ["SA"] = {--Sandy Is The AOP
            [1] = {
                position = vector3(1963.77, 3744.05, 32.34),--24/7
                location = "24/7",
                flames = 10,
                spread = 5,
                type = "normal2",
                timeout = 300--In Seconds
            },
        },
        ["PB"] = {--Paleto Bay Is The AOP
            [1] = {
                position = vector3(-92.22, 6415.5, 31.47),--Gas Station
                location = "Gas Station",
                flames = 20,
                spread = 10,
                type = "normal2",
                timeout = 300--In Seconds
            },
        }
    }
}


--[[Smoke Particles
This is more of a spark for like an electric fire
smokedict = "core",
smokepart = "ent_amb_elec_crackle",

smokedict = "scr_agencyheistb",
smokepart = "scr_env_agency3b_smoke",

smokedict = "core",
smokepart = "ent_amb_stoner_vent_smoke",

smokedict = "core",
smokepart = "ent_amb_smoke_general",

smokedict = "core",
smokepart = "ent_amb_smoke_foundry",

smokedict = "core",
smokepart = "ent_amb_smoke_factory_white",

This is a large white fog
smokedict = "core",
smokepart = "ent_amb_fbi_smoke_fogball",

smokedict = "core",
smokepart = "ent_amb_generator_smoke",
]]--
