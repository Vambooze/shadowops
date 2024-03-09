fx_version 'cerulean'
game 'gta5'

description 'origen_inventory'

version '1.7.2.1'

shared_scripts {
	'locales/*.lua',
	'config.lua',
	'shared/*.lua',
	--'@ox_lib/init.lua'
}

server_script {
    '@oxmysql/lib/MySQL.lua',
	'frameworks/server.lua',
	'server/*.lua',
	'customs/weapons_useables.lua',
}

client_script {
	'frameworks/client.lua',
	'customs/client.lua',
	'client/init.lua',
	'client/main.lua',
	'client/consumables.lua',
	'client/progressbar.lua',
	'client/weapons.lua',
}

ui_page {
	'html/ui.html'
}

server_export 'GetStashItems'

files {
	'html/ui.html',
	'html/css/style.css',
	'html/js/app.js',
	'html/images/*.png',
	'html/images/*.jpg',
	'html/ammo_images/*.png',
	'html/attachment_images/*.png',
	'html/*.ttf',
	'html/*.otf',
	--'html/weapon_info.ogg',
	'html/assets/*.*',
	'html/sounds/*.mp3',
	'html/sounds/*.ogg',
	'html/sounds/*.wav'
}


-- Escrow
lua54 'yes'

dependencies {
    "oxmysql",
    "qb-core"
}

escrow_ignore {
    "config.lua",
	"shared/*.*",
	'customs/*.*',
	'locales/*.*',
}

dependency '/assetpacks'
dependency '/assetpacks'