local configs = require("nvchad.configs.lspconfig")

require("neoconf").setup()
require("java").setup({
	jdk = {
		auto_install = false,
	},
	handlers = {
		-- By assigning an empty function, you can remove the notifications
		-- printed to the cmd
		["$/progress"] = function(_, result, ctx) end,
	},
})

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

local servers = {
	html = {},
	jdtls = {},
	cssls = {},
	clangd = {},
	ruff = {},
	gopls = {},
	tinymist = {
		filetypes = {
			"typst",
		},
		root_dir = function(filename, bufnr)
			return vim.fn.getcwd()
		end,
		single_file_support = true,
		settings = {
			formatterMode = "typstyle",
		},
	},
}

configs.defaults()

for name, opts in pairs(servers) do
	opts.on_init = on_init
	opts.on_attach = on_attach
	opts.capabilities = capabilities

	lspconfig[name].setup(opts)
end
