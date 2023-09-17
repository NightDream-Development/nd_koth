fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'


--Additional files here
-- files {
-- }

--Client sided scripts
client_scripts {
  'client/*.lua',
  'client/ui.lua',
  'client/target/*.lua',
  'client/save_zones/*lua',
}

--Both server and client sided scripts
shared_script {
  '@ox_lib/init.lua',
  'shared/*.lua'
}

--Server sided scripts
server_scripts {
  'server/*.lua',
  '@oxmysql/lib/MySQL.lua',
}
