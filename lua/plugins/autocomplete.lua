return {
    {
        "saghen/blink.cmp",
        version = "1.*",

        dependencies = { "rafamadriz/friendly-snippets" },

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
            },
            signature = {
                enabled = true
            }
        },
        opts_extend = { "sources.default" }
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,

        dependencies = {
            "saghen/blink.cmp"
        },

        config = function()
            vim.diagnostic.config({
                signs = { 
                    active = true,
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN]  = "",
                        [vim.diagnostic.severity.HINT]  = "󰟃",
                        [vim.diagnostic.severity.INFO]  = ""
                    }
                }
            })

            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local lsp_list = require("specification").lsp_list

            for _, lsp in ipairs(lsp_list) do
                local config = {
                    capabilities = capabilities,
                }

                if lsp.args then
                    config.cmd = vim.list_extend({ lsp.name }, lsp.args)
                end

                vim.lsp.config[lsp.name] = config
                vim.lsp.enable(lsp.name)
            end
        end
    }
}
