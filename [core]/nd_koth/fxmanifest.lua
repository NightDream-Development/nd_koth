fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'


--Additional files here
files {
  'locales/*.json',
}

--Client sided scripts
client_scripts {
  'client/func.lua',
  'client/ui.lua',
  'client/xp.lua',
  'client/zone.lua',
  'client/save_zones/*.lua',
  'client/standalone/*.lua',
  'client/target/*.lua',
  'client/team_specific/*.lua',
}


shared_script {
  '@ox_lib/init.lua',
  'shared/*.lua'
}

--Server sided scripts
server_scripts {
  'server/*.lua',
  '@oxmysql/lib/MySQL.lua',
}
