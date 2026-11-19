local opt = vim.opt
local g = vim.g

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.showmode = false -- statusline shows it
opt.splitbelow = true
opt.splitright = true
opt.laststatus = 3 -- global statusline
opt.cmdheight = 1
opt.pumheight = 10
opt.fillchars = { eob = " " }

-- Indent guides from 'listchars' (replaces indent-blankline).
-- config/autocmds.lua resizes the guide to each buffer's 'shiftwidth'.
opt.list = true
opt.listchars = { tab = "│ ", leadmultispace = "│ ", trail = "·", nbsp = "␣" }

-- Behavior
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 400
opt.confirm = true

-- Project-local config from .nvim.lua (replaces neoconf). Nvim asks before trusting a file.
opt.exrc = true

-- Folding (treesitter-based, set up in plugin config)
opt.foldlevel = 99
opt.foldlevelstart = 99

-- Disable some default providers we don't use
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
