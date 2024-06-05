return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>qx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Trouble Diagnostics toggle",
		},
		{
			"<leader>qX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Trouble Buffer diagnostics toggle",
		},
		{
			"<leader>qs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Trouble Symbols",
		},
		{
			"<leader>ql",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "Trouble LSP Toggle right side",
		},
		{
			"<leader>qL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Trouble Location List",
		},
		{
			"<leader>qQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Trouble Quickfix List",
		},
	},
}
