require("nvchad.mappings")
local utils = require("configs.utils")
local neogit = require("neogit")
local hardtime = require("hardtime")
-- add yours here

local map = vim.keymap.set

map("n", "<leader>i", function()
	-- If we find a floating window, close it.
	local found_float = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative ~= "" then
			vim.api.nvim_win_close(win, true)
			found_float = true
		end
	end

	if found_float then
		return
	end

	vim.diagnostic.open_float(nil, { focus = false, scope = "cursor", border = "rounded" })
end, { desc = "General Toggle floating diagnostics" })

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
map("n", "<leader>tv", hardtime.toggle, { desc = "General toggle hardtime" })
