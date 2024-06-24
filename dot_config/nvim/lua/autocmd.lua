local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- autocmd("FileType", {
-- 	desc = "Workaround for NvCheatsheet's zindex being higher than Mason's.",
-- 	pattern = "nvcheatsheet",
-- 	group = augroup("FixCheatsheetZindex", { clear = true }),
-- 	callback = function()
-- 		vim.api.nvim_win_set_config(0, { zindex = 44 })
-- 	end,
-- })

autocmd("VimResized", {
	desc = "Auto resize panes when resizing nvim window.",
	pattern = "*",
	group = augroup("VimAutoResize", { clear = true }),
	command = [[ tabdo wincmd = ]],
})

autocmd("VimLeavePre", {
	desc = "Close NvimTree before quitting nvim.",
	pattern = "*",
	group = augroup("NvimTreeCloseOnExit", { clear = true }),
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			vim.api.nvim_buf_delete(0, { force = true })
		end
	end,
})

autocmd("TextYankPost", {
	desc = "Highlight on yank.",
	group = augroup("HighlightOnYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "YankVisual", timeout = 200, on_visual = true })
	end,
})

autocmd("ModeChanged", {
	desc = "Strategically disable diagnostics to focus on editing tasks.",
	pattern = { "n:i", "n:v", "i:v" },
	group = augroup("UserDiagnostic", { clear = true }),
	callback = function()
		vim.diagnostic.enable(false)
	end,
})

autocmd("ModeChanged", {
	desc = "Enable diagnostics upon exiting insert mode to resume feedback.",
	pattern = "i:n",
	group = augroup("UserDiagnostic", { clear = true }),
	callback = function()
		vim.diagnostic.enable(true)
	end,
})

autocmd("BufWritePre", {
	desc = "Remove trailing whitespaces on save.",
	group = augroup("TrimWhitespaceOnSave", { clear = true }),
	command = [[ %s/\s\+$//e ]],
})
