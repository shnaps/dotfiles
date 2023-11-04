local configs = require "plugins.configs.lspconfig"
local servers = require "custom.configs.mason-lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
