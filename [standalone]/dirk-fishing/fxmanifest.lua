fx_version 'adamant'
games { 'gta5' }
ui_page 'src/nui/index.html'
lua54 'yes'

client_scripts {
  'src/client/enums.lua',
  'src/client/functions.lua',
  'src/client/stores.lua',
  'src/client/utils.lua',
}

server_scripts {
  'QBItems.lua',
  'src/server/fw.lua', 
  'src/server/server.lua', 
  'src/server/items.lua',

}

shared_script 'config.lua'

files {
  'src/nui/index.html',
  'src/nui/img/*.png',
}



escrow_ignore{
  'src/client/stores.lua',
  'src/client/utils.lua',
  'src/server/fw.lua',

-- UnEscrowed uncomment
  'src/client/functions.lua',
  'src/server/server.lua', 
  'src/server/items.lua', 

  'config.lua',
  'QBItems.lua',
  'README.md',
}

dependency '/assetpacks'