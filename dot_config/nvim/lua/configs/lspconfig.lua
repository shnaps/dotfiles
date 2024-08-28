local configs = require("nvchad.configs.lspconfig")

require("neoconf").setup()

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = require("configs.mason")

configs.defaults()

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
lspconfig.tinymist.setup({
	filetypes = {
		"typst",
	},
	root_dir = function(filename, bufnr)
		-- return "the path to the root directory depending on the filename..."
		return vim.fn.getcwd()
	end,
	single_file_support = true,
	settings = {
		formatterMode = "typstfmt",
	},
})
