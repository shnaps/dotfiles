local servers = require "custom.configs.mason-lspconfig"
local configs = require "plugins.configs.lspconfig"

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local on_attach = configs.on_attach
local capabilities = configs.capabilities

for _, lsp in ipairs(servers) do
  if lsp ~= "jdtls" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
