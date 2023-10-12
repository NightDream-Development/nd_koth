fx_version 'cerulean'
games { 'gta5' }

author 'Drazox#8271'
version '0.2.4'
lua54 'yes'

client_script 'client/*.lua'

shared_script {
 '@ox_lib/init.lua',
}

ui_page 'ui/index.html'

files {
    'ui/*.html',
    'ui/*.css',
    'ui/app.js',
    'locales/*.json'
}



escrow_ignore {
    'config.lua',
    'stream/*',
  }