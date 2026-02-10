return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',

        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },

        config = function()
            require("telescope").setup({
                defaults = {
                    preview = { treesitter = false }
                }
            })
        end
    },
    {
        "nvim-telescope/telescope-project.nvim",

        dependencies = {
            "nvim-telescope/telescope.nvim"
        },

        config = function()
            require("telescope").load_extension("project")
        end
    }
}
