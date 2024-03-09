fx_version 'cerulean'
game 'gta5'
author 'Marttins#0011'
description 'Simples chopshop script for QBCore by MT Scripts'

shared_script 'config.lua'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua',
    'client_editable.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

escrow_ignore {
    'server.lua',
    'client.lua',
    'config.lua',
    'client_editable.lua'
}

dependicies {
    'qb-radialmenu',
    'qb-target',
    'origen_inventory',
    'ps-ui',
    'PolyZone'
}

lua54 'yes'
dependency '/assetpacks'server_scripts { '@mysql-async/lib/MySQL.lua' }