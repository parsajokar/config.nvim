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
                ensure_installed = {"lua", "python", "vim", "vimdoc", "commonlisp", "make", "cmake", "c", "cpp", "rust", "asm"},
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
    },

    -- AUTOCOMPLETE
    {
        "saghen/blink.cmp",
        version = "*",

        dependencies = {"rafamadriz/friendly-snippets"},

        opts = {
            keymap = {preset = "enter"},
            cmdline = {enabled = false},
            appearance = {
                nerd_font_variant = "normal"
            }
        },
        opts_extend = {"sources.default"}
    },

    -- NATIVE LSP SUPPORT
    {
        "neovim/nvim-lspconfig",
        lazy = false,

        dependencies = {
            "saghen/blink.cmp",
        },

        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities();

            lspconfig.pyright.setup({capabilities = capabilities})

            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never"
                }
            })

            lspconfig.rust_analyzer.setup({capabilities = capabilities})
        end
    }
}
