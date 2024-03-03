-- Created by Scully | https://discord.gg/scully
fx_version 'cerulean'
lua54 'yes'
game 'gta5'

author 'https://discord.gg/scully'
description 'very noice weapon holster'
version '3.0.0'

shared_script 'config.lua'

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

escrow_ignore {
	'config.lua',
	'client/*.lua',
	'server/*.lua'
}
dependency '/assetpacks'