fx_version 'cerulean'

game 'gta5'
author "NIYCCO"
description 'Standalone Hitmarker Script'
version '0.1.0b'

shared_script {
	'config.lua'
}

server_script {
	'server/server.lua'
}

client_scripts {
	'client/client.lua'
}

exports{
	'toogleHitmarkerExport'
}

ui_page 'nui/index.html'

files{
	'nui/index.html',
	'nui/sound/*'
}

lua54 'yes'