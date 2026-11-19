-- Mason installs LSP servers, formatters and DAP adapters
require("mason").setup({
  registries = {
    "github:nvim-java/mason-registry",
    "github:mason-org/mason-registry",
  },
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- Installs these servers and calls vim.lsp.enable() for every installed server.
-- Server configs come from nvim-lspconfig's lsp/ folder plus lua/config/lsp.lua.
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "html",
    "cssls",
    "vtsls",
    "jdtls",
    "clangd",
    "ruff",
    "gopls",
    "tinymist",
  },
  automatic_enable = {
    -- nvim-java enables jdtls itself, after its own setup
    exclude = { "jdtls" },
  },
})

-- Java: nvim-java configures jdtls, then enables it
require("java").setup({
  jdk = { auto_install = false },
})
vim.lsp.enable("jdtls")
