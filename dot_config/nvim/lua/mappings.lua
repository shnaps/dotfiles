require("nvchad.mappings")
local utils = require("configs.utils")
local neogit = require("neogit")
local hardtime = require("hardtime")
-- add yours here
local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "general escape insert mode" })
map("v", ">", ">gv", { desc = "general Indent line" })

map("c", "<S-Enter>", function()
	require("noice").redirect(vim.fn.getcmdline())
end, { desc = "noice Redirect cmdline" })
map("n", "<leader>gl", function()
	require("noice").cmd("last")
end, { desc = "noice Last message" })
map("n", "<leader>gh", function()
	require("noice").cmd("history")
end, { desc = "noice History" })
map("n", "<leader>ga", function()
	require("noice").cmd("all")
end, { desc = "noice All" })
map("n", "<leader>gd", function()
	require("noice").cmd("dismiss")
end, { desc = "noice Dismiss all" })

map("n", "<leader>gg", function()
	utils.go_to_github_link()
end, { desc = "general go to GitHub link generated from string" })

map("n", "<leader>gn", neogit.open, { desc = "general open neogit" })
map("n", "<leader>tg", hardtime.toggle, { desc = "general toggle hardtime" })

map(
	"n",
	"<leader>fn",
	"<cmd>lua require('telescope').extensions.notify.notify()<cr>",
	{ desc = "telescope notify history", silent = true }
)
map("n", "<leader>fC", "<cmd>Telescope commands<cr>", { desc = "telescope commands", silent = true })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "telescope keymaps", silent = true })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "telescope diagnostics", silent = true })
