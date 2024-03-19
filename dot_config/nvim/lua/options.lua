require("nvchad.options")

-- add yours here!

local api = vim.api

-- highlight yank
local highlight_group = api.nvim_create_augroup("YankHighlight", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
