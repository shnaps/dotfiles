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

map("c", "<S-Enter>", function()
	require("noice").redirect(vim.fn.getcmdline())
end, { desc = "Redirect Cmdline" })
map("n", "<leader>snl", function()
	require("noice").cmd("last")
end, { desc = "Noice Last Message" })
map("n", "<leader>snh", function()
	require("noice").cmd("history")
end, { desc = "Noice History" })
map("n", "<leader>sna", function()
	require("noice").cmd("all")
end, { desc = "Noice All" })
map("n", "<leader>snd", function()
	require("noice").cmd("dismiss")
end, { desc = "Dismiss All" })
