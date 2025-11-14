local g = vim.g
local cmd = vim.cmd

return {
    -- COLORSCHEME
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,

        config = function()
            cmd.colorscheme("terafox")
        end
    },

    -- PARSER
    {
        "nvim-treesitter/nvim-treesitter",

        build = function()
            require("nvim-treesitter.install").update({with_sync = true})()
        end,

        config = function()
            require("nvim-treesitter.install").prefer_git = false
            require("nvim-treesitter.install").compilers = {"gcc", "clang"}
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "vim",
                    "vimdoc",
                    "lua",
                    "python",
                    "make",
                    "cmake",
                    "c",
                    "cpp",
                    "rust",
                    "asm",
                    "commonlisp",
                    "racket",
                    "html",
                    "css",
                    "javascript",
                    "typescript"
                },
                highlight = {enable = true, additional_vim_regex_highlighting = false}
            })
        end
    },

    -- TELESCOPE
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",

        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },

    -- ICONS
    {
        "echasnovski/mini.icons",

        config = function()
            require("mini.icons").setup()
            require("mini.icons").mock_nvim_web_devicons()
        end
    },

    -- FILE EXPLORER
    {
        "stevearc/oil.nvim",
        lazy = false,

        dependencies = {
            "echasnovski/mini.icons"
        },

        config = function()
            require("oil").setup()
        end
    }
}
