require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("v", ">", ">gv", { desc = "Indent line" })

map("n", "<Up>", "<Nop>", { desc = "Disable Up arrow" })
map("n", "<Down>", "<Nop>", { desc = "Disable Down arrow" })
map("n", "<Left>", "<Nop>", { desc = "Disable Left arrow" })
map("n", "<Right>", "<Nop>", { desc = "Disable Right arrow" })

map("n", "<leader>la", "<cmd>LspUI code_action<cr>", { desc = "LspUI code_action" })
map("n", "<leader>lc", "<cmd>LspUI declaration<cr>", { desc = "LspUI declaration" })
map("n", "<leader>ld", "<cmd>LspUI definition<cr>", { desc = "LspUI definition" })
map("n", "<leader>le", "<cmd>LspUI diagnostic<cr>", { desc = "LspUI diagnostic" })
map("n", "<leader>lh", "<cmd>LspUI hover<cr>", { desc = "LspUI hover" })
map("n", "<leader>li", "<cmd>LspUI implementation<cr>", { desc = "LspUI implementation" })
map("n", "<leader>ln", "<cmd>LspUI rename<cr>", { desc = "LspUI rename" })
map("n", "<leader>lr", "<cmd>LspUI reference<cr>", { desc = "LspUI reference" })
map("n", "<leader>lt", "<cmd>LspUI type_definition<cr>", { desc = "LspUI type_definition" })

vim.keymap.set('c', '<S-Enter>', function() require("noice").redirect(vim.fn.getcmdline()) end,
    { desc = 'Redirect Cmdline' })
vim.keymap.set('n', '<leader>snl', function() require("noice").cmd("last") end, { desc = "Noice Last Message" })
vim.keymap.set('n', '<leader>snh', function() require("noice").cmd("history") end, { desc = "Noice History" })
vim.keymap.set('n', '<leader>sna', function() require("noice").cmd("all") end, { desc = "Noice All" })
vim.keymap.set('n', '<leader>snd', function() require("noice").cmd("dismiss") end, { desc = "Dismiss All" })
