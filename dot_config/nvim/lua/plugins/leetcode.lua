local leet_arg = "leetcode.nvim"

return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	cmd = "Leet",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = leet_arg ~= vim.fn.argv()[1],
	opts = {
		arg = leet_arg,
		lang = "java",
	},
}
