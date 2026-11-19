local map = vim.keymap.set

-- General (preserved from your previous config)
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("v", ">", ">gv", { desc = "Indent line and reselect" })
map("v", "<", "<gv", { desc = "Outdent line and reselect" })

-- NvChad insert-mode movement
map("i", "<C-b>", "<ESC>^i", { desc = "Move to beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window: left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window: down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window: up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window: right" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- File ops (NvChad: <C-s> save, <C-c> copy whole file)
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<C-c>", "<cmd>%y+<cr>", { desc = "Copy whole file" })

-- Buffer navigation (NvChad: <tab>/<S-tab> + <leader>b new + <leader>x close)
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>b", "<cmd>enew<cr>", { desc = "New buffer" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Toggles (NvChad)
map("n", "<leader>n", "<cmd>set nu!<cr>", { desc = "Toggle line numbers" })
map("n", "<leader>rn", "<cmd>set rnu!<cr>", { desc = "Toggle relative line numbers" })

-- Comment (NvChad <leader>/ → builtin gcc/gc on Nvim 0.10+)
map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Diagnostics
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "Diagnostic loclist" })

-- Lists (replaces trouble.nvim with the built-in quickfix and location lists)
map("n", "<leader>qx", vim.diagnostic.setqflist, { desc = "Diagnostics (quickfix)" })
map("n", "<leader>qX", vim.diagnostic.setloclist, { desc = "Buffer diagnostics (loclist)" })
map("n", "<leader>qs", vim.lsp.buf.document_symbol, { desc = "Symbols (loclist)" })
map("n", "<leader>ql", vim.lsp.buf.references, { desc = "LSP references (quickfix)" })
map("n", "<leader>qL", function()
  vim.cmd(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and "lclose" or "lopen")
end, { desc = "Toggle location list" })
map("n", "<leader>qQ", function()
  vim.cmd(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and "cclose" or "copen")
end, { desc = "Toggle quickfix list" })

-- Terminal mode: NvChad <C-x> + double-Esc fallback
map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- GitHub link util (preserved from your previous config)
local utils = require("config.utils")
map("n", "<leader>gg", utils.go_to_github_link, { desc = "Open GitHub link from string under cursor" })

-- Note: plugin-specific keymaps live in each plugin's spec under lua/plugins/
