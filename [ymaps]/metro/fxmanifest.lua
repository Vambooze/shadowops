fx_version "cerulean"
game "gta5"

author "BigDaddy"
description "Add trains and trams to your server!"
version '1.0.2'

this_is_a_map 'yes'

lua54 "yes"

client_scripts{
    "config.lua",
    "client.lua",
	"tickets.lua"
}

server_scripts {
    "server.lua",
    "config.lua",
}