return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
			renderer = {
				highlight_git = true,
				icons = { show = { git = true } },
			},
		},
	},
}
