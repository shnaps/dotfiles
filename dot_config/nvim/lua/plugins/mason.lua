return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"lua-language-server",
			"prettier",
			"stylua",
			"google-java-format",
			"sonarlint-language-server",
			"java-debug-adapter",
			"clang-format",
		},
	},
}
