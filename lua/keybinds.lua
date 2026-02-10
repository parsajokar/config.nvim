local function map(m, k, v, desc)
    if not desc then
        vim.keymap.set(m, k, v, { silent = true })
    else
        vim.keymap.set(m, k, v, { desc = desc, silent = true })
    end
end

local telescope_builtin = require("telescope.builtin")

map("n", "<Leader>gf", telescope_builtin.find_files, "Go to file") -- GO TO FILE
map("n", "<Leader>gs", telescope_builtin.live_grep, "Go to symbol") -- GO TO SYMBOL
map("n", "<Leader>gb", telescope_builtin.buffers, "Go to buffer") -- GO TO BUFFER

map("n", "<Leader>gp", require("telescope").extensions.project.project, "Go to project") -- GO TO PROJECT

map("n", "<Leader>ge", telescope_builtin.diagnostics, "Go to diagnostics") -- GO TO ERRORS
map("n", "<Leader>gd", vim.lsp.buf.definition, "Go to definition") -- GO TO DEFINITION

map("n", "<C-n>", "<CMD>noh<CR>")

map("n", "-", "<CMD>Oil<CR>", "File browser")

map("n", "<Leader>gg", "<CMD>Neogit<CR>")

map("n", "<Leader>?", function() require("which-key").show({ global = false }) end, "Which Key?")

-- Fix n and N. Keeping cursor in center
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Exit TERMINAL mode
map("t", "<Esc>", "<C-\\><C-n>")

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("n", "<C-j>", "<CMD>move .+1<CR>")
map("n", "<C-k>", "<CMD>move .-2<CR>")
map("x", "<C-j>", ":move '>+1<CR>gv=gv")
map("x", "<C-k>", ":move '<-2<CR>gv=gv")
