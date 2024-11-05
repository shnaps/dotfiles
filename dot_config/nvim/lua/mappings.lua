require("nvchad.mappings")
local utils = require("configs.utils")
local neogit = require("neogit")
local hardtime = require("hardtime")
-- add yours here
local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "General Escape insert mode" })
map("v", ">", ">gv", { desc = "General Indent line" })

map("c", "<S-Enter>", function()
	require("noice").redirect(vim.fn.getcmdline())
end, { desc = "Noice Redirect cmdline" })
map("n", "<leader>gl", function()
	require("noice").cmd("last")
end, { desc = "Noice Last message" })
map("n", "<leader>gh", function()
	require("noice").cmd("history")
end, { desc = "Noice History" })
map("n", "<leader>ga", function()
	require("noice").cmd("all")
end, { desc = "Noice All" })
map("n", "<leader>gd", function()
	require("noice").cmd("dismiss")
end, { desc = "Noice Dismiss all" })

map("n", "<leader>gg", function()
	utils.go_to_github_link()
end, { desc = "Go to GitHub link generated from string" })

map("n", "<leader>gn", neogit.open, { desc = "General Open neogit" })
map("n", "<leader>tg", hardtime.toggle, { desc = "General toggle hardtime" })

map(
	"n",
	"<leader>fn",
	"<cmd>lua require('telescope').extensions.notify.notify()<cr>",
	{ desc = "telescope notify history", silent = true }
)
map("n", "<leader>fC", "<cmd>Telescope commands<cr>", { desc = "telescope commands", silent = true })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "telescope keymaps", silent = true })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "telescope diagnostics", silent = true })
