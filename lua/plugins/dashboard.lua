return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },

        config = function()
            require("dashboard").setup({
                theme = "doom",
                config = {
                    header = require("specification").dashboard_header,
                    center = {
                        {
                            icon = "  ",
                            desc = "Open Project Manager",
                            key = "p",
                            key_format = " %s",
                            action = "lua require(\"telescope\").extensions.project.project()"
                        },
                        {
                            icon = "  ",
                            desc = "Edit Configuration",
                            key = "c",
                            key_format = " %s",
                            action = "e ~/.config/nvim/"
                        }
                    },
                    footer = {
                        "",
                        "",
                        "",
                        "Written by Parsa Jokar",
                        "https://github.com/parsajokar/config.nvim"
                    }
                }
            })
        end
    }
}
