fx_version 'cerulean'
game 'gta5'

author 'IG_ABHINAV'
description 'Advanced Farming script'
version '1.1.3'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

server_scripts {'server/*.lua'}

shared_scripts {'config.lua'}

lua54 'yes'

escrow_ignore {
	'config.lua',
}  


dependencies {
    'PolyZone',
    'qb-menu',
    'qb-target'
}

this_is_a_map 'yes'

dependency '/assetpacks'