local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = require(configs.mason.servers)

for _, lsp in ipairs(servers) do
	if lsp ~= "jdtls" then
		lspconfig[lsp].setup({
			on_init = on_init,
			on_attach = on_attach,
			capabilities = capabilities,
		})
		-- else
		-- lspconfig.jdtls.setup({})
	end
end
