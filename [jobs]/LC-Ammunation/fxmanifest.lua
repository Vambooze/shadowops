name "LC-Ammunation"
author "LifeCore"
description "A Beautiful Player Owned Ammunation script"
fx_version "cerulean"
game "gta5"
lua54 'yes'

dependencies {
    'qb-target',
    'ox_lib',
}
files {
	'shops.json',
}
shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client/client.lua',
    'client/menus.lua'
}

server_script {
    'server/server.lua',
	'server/UsableItems.lua',
    '@oxmysql/lib/MySQL.lua',
}

escrow_ignore {
    'config.lua',
    'shops.json',
    'server/UsableItems.lua'  -- Only ignore one file
  }
dependency '/assetpacks'