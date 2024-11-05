return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"vim",
			"vimdoc",
			"lua",
			"luadoc",
			"printf",
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
			"typst",
			"rust",
			"go",
		},

		highlight = {
			enable = true,
			use_languagetree = true,
		},

		indent = { enable = true },
	},
}
