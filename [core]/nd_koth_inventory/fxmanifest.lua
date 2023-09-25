fx_version 'cerulean'
games { 'gta5' }

--Additional files here
files {
  'UI/*'
}

--Client sided scripts
client_scripts {
  'client/*.lua',
}

--Both server and client sided scripts
shared_script {
  'shared/*.*',
  '@ox_lib/init.lua',
}

--Server sided scripts
server_scripts {
  'server/*.lua',
}

ui_page 'UI/index.html'
