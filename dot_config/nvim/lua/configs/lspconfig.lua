local configs = require("nvchad.configs.lspconfig")

require("neoconf").setup()

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = require("configs.mason")

configs.defaults()

local custom_on_attach = function(client, bufnr)
	on_attach(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		require("inlay-hints").on_attach(client, bufnr)
	end
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = custom_on_attach,
		capabilities = capabilities,
	})
end

-- require("lspconfig").jdtls.setup({
-- 	handlers = {
-- 		-- By assigning an empty function, you can remove the notifications
-- 		-- printed to the cmd
-- 		["$/progress"] = function(_, result, ctx) end,
-- 	},
-- })
--
vim.diagnostic.config({
  virtual_text = false,
})
