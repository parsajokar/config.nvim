local g = vim.g
local cmd = vim.cmd

vim.api.nvim_create_user_command('ChangeDirectory', function()
    require('telescope.builtin').find_files({
        prompt_title = "Select Directory",
        cwd = vim.fn.expand("~/dev"),
        find_command = { "fd", "--type", "d", "--max-depth", "3" },
        attach_mappings = function(prompt_bufnr, map)
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                vim.cmd('cd ' .. selection.path)
                vim.cmd('Oil ' .. selection.path)
            end)
            return true
        end,
    })
end, {})

return {
    -- DASHBOARD
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
                    center = {
                        {
                            icon = "  ",
                            desc = "Open Directory",
                            key = "d",
                            key_format = " %s",
                            action = "ChangeDirectory"
                        },
                        {
                            icon = "  ",
                            desc = "Open Configuration",
                            key = "c",
                            key_format = " %s",
                            action = "e ~/.config/nvim/"
                        }
                    }
                }
            })
        end
    },

    -- COLORSCHEME
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,

        config = function()
            g.gruvbox_material_enable_italic = true
            cmd.colorscheme("gruvbox-material")
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
                    "asm",
                    "c",
                    "cmake",
                    "cpp",
                    "glsl",
                    "lua",
                    "make",
                    "markdown",
                    "python",
                    "racket",
                    "rust",
                    "vim",
                    "vimdoc"
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

    -- FILE EXPLORER
    {
        "stevearc/oil.nvim",
        lazy = false,

        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },

        config = function()
            require("oil").setup()
        end
    },

    --BUFFERLINE
    {
        "akinsho/bufferline.nvim",
        version = "*",

        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },

        config = function()
            require("bufferline").setup({
                options = {
                    separator_style = "slant",
                    diagnostics = "nvim_lsp",
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                }
            })
        end
    },

    -- AUTOCOMPLETE
    {
        "saghen/blink.cmp",
        version = "1.*",

        dependencies = {"rafamadriz/friendly-snippets"},

        opts = {
            keymap = {preset = "enter"},
            cmdline = {enabled = false},
            appearance = {
                nerd_font_variant = "normal"
            },
            completion = {
                ghost_text = {
                    enabled = true
                }
            }
        },
        opts_extend = {"sources.default"}
    },

    -- FORMATTER
    {
        "stevearc/conform.nvim",

        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    c = {"clang-format"},
                    cpp = {"clang-format"},
                    python = {"black"},
                    rust = {"rustfmt"}
                },
            })
        end
    },

    -- NATIVE LSP SUPPORT
    {
        "neovim/nvim-lspconfig",
        lazy = false,

        dependencies = {
            "saghen/blink.cmp"
        },

        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config["clangd"] = {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never"
                }
            }
            vim.lsp.enable("clangd")

            vim.lsp.config["pyright"] = {capabilities = capabilities}
            vim.lsp.enable("pyright")

            vim.lsp.config["rust_analyzer"] = {capabilities = capabilities}
            vim.lsp.enable("rust_analyzer")
        end
    }
}
