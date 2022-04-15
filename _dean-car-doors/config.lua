Config = {
    DRIVER = "DRIVER",
    PASSANGER = "PASSANGER",
    BACK_LEFT = "BACK_LEFT",
    BACK_RIGHT = "BACK_RIGHT",
    HOOD = "HOOD",
    TRUNK = "TRUNK",

    SEATS = {
        ["DRIVER"] = -1,
        ["PASSANGER"] = 0,
        ["BACK_LEFT"] = 1,
        ["BACK_RIGHT"] = 2,
    },

    DOORS = {
        ["DRIVER"] = {
            ID = 0,
            bone = "window_lf",
        },
        ["PASSANGER"] = {
            ID = 1,
            bone = "window_rf",
        },
        ["BACK_LEFT"] = {
            ID = 2,
            bone = "window_lr",
        },
        ["BACK_RIGHT"] = {
            ID = 3,
            bone = "window_rr",
        },
        ["HOOD"] = {
            ID = 4,
            bone = "bumper_f",
        },
        ["TRUNK"] = {
            ID = 5,
            bone = "boot",
        },
    },

    MAX_DISTANCE_FROM_POSITION = 1.5
}
