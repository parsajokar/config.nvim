vim.o.guifont = "BlexMono Nerd Font:h12"

vim.g.neovide_cursor_animation_length = 0.075
vim.g.neovide_cursor_short_animation_length = 0.025

if require("specification").transparent_mode then
    vim.g.neovide_opacity = 0.9
    vim.g.neovide_window_blurred = true
end
