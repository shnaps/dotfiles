local servers = { "html", "jdtls", "cssls", "clangd", "ltex" }

require("mason").setup()
require("mason-nvim-dap").setup {
  ensure_installed = { "javadbg", "javatest" },
}
require("mason-lspconfig").setup {
  ensure_installed = servers,
  automatic_installation = true,
}

return servers
