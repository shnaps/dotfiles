return {
	"NeogitOrg/neogit",
	cmd = "Neogit",
	dependencies = {
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		-- vim.keymap.set("n", "<leader>gs", neogit.open, { silent = true, noremap = true })
		--
		-- vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { silent = true, noremap = true })
		--
		-- vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { silent = true, noremap = true })
		--
		-- vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", { silent = true, noremap = true })
		--
		-- vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true, noremap = true })
		--
		-- vim.keymap.set("n", "<leader>gB", ":G blame<CR>", { silent = true, noremap = true })
		require("neogit").setup()
		dofile(vim.g.base46_cache .. "git")
		dofile(vim.g.base46_cache .. "neogit")
	end,
}
