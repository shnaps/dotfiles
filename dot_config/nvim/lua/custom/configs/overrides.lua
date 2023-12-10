local M = {}

local utils = require "core.utils"

local cmp_nvim_lsp = require "cmp_nvim_lsp"

-- This part down to the bottom of the file is copypaste which I don't understand :(
M.capabilities = cmp_nvim_lsp.default_capabilities()
M.on_attach = function(client, bufnr)
  -- lsp_keymaps(bufnr)
  -- lsp_highlight(client, bufnr)
  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  if client.name == "jdtls" then
    require("jdtls").setup_dap { hotcodereplace = "auto" }
    require("jdtls").setup.add_commands()
    -- Auto-detect main and setup dap config
    require("jdtls.dap").setup_dap_main_class_configs()
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

return M
