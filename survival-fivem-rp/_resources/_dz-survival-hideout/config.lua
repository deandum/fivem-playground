Hideouts = {}
Dealers = {}
Hideouts.Starting = true
Hideouts.SpawnOffset = 30

Hideouts.Locations = {
    ["default"] = {
        name = "defaultHideout",
        label = "El Burro Blvd",
        coords = {
            entrance = vector3(1708.4, -1610.43, 113.81),
            exit = vector3(1123.15, -3158.79, -37.06),
            inside = vector4(1120.87, -3152.36, -37.06, 351.1),
            outside = vector4(1693.94, -1596.19, 113.82, 86.6),
            stash = vector3(1118.99, -3144.01, -37.06),
            outfits = vector3(1116.83, -3163.07, -36.87),
        }
    }
}
shopInventoryMeds = {
    label = "Dealer Shop",
    slots = 30,
    items = {
        [1] = {
            name = "firstaid",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "bandage",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "ifaks",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "painkillers",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "joint",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "oxy",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "meth",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
    }
}
shopInventoryArms = {
    label = "Dealer Shop",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_pistol",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_pistol_mk2",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_appistol",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_revolver",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_smg",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_minismg",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weapon_pumpshotgun",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "weapon_assaultshotgun",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "weapon_pumpshotgun_mk2",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "weapon_assaultrifle",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "weapon_carbinerifle",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "weapon_molotov",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "weapon_smokegrenade",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
    }
}

shopInventoryMods = {
    label = "Dealer Shop",
    slots = 30,
    items = {
        [1] = {
            name = "pistol_extendedclip",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "pistol_flashlight",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "pistol_suppressor",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "smg_drum",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "smg_scope",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "shotgun_suppressor",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "assaultshotgun_extendedclip",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "rifle_grip",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "rifle_flashlight",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "carbinerifle_scope",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "rifle_suppressor",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "assaultrifle_extendedclip",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "assaultrifle_luxuryfinish",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "carbinerifle_luxuryfinish",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
        },
    }
}

shopInventoryAmmo = {
    label = "Dealer Shop",
    slots = 30,
    items = {
        [1] = {
            name = "pistol_ammo",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "rifle_ammo",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "smg_ammo",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "shotgun_ammo",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
    }
}

shopInventoryMisc = {
    label = "Dealer Shop",
    slots = 30,
    items = {
        [1] = {
            name = "id_card",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "tosti",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "sandwich",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "water_bottle",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "kurkakola",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "armor",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "handcuffs",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "radio",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "radioscanner",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "weapon_flashlight",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "weapon_wrench",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
    }
}

Hideouts.Dealers = {
    ["medsDealer"] = {
        coords = vector4(1115.59, -3160.98, -36.87, 179.79),
        label = "Buy Meds",
        model = `s_f_y_scrubs_01`,
        animation = "WORLD_HUMAN_STAND_IMPATIENT",
        isSpawned = false,
        shop = shopInventoryMeds
    },
    ["armsDealer"] = {
        coords = vector4(1098.77, -3142.62, -37.52, 220.26),
        label = "Buy Weapons",
        model = `u_m_m_griff_01`,
        animation = "WORLD_HUMAN_COP_IDLES",
        isSpawned = false,
        shop = shopInventoryArms
    },
    ["modsDealer"] = {
        coords = vector4(1109.35, -3150.71, -37.52, 180.04),
        label = "Buy Weapon Attachments",
        model = `g_f_y_lost_01`,
        animation = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS",
        isSpawned = false,
        shop = shopInventoryMods
    },
    ["ammoDealer"] = {
        coords = vector4(1114.68, -3154.08, -37.06, 272.7),
        label = "Buy Ammo",
        model = `s_m_y_ammucity_01`,
        animation = "WORLD_HUMAN_AA_COFFEE",
        isSpawned = false,
        shop = shopInventoryAmmo
    },
    ["miscDealer"] = {
        coords = vector4(1112.06, -3145.17, -37.06, 267.51),
        label = "Buy Misc Items",
        model = `s_m_y_dealer_01`,
        animation = "WORLD_HUMAN_CLIPBOARD",
        isSpawned = false,
        shop = shopInventoryMisc
    },
}

