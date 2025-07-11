local g = vim.g
local o = vim.opt

-- leader key
g.mapleader = " "

-- assembly syntax
g.asmsyntax = "fasm"

-- Doesn"t show --INSERT-- and --VISUAL--
-- o.showmode = false

-- Theme
o.termguicolors = true
o.background = "dark" -- or "light" for light mode

-- Disable Netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.relativenumber = true
o.signcolumn = "yes:1"
o.cursorline = true

-- Better editing experience
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = "/tmp/"
-- o.directory = "/tmp/"
-- o.undodir = "/tmp/"

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
o.jumpoptions = "view"

-- Stable buffer content on window open/close events.
o.splitkeep = "screen"

-- LF or CRLF
o.fileformats = "unix,dos"

-- C/C++
o.cinoptions = { "Ls", "g0", ":0", "N-s", "E-s", "(s", "m1" }

-- Remove bottom search result count
-- o.shortmess:append("S")

-- Spell Checker
-- o.spell = true
-- o.spelllang = "en_us"
