local workspace = require("specification").workspace

vim.api.nvim_create_user_command("ChangeDirectory", function()
    print(workspace)
    require("telescope.builtin").find_files({
        prompt_title = "Change Directory",
        cwd = vim.fn.expand(workspace),
        find_command = { "fd", "--type", "d", "--max-depth", "1", "--hidden", "--exclude", ".git" },
        attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    local dir = vim.fn.expand(workspace) .. selection[1]
                    vim.cmd("cd " .. vim.fn.fnameescape(dir))
                    vim.notify("cwd: " .. dir, vim.log.levels.INFO)
                end
            end)

            return true
        end
    })
end, { nargs = 0 })
