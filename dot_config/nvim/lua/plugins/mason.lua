return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"lua-language-server",
			"prettier",
			"stylua",
			"google-java-format",
			"java-debug-adapter",
			"clang-format",
		},
	},
}
