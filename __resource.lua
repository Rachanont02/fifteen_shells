resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'FiFTeeN shells'

version '2.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua',
	'client/shells.lua'
}

dependencies {
	'es_extended'
}
