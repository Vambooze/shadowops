Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DEL'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = {}

Config.CoreName = "qb-core"
Config.WeatherScript = "qb-weathersync" --- if you renamed your qb-weathersync need to replace this, if dont use qb-weathersync put Config.WeatherScript = false
Config.RepeatTimeout = 4000 --- Depends of ringtone
Config.CallRepeats = 10 --- Depends of ringtone
Config.VoiceScript = "pma"  -- pma, mumble, salty, tokovoip
Config.EmailDomain = "@jpresources.com"
Config.JobManageScript = "qb-management"
Config.ScreenScript = "screenshot-basic"
Config.AddVerifiedInstagramCommand = "verifiedInstagram" -- account id, true or false
Config.AddVerifiedTwitterCommand = "verifiedTwitter" -- account id, true or false
Config.AddVerifiedTiktokCommand = "verifiedTiktok" -- account id, true or false
Config.PhoneModel = `prop_amb_phone`
Config.BillingCommand = "sendbill"
Config.AllowKeyMapping = true
Config.DefaultKey = 'G' -- you need to have phone item on first slot
Config.CloseAndOpenPhoneWithSameKey = false
Config.Inventory = "qb-inventory" 
Config.UniquePhones = true
Config.CustomEventsFramework = false -- set true if you use exports[Config.CoreName]: instead of QBCore.Functions., if you dont know this, let it false
Config.PhoneItems = {"phone", "phone_white", "phone_gold", "phone_red", "phone_blue", "phone_green", "phone_pink", "phone_greenLight"}
Config.AnimationLib = 'cellphone@'
Config.AnimationLibCar = 'anim@cellphone@in_car@ps'
Config.WalkWithCamera = false
Config.ServerSidedClockMessages = true

Config.PhotoWebhook = "https://discord.com/api/webhooks/1013060271574622278/-i1aqLpOPUtvF5gLmCY6Exaki1jKSgVZKBP_BaP25QkxSnEPRUSHxklRjK2sUGMUyGMm"

Config.StartingWallPaper = "background3"
Config.DefaultWallpapers = { --- DO NOT RENAME THE FILES, ALLWAYS BACKGROUND + NUMBER
    "background", "background2", "background3", "background4", "background5"
}

Config.Memojis = { --- html / img / memoji only png files
    "memoji-1", "memoji-2", "memoji-3", "memoji-4", "memoji-5", "memoji-6", 
    "memoji-7", "memoji-8", "memoji-9", "memoji-10", "memoji-11", "memoji-12", 
    "memoji-13", "memoji-14", "memoji-15", "memoji-16", "memoji-17", "memoji-18",
    "memoji-19", "memoji-20", "memoji-21", "memoji-22", "memoji-23", "memoji-24"
}

Config.CustomColors = {
    {"#ea4f4f", "#eb676794"}, {"#eaa44f", "#e6a36094"}, {"#ede247", "#ebe37394"}, {"#92eb44", "#a6eb6a94"},
    {"#3ce887", "#6eeba494"}, {"#38d9ce", "#5cdbd394"}, {"#3798d4", "#6baad194"}, {"#305bd1", "#6280d194"}, 
    {"#462ed1", "#6f61c294"}, {"#742dcc", "#9267c794"}, {"#ac28d1", "#b15bc994"}, {"#cf2da6", "#cf6bb594"}, 
    {"#c7246a", "#cf619094"}, {"#c72424", "#c4686894"}, 
}

Config.StartingRingtone = "toquetelemovel"
Config.StartingNotify = "somoriginal"
Config.StartingAlarm = "radar"
Config.Ringtones = {
    {"toquetelemovel", "Default"},
    {"mestrekassamba", "Mestre Kassamba"},
    {"iphone_13_call", "Old Style"},
    {"https://youtu.be/XwxLwG2_Sxk?si=mOIyT964YmhNSe9C", "The Weeknd - Blinding Lights"},
}
Config.NotifySounds = {
    {"somoriginal", "Default"},
    {"iphone_notification", "Tulurum"},
    {"https://www.youtube.com/watch?v=2ljMkQjg68w&ab_channel=PopularStuff", "Titlan"}
}
Config.AlarmSounds = {
    {"radar", "Radar"},
    {"iphone_alarm", "Bomb"},
}

Config.StartingSettings = '{"modovoo":false,"airdrop":true,"dadosmoveis":true,"notificacoes":true,"anonimo":false,"wallpaper":"'..Config.StartingWallPaper..'","wallpaperantigo":[],"faceid":[true,true,true],"codigo":[true,true,true], "volume":50, "semsom":false, "somtoque":"'..Config.StartingRingtone..'", "somnotif": "'..Config.StartingNotify..'", "somalarme":"'..Config.StartingAlarm..'", "percentagem":false, "baixoconsumo":false, "estadobateria":100, "optimizado":true, "brilho": 100, "wifi":true, "widgets":[], "perfil":["",""], "tipoletra":"ProBold", "tipocor":"rgb(241, 240, 240)", "imagemwpp":"https://i.imgur.com/8UaNhbE.png", "zoom":100}' 

Config.CityContacts = {
    {
        job = "police",
        name = "Police",
        apelido = "Los Santos",
    },
    {
        job = "ambulance",
        name = "EMS",
        apelido = "Doctor",
    },
    {
        job = "mechanic",
        name = "Mechanic",
        apelido = "Sport",
    },
    {
        job = "realestate",
        name = "Real",
        apelido = "Estate",
    },
}

Config.BatterySystem = true
Config.BatteryTicket = 190000 -- How many time to discount 1% of battery in MS ? 
-- example website: https://www.inchcalculator.com/convert/minute-to-millisecond/
-- in this website you can convert minutes to ms 
-- default is 100% = 5 hours of phone usage, that means 3 minutes per 1%, 3 minutes to ms = 180000 ms thats our value
Config.LowConsumeBatteryOptionHelp = 60000 --- is basically Config.BatteryTicket + Config.LowConsumeBatteryOptionHelp to decreass 1 %
-- default is 1 min = 60000 ms

Config.ChargingTime = 3000 -- again in ms, how many time to gain 1%
-- default is 5seg per 1% = 100% in 5 min

Config.ChanceToDegradeBatteryWithoutChargingOptimizedOff = 5 -- 0 to 100
Config.ChanceToDegradeBatteryWithoutChargingOptimizedOn = 2 -- 0 to 100

Config.BatteryDamageToStartBlinkingDisplay = 60
Config.BatteryDamageToDamageDisplay = 50
Config.ChanceToDisableDisplayWithBatteryDamage = 10 -- 0 to 100   60% of battery life have a chance to disable display (with Config.BatteryDamageToStartBlinkingDisplay)

Config.UseTargetToBatteryZones = true
Config.BlipSpriteChargingZone = 354
Config.BlipColourChargingZone = 5
Config.BlipScaleChargingZone = 0.7
Config.BlipLabelChargingZone = "Charging Zone"

Config.ChargingZones = {
    {coords = vector3(438.55, -986.8, 30.69), distance = 5, name = "Zona 1"},
}

Config.WifiSystem = true
Config.WifiZones = {
    {coords = vector3(-1536.56, 388.71, 107.87), radius = 20, name = "Wifi 1"},
    {coords = vector3(-1536.56, 388.71, 107.87), radius = 20, name = "Wifi 2"},
    {coords = vector3(-1536.56, 388.71, 107.87), radius = 20, name = "Wifi 3"},
    {coords = vector3(-1665.97, 390.94, 89.23), radius = 20, name = "Wifi 4"},
}

Config.SignalSystem = true
Config.NoSignalZones = {
    {coords = vector3(-1609.6, 264.67, 59.55), radius = 20},
}

Config.SendWebhookLogColor = 2067276

Config.OLXWebhooks = true -- Set to false if you do not want to send webhooks on discord for every new olx and delete olx.
Config.OLXWebhookColor = 1127128 --- only effects public olx posts, staff logs is Config.SendWebhookLogColor
Config.OLXWebhook = "https://discord.com/api/webhooks/1088599965212868648/68x4Q_rEm9DgLzyueCCPJ_akUUo4BzZqZeNqT_y4KXRVWURMGAshSsiE3u4Amsgy9WTC"
Config.OLXWebhookLog = "https://discord.com/api/webhooks/1088591152074211439/_2gI6VPW1fJok6sP03Lppyj7jSPXo7ZtFQ0Rt09FIkMQNQ7D5XXuU2SIInxeCyDsIp4I"

Config.WalletWebhooks = true -- Set to false if you do not want to send webhooks on discord for every new transaction made on the bank app.
Config.WalletWebhook = "https://discord.com/api/webhooks/1088586769437564928/BbKSGEI_CQMtOLLPH9Ns4pa6VQ8bKe-vGz6rj2XYVwUBNVrB0WMwaIa1jwkVcQfaX76R"

Config.StocksWebhooks = true -- Set to false if you do not want to send webhooks on discord for every new transaction made on the stocks app.
Config.StocksWebhook = "https://discord.com/api/webhooks/1093621419528700015/mKecXsG-Ag1Ndo9uQGbL1PO7eF9uZ5emBndZ_PvnjBxuU404JXh1DSnhAucXEdGk6Crk"

Config.TwitterWebhooks = true -- Set to false if you do not want to send webhooks on discord for every new tweet, anwser, like and retweet
Config.TwitterWebhookColor = 1942002 --- only effects public twitter posts, staff logs is Config.SendWebhookLogColor
Config.TwitterWebhook = "https://discord.com/api/webhooks/1092500399371591861/enzlRd2NTPtzf3Y0rWbcmjdPwzVKzFiDfzK4oBJEzdAT3rZP3VDYULziL1sPW38dUjq5"
Config.TwitterWebhookLog = "https://discord.com/api/webhooks/1092500045582041098/3Dd-gP-68yExqSr19kgLr-NMS5taikn33jstyMR4S-5KkB9yndaQ0pOcQigBOEfOpEP1"

Config.InstagramWebhooks = true -- Set to false if you do not want to send webhooks on discord for every new tweet, anwser, like and retweet
Config.InstagramWebhookColor = 14949099 --- only effects public instagram posts, staff logs is Config.SendWebhookLogColor
Config.InstagramWebhook = "https://discord.com/api/webhooks/1107045101542314074/nh3dMXo7PqgtZY8IBp8sW9Ua6dsv96bDX4DOwsqC5YgejEX1AcWPJCnmDu-8qaPkHYFi"
Config.InstagramWebhookLog = "https://discord.com/api/webhooks/1107045173160050942/OmJvB05GJ4k9Ot7taPTi5MTinfBIrkzkF-S3O9QLhZ8YR2RS5dTNukAB3KKIGyXcAMiy"

Config.TiktokWebhooks = true -- Set to false if you do not want to send webhooks on discord for every new tweet, anwser, like and retweet
Config.TiktokWebhookColor = 14949099 --- only effects public instagram posts, staff logs is Config.SendWebhookLogColor
Config.TiktokWebhook = "https://discord.com/api/webhooks/1169262606868033577/GsTty4nhV4N_m71V8ClScwOdqkjUvNCQIDwuMwpT76z80W8UnRn0SQHueI_j7f6QmOmF"
Config.TiktokWebhookLog = "https://discord.com/api/webhooks/1169262891292164147/HrWxw8PG4TPYggUyz70SgyFX37Sg71dwKuDpzMjPHKnTZers4ux6lvkrVBWQlboZXtYE"

Config.GetCryptoInfosCallBack = "qb-crypto:server:GetCryptoData"
Config.CryptoName = "qbit"
Config.CryptoLabelName = "JPResources"
Config.CryptoLabelNameDesc = "(JPR)"
Config.CryptoLogo = "./img/logo.jpg"

Config.UberEatsItems = {
    {itemname = "sandwich", itemlabel = "Sandwich", price = 25, category = "food", image = "./img/ubereats/sandwich.png", rate = 4.9},
    {itemname = "water_bottle", itemlabel = "Água", price = 15, category = "drink", image = "./img/ubereats/water_bottle.png", rate = 3},
}

Config.UberEatsNPCModel = "a_f_y_fitness_02"
Config.UberEatsVehicleModel = "faggio"
Config.UberEatsMaxSpawnRange = 400

Config.SpotifyMusics = {
    {sound = "https://youtu.be/wXhTHyIgQ_U?si=Xl_3KOU-tyLO9sUg", artist = "Post Malone", name = "Circles", description = "A fantastic music."},
    {sound = "https://www.youtube.com/watch?v=VbfpW0pbvaU&ab_channel=ShawnMendesVEVO", artist = "Shawn Mendes", name = "Stitches", description = "A fantastic music."},
    {sound = "https://youtu.be/lY2yjAdbvdQ?si=d-JqaPrxkvZ08WP_", artist = "Shawn Mendes", name = "Treat You Better", description = "A fantastic music."},
    {sound = "https://youtu.be/2fDzCWNS3ig?si=f3dlpnhRlFzlMA1a", artist = "The Weeknd", name = "Out of Time", description = "A fantastic music."},
    {sound = "https://youtu.be/u6wOyMUs74I?si=S8lPwaKCCu8QBYOH", artist = "Ed Sheeran", name = "Eyes Closed", description = "A fantastic music."},
    {sound = "https://youtu.be/XXYlFuWEuKI?si=kRbDhOSBN0MmUOoi", artist = "The Weeknd", name = "Save Your Tears", description = "A fantastic music."},
    {sound = "https://youtu.be/M4ZoCHID9GI?si=epP9kKTcpgyT7DAy", artist = "The Weeknd", name = "Call Out My Name", description = "A fantastic music."},
    {sound = "https://youtu.be/4NRXx6U8ABQ?si=D-tFbhilZXWcNfqY", artist = "The Weeknd", name = "Blinding Lights", description = "A fantastic music."},
    {sound = "https://youtu.be/f1r0XZLNlGQ?si=k3EjRybj11qTD55H", artist = "The Weeknd, JENNIE & Lily Rose Depp", name = "One Of The Girls", description = "A fantastic music."},
    {sound = "https://youtu.be/VPRjCeoBqrI?si=BbjE4Qw48O42n5-B", artist = "Coldplay", name = "A Sky Full Of Stars", description = "A fantastic music."},
    {sound = "https://youtu.be/dvgZkm1xWPE?si=k_w1MKU1Z5XCXQkI", artist = "Coldplay", name = "Viva La Vida", description = "A fantastic music."},
    {sound = "https://youtu.be/YykjpeuMNEk?si=-c8I6sAM7BG20Eg1", artist = "Coldplay", name = "Hymn For The Weekend", description = "A fantastic music."},
    {sound = "https://youtu.be/WdcLH96pMZA?si=PZgy_ZUD5IbSIO0J", artist = "Van Zee", name = "Amar de Cor", description = "A fantastic music."},
    {sound = "https://youtu.be/5tXh_MfrMe0?si=aXbKVcneoKp-VPdM", artist = "Rascal Flatts", name = "Life Is a Highway", description = "A fantastic music."},
}

Config.HouseScriptName = "qb-houses"

Config.YoutubeVideos = {
    {link = "https://youtu.be/XuiAoo4Q11A?si=94ETCbpfUW8Tt7hw", title = "JPResources - Housing System - QBCore & ESX", channel = "JPResources"},
    {link = "https://youtu.be/0C4v4lS2YHI?si=OT3vh5D0o8dW_Y63", title = "JPResources - Phone System - QBCore & ESX - ENG / PT", channel = "JPResources"},
    {link = "https://youtu.be/WqNiI72pAf4?si=lFfIYRwJp9UG0ib-", title = "JPResources - Crew System - QBCore", channel = "JPResources"},
    {link = "https://youtu.be/BfmOJBJC5M4?si=E-zJuOO-5PtdB6Gh", title = "JPResources - Garage System - QBCore & ESX", channel = "JPResources"},
    {link = "https://youtu.be/_fv1BRFlhGQ?si=aSzRFfvQG9BCJ8wy", title = "JPResources - Clothing Store - QBCore", channel = "JPResources"},
    {link = "https://youtu.be/4ul26jsp8_s?si=m8zsNEh7xO6PYt9W", title = "JPResources - Multi Char - QBCore", channel = "JPResources"},
    {link = "https://youtu.be/qzwMMiG3fVg?si=XzTypKEQox4Mh6h9", title = "JPResources - Budget Phone - QBCore", channel = "JPResources"},
    {link = "https://youtu.be/FdyNtg0a8uI?si=yULDZoT3N_zQRaUO", title = "JPResources - TDi Smoke - Standalone", channel = "JPResources"},
    {link = "https://youtu.be/ZrbP3_FG_Bk?si=kaTacAs5OikUg2XK", title = "JPResources - Inventory - QBCore - ENG / PT", channel = "JPResources"},
    {link = "https://youtu.be/iwS9uhUF6GM?si=zggkGwqCl2BEJVx1", title = "JPResources - Money Wash - QBCore - ENG / PT", channel = "JPResources"},
    {link = "https://youtu.be/e4GSRPAT7Ng?si=-YL39bWLDicLGZSn", title = "Resources - Territories - QBCore & ESX - ENG / PT", channel = "JPResources"},
    {link = "https://youtu.be/lYQ-j8-XbhU?si=qOU0eFB6RjuRoVyF", title = "JPResources - Backpack script - QBCore - ENG / PT", channel = "JPResources"},
    {link = "https://youtu.be/iVbgcaeA0AM?si=zCQ6OCjwsCdrBsD1", title = "JPResources - Pool Cleaning Job - ESX & QBCore - ENG / PT", channel = "JPResources"},
}

Config.AppStoreApps = {
    {name = "calculadora", label = "Calculator", backColor = "rgba(95, 94, 93, 0.178)", time = 5000, rate = 3.6, age = 6, image = "./img/apps/calculadora.png", category = "Mathematics", description = "Do your calculations with the Apple Calculator.", banner = "./img/appstore/calculadora.jpg"},
    {name = "garagem", label = "Garage", backColor = "rgba(0, 255, 4, 0.178)", time = 7400, rate = 4.6, age = 18, image = "./img/apps/garagem.png", category = "Management", description = "We want to make your travels simpler and more convenient. From your daily commutes to your leisure trips.\nThat's why we've changed the Garage app!\nWe've streamlined navigation so you can get to what really matters to you faster.", banner = "./img/appstore/viaverde.jpg"},
    {name = "home", label = "Home", backColor = "rgba(239, 124, 9, 0.178)", time = 6000, rate = 3.6, age = 16, image = "./img/apps/home.png", category = "Management", description = "Manage, share, verify, and ensure your security with this app.", banner = "./img/appstore/casa.jpg"},
    {name = "mail", label = "Mail", backColor = "rgba(7, 129, 243, 0.178)", time = 4800, rate = 3.6, age = 12, image = "./img/apps/mail.png", category = "Management", description = "Create, send emails, pay, confirm, delete, and have fun with this wonderful app!", banner = "./img/appstore/mail.jpg"},
    {name = "olx", label = "Advert", backColor = "rgba(7, 153, 243, 0.178)", time = 6200, rate = 4.7, age = 14, image = "./img/apps/olx.png", category = "Sales", description = "Find practically anything on Advert: cars, houses, job ads, vacation homes, smartphones, furniture, clothing, new and used electronics, it's all on OLX!\nOLX helps you break the tie...", banner = "./img/appstore/olx.jpg"},
    {name = "bolsa", label = "Crypto", backColor = "rgba(56, 56, 56, 0.178)", time = 8600, rate = 3.5, age = 18, image = "./img/apps/bolsa.png", category = "Market", description = "Invest, sell, transfer, crypto is the future!", banner = "./img/appstore/bolsa.jpg"},
    {name = "twitter", label = "Catiter", backColor = "rgba(0, 166, 255, 0.178)", time = 7000, rate = 3.2, age = 12, image = "./img/apps/twitter.png", category = "Social Network", description = "Share your interests, follow your favorite topics, and express your opinions!\nCatiter is your social network and the place to find out what's happening in the world.", banner = "./img/appstore/twitter.jpg"},
    {name = "carteira", label = "Wallet", backColor = "rgba(255, 145, 0, 0.178)", time = 4700, rate = 4.1, age = 12, image = "./img/apps/carteira.png", category = "Management", description = "Transfer, check transactions, purchase, pay bills, and check everything you're entitled to.", banner = "./img/appstore/carteira.jpg"},
    {name = "instagram", label = "Share It", backColor = "rgba(200, 0, 255, 0.178)", time = 6700, rate = 4.3, age = 12, image = "./img/apps/instagram.png", category = "Social Network", description = "Connect with friends, share what you're up to, or see what's new from others around the world.\nExplore our community, where you can feel free to be yourself and share everything from your daily routine to life's highlights.", banner = "./img/appstore/instagram.jpg"},
    {name = "whatsapp", label = "We Talk", backColor = "rgba(4, 255, 0, 0.178)", time = 9000, rate = 4.5, age = 16, image = "./img/apps/whatsapp.png", category = "Social Network", description = "We Talk from JPR is a FREE messaging and video calling app.\nIt's used by over 2 billion people in more than 180 countries.\nIt's simple, reliable, and private, letting you easily stay in touch with friends and family.", banner = "./img/appstore/whatsapp.jpg"},
    {name = "tempo", label = "Weather", backColor = "rgba(0, 200, 255, 0.178)", time = 6000, rate = 2.6, age = 6, image = "./img/apps/tempo.png", category = "Information", description = "Don't get caught by bad weather!\nOur app provides accurate and up-to-date weather information for your location.", banner = "./img/appstore/weather.jpg"},
    {name = "relogio", label = "Clock", backColor = "rgba(0, 0, 0, 0.178)", time = 9000, rate = 3.6, age = 6, image = "./img/apps/relogio.png", category = "Information", description = "Check the time, set alarms, time your activities, and track your time.", banner = "./img/appstore/clock.jpg"},
    {name = "notas", label = "Notes", backColor = "rgba(197, 181, 63, 0.178)", time = 6700, rate = 3.6, age = 6, image = "./img/apps/notas.png", category = "Information", description = "Don't forget, jot everything down in this app, your second brain.", banner = "./img/appstore/notes.jpg"},
    {name = "safari", label = "Safari", backColor = "rgba(38, 97, 224, 0.178)", time = 4000, rate = 4.6, age = 6, image = "./img/apps/safari.png", category = "Search", description = "With this app, you only don't know if you don't want to.", banner = "./img/appstore/safaribanner.jpg"},
    {name = "mapas", label = "Maps", backColor = "rgba(47, 224, 38, 0.178)", time = 7000, rate = 4.1, age = 12, image = "./img/apps/mapas.png", category = "Search", description = "Never lose track of anyone, with this app, you know where you are and where others are, isn't that great?", banner = "./img/appstore/mapas.jpg"},
    {name = "ubereats", label = "Delivery", backColor = "rgba(224, 159, 38, 0.178)", time = 6000, rate = 3.9, age = 16, image = "./img/apps/ubereats.png", category = "Food", description = "Delicious food. Easy delivery.\nHungry? Get the food you want from the restaurants you love, delivered at Uber speed.", banner = "./img/appstore/ubereats.jpg"},
    {name = "flapybird", label = "Flappy Doge", backColor = "rgba(38, 224, 41, 0.178)", time = 7000, rate = 3.6, age = 7, image = "./img/apps/flapybird.png", category = "Games", isGame = true, description = "A game to ease your mind... or not.", banner = "./img/appstore/flapybird.jpg"},
    {name = "spotify", label = "Music", backColor = "rgba(22, 120, 23, 0.178)", time = 8000, rate = 4.0, age = 10, image = "./img/apps/spotify.png", category = "Entertainment", description = "Music is the best way to listen to music and podcasts on your phone or tablet.\nSearch for any track, artist, or album and listen for free.\nCreate and share playlists.\nBuild your biggest and best music collection ever.", banner = "./img/appstore/spotify.jpg"},
    {name = "youtube", label = "Video Hub", backColor = "rgba(208, 27, 27, 0.178)", time = 2000, rate = 4.2, age = 10, image = "./img/apps/youtube.png", category = "Entertainment", description = "Get the official Video Hub app on iPhone and iPad.\nSee what the world is watching, from the most incredible music videos to trending content in gaming, fashion, beauty, news, learning, and more.\nSubscribe to your favorite channels, create your own content, share with friends, and watch on any device.", banner = "./img/appstore/youtube.jpg"},
    {name = "emprego", label = "Work", backColor = "rgba(62, 61, 61, 0.178)", time = 2500, rate = 3.2, age = 18, image = "./img/apps/emprego.png", category = "Management", description = "Get the Employment app to view your colleagues, information, and fill out timesheets on your phone!", banner = "./img/appstore/emprego.jpg"},
    {name = "tiktok", label = "TikTrend", backColor = "rgba(238, 8, 108, 0.178)", time = 5500, rate = 4.2, age = 15, image = "./img/apps/tiktok.png", category = "Social Network", description = "TikTrend is THE destination for mobile videos. On TikTrend, short-form videos are exciting, spontaneous, and genuine. Whether you’re a sports fanatic, a pet enthusiast, or just looking for a laugh, there’s something for everyone on TikTrend. All you have to do is watch, engage with what you like, skip what you don’t, and you’ll find an endless stream of short videos that feel personalized just for you. From your morning coffee to your afternoon errands, TikTrend has the videos that are guaranteed to make your day.", banner = "./img/appstore/tiktok.jpg"},
    {name = "tinder", label = "FlirtDate", backColor = "rgba(238, 8, 8, 0.178)", time = 4500, rate = 3.7, age = 18, image = "./img/apps/tinder.png", category = "Dating", description = "With 70+ billion matches to date, FlirtDate is the top free dating app, and the best place to meet new people. Are you looking for true love? An open relationship? Are you looking to get out there and find a date, or do you just want to make friends and chat? With FlirtDate, you can meet local people everywhere and get the best out of your dating experience.", banner = "./img/appstore/tinder.jpg"},
    {name = "tombrunner", label = "Tomb Runner", backColor = "rgba(226, 238, 8, 0.178)", time = 3500, rate = 3.6, age = 6, image = "./img/apps/tombrunner.png", category = "Games", isGame = true, description = "Dash through the temple, collect as many coins as possible and then make sure to avoid all of the deadly objects and gaps.", banner = "./img/appstore/tombrunner.jpg"},
    {name = "zombieshooter", label = "Zombie Shooter", backColor = "rgba(19, 71, 9, 0.178)", time = 4500, rate = 4.5, age = 7, image = "./img/apps/zombieshooter.png", category = "Games", isGame = true, description = "The legendary game that won over the hearts of many PC users is back to phone with a new look!The world is in danger.Make your way to the evacuation center, take part in the great battle for survival, and discover the cause of the invade!", banner = "./img/appstore/zombieshooter.jpg"},
    {name = "duckshooter", label = "Duck Shooter", backColor = "rgba(133, 116, 79, 0.178)", time = 5500, rate = 4.1, age = 8, image = "./img/apps/duckshooter.png", category = "Games", isGame = true, description = "Come along for the hunt and experience the adventure of fat ducks flying into your sights. Up to 25 free games can be won and the more hunters shoot at the ducks the higher your winnings are.", banner = "./img/appstore/duckshooter.jpg"},
    {name = "reporter", label = "GlobalNews", backColor = "rgba(128, 0, 128, 0.178)", time = 3750, rate = 4.5, age = 15, image = "./img/apps/reporter.png", category = "News", description = "The best news app you can find, check for your favorite news!", banner = "./img/appstore/reporter.jpg"},
    {name = "cinema", label = "CineNews", backColor = "rgba(253, 169, 12, 0.178)", time = 3250, rate = 4.6, age = 10, image = "./img/apps/cinema.png", category = "News", description = "The best news app you can find, check for your favorite cinema news!", banner = "./img/appstore/cinema.jpg"},
}

Config.DefaultApps = '{"appstore":8,"phone":1,"imessage":2,"contactos":3,"camara":4,"definicoes":5,"galeria":7,"dicas":6}'
Config.AppLabels = {
    ["calculadora"] = "Calculator",
    ["garagem"] = "Garage",
    ["home"] = "Home",
    ["mail"] = "Mail",
    ["olx"] = "Advert",
    ["bolsa"] = "Crypto",
    ["twitter"] = "Catiter",
    ["carteira"] = "Wallet",
    ["instagram"] = "Share It",
    ["whatsapp"] = "We Talk",
    ["tempo"] = "Weather",
    ["relogio"] = "Clock",
    ["notas"] = "Notes",
    ["safari"] = "Safari",
    ["mapas"] = "Maps",
    ["ubereats"] = "Delivery",
    ["flapybird"] = "Flappy Doge",
    ["spotify"] = "Music",
    ["youtube"] = "Video Hub",
    ["appstore"] = "App Store",
    ["phone"] = "Phone",
    ["imessage"] = "iMessages",
    ["contactos"] = "Contacts",
    ["camara"] = "Camera",
    ["definicoes"] = "Settings",
    ["galeria"] = "Gallery",
    ["dicas"] = "Tips",
    ["emprego"] = "Work",
    ["tiktok"] = "TikTrend",
    ["tinder"] = "FlirtDate",
    ["tombrunner"] = "Tomb Runner",
    ["zombieshooter"] = "Zombie Shooter",
    ["duckshooter"] = "Duck Shooter",
    ["reporter"] = "GlobalNews",
    ["cinema"] = "CineNews",
}

Config.AppSizes = { -- in MBs
    ["calculadora"] = 12.5,
    ["garagem"] = 54.42,
    ["home"] = 87.4,
    ["mail"] = 254.25,
    ["olx"] = 978,
    ["bolsa"] = 241,
    ["twitter"] = 2000,
    ["carteira"] = 2930,
    ["instagram"] = 1502,
    ["whatsapp"] = 592,
    ["tempo"] = 1257,
    ["relogio"] = 523,
    ["notas"] = 435,
    ["safari"] = 436,
    ["mapas"] = 341,
    ["ubereats"] = 900,
    ["flapybird"] = 643,
    ["spotify"] = 867,
    ["youtube"] = 1251,
    ["appstore"] = 500,
    ["phone"] = 451,
    ["imessage"] = 345,
    ["contactos"] = 124,
    ["camara"] = 241,
    ["definicoes"] = 466,
    ["galeria"] = 267,
    ["dicas"] = 200,
    ["emprego"] = 800,
    ["tiktok"] = 4562,
    ["tinder"] = 3453,
    ["tombrunner"] = 756,
    ["zombieshooter"] = 123,
    ["duckshooter"] = 345,
    ["reporter"] = 645,
    ["cinema"] = 512,
}

Config.DeleteInstagramStoryAfter24Hrs = true

Config.NewsJob = "police"
Config.CinemaJob = "police"

Config.GarageNPCModel = "s_m_y_valet_01"
Config.GarageMaxSpawnRange = 400
Config.FuelScript = "LegacyFuel" --- script name
Config.DoCarDamageValet = true
Config.ValetPrice = 400
Config.ImpoundState = 2

Config.ShopToRepairAndHack = true
Config.TargetScript = "qb-target"
Config.TargetIcon = 'fa-solid fa-battery-full'
Config.TargetIcon2 = 'fa-solid fa-unlock'
Config.ListaPeds = {
    {
		model = "cs_lestercrest",
		coords = vector3(1272.39, -1711.74, 53.77),     
		heading = 243.06,
		gender = "male",
        scenario = "CODE_HUMAN_CROSS_ROAD_WAIT"
	},
}

Config.PhoneBoxSystem = true
Config.PhoneBoxTargetIcon = "fa-solid fa-phone"
Config.QBInputMenu = "qb-input"
Config.PhoneBoxProps = {
    "p_phonebox_01b_s", "p_phonebox_02_s", "prop_phonebox_01a", "prop_phonebox_01b", "prop_phonebox_01c", "prop_phonebox_02", "prop_phonebox_03", "prop_phonebox_04"
}

Config.Locales = {
    ["1"] = "Payment of invoices",
    ["2"] = "All invoices have been paid in the amount of:",
    ["3"] = "€",
    ["4"] = "finances@gov.pt",
    ["5"] = "Invoice has been paid in the amount of:",
    ["6"] = "Charge with Magsafe",
    ["7"] = "You need to place the mobile you want to recharge in the first slot",
    ["8"] = "An invoice has been paid with the following data (company, amount, mobile id):",
    ["9"] = "€",
    ["10"] = "New ad published on Advert (mobile id, title, amount, category, ad id):",
    ["11"] = "Advert ad deleted (mobile id, ad id):",
    ["12"] = "Transfer performed (request, recipient, amount):",
    ["13"] = "New ad published on Advert by",
    ["14"] = "Amount:",
    ["15"] = "New account created on Catiter (mobile id, name, nickname, account id):",
    ["16"] = "New tweet published on Catiter (mobile id, account id, name, nickname, content, media, tweet id, reposted):",
    ["17"] = "New tweet published by",
    ["18"] = "Changes in Catiter profile made by:",
    ["19"] = "Tweet added/removed from favorites (user id who added, tweet id that was changed)",
    ["20"] = "Start/stop following on Catiter (user id who followed/unfollowed, user id who received/lost follow)",
    ["21"] = "New reply published by ",
    ["22"] = " to ",
    ["23"] = "New reply to a tweet (account id, tweet id, reply)",
    ["24"] = "New crypto purchase made (mobile id, purchased coins, coin value)",
    ["25"] = "New crypto sale made (mobile id, sold coins, coin value)",
    ["26"] = "New crypto transfer made (mobile id, transferred coins, recipient's wallet id)",
    ["27"] = "New account created on Share It (mobile id, name, nickname, account id):",
    ["28"] = "New post published by",
    ["29"] = "New post on Share It published (mobile id, account id, name, nickname, content, media, Share It id):",
    ["30"] = "Share It added/removed from favorites (user id who added, tweet id that was changed)",
    ["31"] = "Changes in Share It profile made by:",
    ["32"] = "Start/stop following on Share It (user id who followed/unfollowed, user id who received/lost follow)",
    ["33"] = "New story published by",
    ["34"] = "Add or remove verified tag",
    ["35"] = "Account ID",
    ["36"] = "You can check it in JPResources Staff Logs",
    ["37"] = "Fill in all fields!",
    ["38"] = "Account not found.",
    ["39"] = "Add or remove",
    ["40"] = "True or False",
    ["41"] = "Interaction performed successfully",
    ["42"] = "Unknown",
    ["43"] = "Repair battery",
    ["44"] = "Unlock mobile",
    ["45"] = "You need to place the mobile you want to repair in the first slot",
    ["46"] = "You need to place the mobile you want to hack in the first slot",
    ["47"] = "Action performed successfully",
    ["48"] = "Action performed successfully, new PIN: 111111",
    ["49"] = "New login in Share It (phone id, account id)",
    ["50"] = "Share It account logout (phone id, account id)",
    ["51"] = "New login in Catiter (phone id, account id)",
    ["52"] = "Catiter account logout (phone id, account id)",
    ["53"] = "Catiter account password changed (phone id, account id)",
    ["54"] = "Share It account password changed (phone id, account id)",
    ["55"] = "Open Phone System",
    ["56"] = "You cant open the phone",
    ["57"] = "Put the phone on the first inventory slot",
    ["58"] = "Transfer made: ",
    ["59"] = "Transfer",
    ["60"] = "Transfer received: ",
    ["61"] = "New login in TikTrend (phone id, account id)",
    ["62"] = "New account created on Tiktok (mobile id, name, nickname, account id):",
    ["63"] = "New post on Tik Trend published (mobile id, account id, name, nickname, content, media, tiktrend id):",
    ["64"] = "Tik Trend added/removed from favorites (user id who added, post id that was changed)",
    ["65"] = "Changes in Tiktok profile made by:",
    ["66"] = "Start/stop following on Tiktok (user id who followed/unfollowed, user id who received/lost follow)",
    ["67"] = "Tiktok account logout (phone id, account id)",
    ["68"] = "You dont have any phone item",
    ["69"] = "Payment Received",
    ["70"] = "Value: ",
    ["71"] = "Use phone box",
    ["72"] = "Whats the phone number?",
    ["73"] = "Ex: 96898493",
    ["74"] = "You are already doing a call",
    ["75"] = "Calling...",
    ["76"] = "Phone box call ended",
    ["77"] = "Call taken",
    ["78"] = "Cant call to yourself",
}