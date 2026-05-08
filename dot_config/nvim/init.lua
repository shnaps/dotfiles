-- Leader keys must be set before lazy.nvim is loaded
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")
require("config.lsp")
