fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'RPX Custom Framework for RedM'
author 'Sinatra#0101'
version '0.0.1'

-- Small parts of this core/framework are based on the following other resources:
--     - VORPCore @ https://github.com/VORPCORE/vorp-core-lua
--     - QBR-Core @ https://github.com/qbcore-redm-framework/qbr-core
-- Credits is given where due.

-- All other parts of this core/framework have been written entirely from scratch, with other frameworks used as inspiration.

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'shared/debug.lua',
    'shared/jobs.lua',
    'shared/blips.lua',
    'shared/items.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/database.lua',
    'server/player.lua',
    'server/events.lua',
    'server/functions.lua',
    'server/loops.lua',
    'server/addons/*.lua',
}

client_scripts {
    'client/lib/blip.lua',
    'client/main.lua',
    'client/spawnmanager.lua',
    'client/exports.lua',
    'client/functions.lua',
    'client/events.lua',
    'client/game.lua',
    'client/loops.lua',
    'client/admin.lua',
    'client/addons/*.lua',
    'client/addons/*.js',
}

ui_page {
    'html/ui.html'
}

files {
    'html/ui.html',
}

lua54 'yes'

dependencies {
	'/server:6116',
	'/onesync',
	'oxmysql',
	'ox_lib',
}