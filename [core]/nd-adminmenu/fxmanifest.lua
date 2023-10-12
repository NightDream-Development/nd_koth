fx_version   'cerulean'
lua54        'yes'
game         'gta5'
--Client sided scripts
client_scripts {
  'client/*.lua',
}

files {
  'locales/hu.json',
  'locales/en.json',
}

shared_script {
  '@ox_lib/init.lua',
  'shared/*.lua',
}

--Server sided scripts
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/*.lua',
}
