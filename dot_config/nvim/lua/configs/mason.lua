local servers = { "html", "jdtls", "cssls", "clangd", "ltex", "ruff_lsp" }

require("mason").setup()
require("mason-nvim-dap").setup({
	ensure_installed = { "javadbg", "javatest", "python" },
})
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

return servers
