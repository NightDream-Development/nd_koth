fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'


--Additional files here
files {
}

--Client sided scripts
client_scripts {
  'client/*.lua',
}


shared_script {
  '@ox_lib/init.lua',
}

--Server sided scripts
server_scripts {
  'server/*.lua',
  '@oxmysql/lib/MySQL.lua',
}
