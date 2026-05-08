local map = vim.keymap.set

-- General
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("v", ">", ">gv", { desc = "Indent line and reselect" })
map("v", "<", "<gv", { desc = "Outdent line and reselect" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window: left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window: down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window: up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window: right" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Save/quit shortcuts
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save buffer" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit window" })

-- Buffer navigation (replacing nvchad's tabufline)
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Diagnostic navigation
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- Terminal mode: double-tap Esc to leave terminal mode (single Esc passes through to TUIs)
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Custom utility: open GitHub link from string under cursor
local utils = require("config.utils")
map("n", "<leader>gg", utils.go_to_github_link, { desc = "Open GitHub link from string under cursor" })

-- Note: Plugin-specific keymaps live in each plugin's spec under lua/plugins/
-- (telescope -> fzf-lua, neogit, noice, dap, trouble, hardtime, etc.)
