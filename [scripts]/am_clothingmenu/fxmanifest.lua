fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'FelipeKLFH#Kirutz'
description 'American Script'

shared_scripts {
  'config.lua'
}

client_scripts {
  'client/*.lua'
}

ui_page 'html/index.html'

files {
  'html/*.html',
  'html/css/*.css',
  'html/js/*.js',
  'html/*.ttf',
  'html/*.png',
      'html/swipe.ogg',
  'html/*.svg'
}

escrow_ignore {
  'config.lua',
  'client/*.lua',
}
dependency '/assetpacks'