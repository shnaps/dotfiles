return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	cmd = "Telescope",
	opts = function()
		local conf = require("nvchad.configs.telescope")
		conf.extensions_list = { "themes", "terms", "dap" }
		return conf
	end,
	config = function(_, opts)
		dofile(vim.g.base46_cache .. "telescope")
		local telescope = require("telescope")
		telescope.setup(opts)

		-- load extensions
		for _, ext in ipairs(opts.extensions_list) do
			telescope.load_extension(ext)
		end
	end,
}
