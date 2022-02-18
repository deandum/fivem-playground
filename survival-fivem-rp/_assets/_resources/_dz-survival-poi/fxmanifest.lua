fx_version 'cerulean'
game 'gta5'

description 'DZ-Survival-POI'
version '1.0.0'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Change to the language you want
}

client_scripts {
    "@PolyZone/client.lua",
    "@PolyZone/BoxZone.lua",
    "@PolyZone/CircleZone.lua",
	'client/main.lua',
}

dependencies {
	'qb-core',
	'qb-interior',
	'qb-clothing',
	'qb-weathersync'
}

lua54 'yes'
