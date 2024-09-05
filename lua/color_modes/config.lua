local M = {}

M.colors = {
    dont_touch_bg   = "#202328",
    dont_touch_fg   = "#BBC2CF",
    yellow          = "#ECBE7B",
    cyan            = "#008080",
    darkblue        = "#292E42",
    green           = "#3D5122",
    orange          = "#A16F27",
    violet          = "#A9A1E1",
    magenta         = "#C678DD",
    blue            = "#AA7799",
    red             = "#6F3328",
}

M.default_colors = {
    cursor_color = {
        n = M.colors.darkblue,
        i = M.colors.green,
        v = M.colors.blue,
        V = M.colors.blue,
        c = M.colors.orange,
        no = M.colors.red,
        s = M.colors.orange,
        ic = M.colors.yellow,
        r = M.colors.violet,
        rv = M.colors.violet,
        cv = M.colors.red,
        ce = M.colors.red,
        rm = M.colors.cyan,
        tr = M.colors.red,
    },
    numbers_color = {
        n = "#009dff",
        i = "#229c5f",
        c = "#aa7799",
        v = "#a234b3",
        V = "#a234b3",
    },
    background_color = {
        n = "#040c42",
        i = "#032f30",
        c = "#403804",
        v = "#400431",
        cv = "#30032f",
        ce = "#30032f",
        tr = "#30032f",
        rv = "#30032f",
        V = "#30032f",
    },
    column_marker = {
        use = true,
        number = 112,
        colour = M.colors.magenta,
    },
}

return M

