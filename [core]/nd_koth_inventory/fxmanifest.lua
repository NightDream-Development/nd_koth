fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'
--Additional files here
files {
  'UI/*',
  'locales/*.json'
}

--Client sided scripts
client_scripts {
  'client/*.lua',
}


shared_script {
  '@ox_lib/init.lua',
}

--Server sided scripts
-- server_scripts {
--   'server/*.lua',
-- }

ui_page 'UI/index.html'
