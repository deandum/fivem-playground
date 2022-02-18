fx_version 'cerulean'
game 'gta5'

description 'DZ-Survival-Hideout'
version '0.0.1'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
}

server_scripts {
    'server/main.lua'
}

client_scripts {
	'client/main.lua',
}

dependencies {
	'qb-core',
	'qb-interior',
	'qb-clothing',
	'qb-weathersync'
}

lua54 'yes'
