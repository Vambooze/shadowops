----<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- ☾ AMERICAN SCRIPT ☾ --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>--

fx_version 'adamant'

game 'gta5'

author 'FelipeKLFH#5810'

description 'BOBCAT HEIST AMS Design V3 PEDS'

version '1.1.0'

lua54 'yes'

ui_page 'html/form.html'

client_scripts {
	'config.lua',
	'client/main.lua',
	'client/laptop.lua',
	'client/target.lua'
}

files {
    'html/form.html',
    'html/css.css',
    'html/jquery-3.4.1.min.js',
    'html/script.js',
    'html/KorolevLight.woff',
    'html/KorolevMedium.woff',
	'html/bankgothic.ttf'
}

export "AlertaRobo"

server_scripts {
	'config.lua',
	'server/laptop_sv.lua',
	'server/server.lua'
}

escrow_ignore {
	'config.lua',
}
dependency '/assetpacks'