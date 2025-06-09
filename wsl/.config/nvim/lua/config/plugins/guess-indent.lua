return {
    "NMAC427/guess-indent.nvim", -- Detect tabstop and shiftwidth automatically
    opts = {
        on_tab_options = {
            ["expandtab"] = false,
            ["tabstop"] = 4,
            ["softtabstop"] = 0,
            ["shiftwidth"] = 4,
        },
        on_space_options = {
            ["expandtab"] = true,
            ["tabstop"] = 4,
            ["softtabstop"] = 0,
            ["shiftwidth"] = 4,
        },
    },
}
