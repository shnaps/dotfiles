if vim.fn.has("nvim-0.12") == 0 then
  vim.api.nvim_echo({ { "This config needs Neovim 0.12+ (vim.pack, ui2, autocomplete).", "ErrorMsg" } }, true, {})
  return
end

vim.loader.enable()

-- Leader keys must be set before any plugin keymaps are defined
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Built-in messages + cmdline UI (replaces noice.nvim and nvim-notify)
require("vim._core.ui2").enable({})

require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.lsp")
require("config.completion")
require("plugins")
