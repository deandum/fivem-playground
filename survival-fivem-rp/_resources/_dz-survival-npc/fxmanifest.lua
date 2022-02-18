fx_version 'cerulean'
game 'gta5'

description 'DZ-Survival-NPC'
version '0.0.1'

files {
    'popcycle.dat'
}

data_file 'POPSCHED_FILE' 'popcycle.dat'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Change to the language you want
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
