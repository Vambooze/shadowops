fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'QB-Inventory + AMS v2'
version '1.2.4'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
	'server/visual.lua',
}

client_scripts {
	'client/main.lua',
	'client/visual.lua',
}

ui_page {
    'html/ui.html'
}

files {
    'html/ui.html',
    'html/css/main.css',
    'html/js/app.js',
    'html/images/*.png',
    'html/images/*.jpg',
    'html/ammo_images/*.png',
    'html/attachment_images/*.png',
    'html/*.ttf'
}

escrow_ignore {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
	'client/main.lua',
	'client/visual.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
	'server/visual.lua',
}

dependency 'qb-weapons'

dependency '/assetpacks'