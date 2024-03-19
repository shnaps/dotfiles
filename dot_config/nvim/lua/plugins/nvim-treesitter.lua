return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"vim",
			"lua",
			"html",
			"css",
			"javascript",
			"java",
			"typescript",
			"tsx",
			"markdown",
			"markdown_inline",
			"bash",
			"regex",
      "python",
		},

		highlight = {
			enable = true,
			use_languagetree = true,
		},

		indent = { enable = true },
	},
}
