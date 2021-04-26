fx_version 'bodacious'
games {'gta5'}


server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua',
}

client_scripts {
    'config/main.lua',
    'client/main.lua',
}

ui_page 'nui/index.html'

files {
    'nui/*',
}