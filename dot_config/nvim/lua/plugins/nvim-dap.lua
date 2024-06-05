-- Debug adapter plug-in. Debug anything in Neovim
return {
	"mfussenegger/nvim-dap",
	keys = {
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "DAP Breakpoint Condition",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "DAP Toggle Breakpoint",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "DAP Continue",
		},
		{
			"<leader>da",
			function()
				require("dap").continue({ before = get_args })
			end,
			desc = "DAP Run with Args",
		},
		{
			"<leader>dC",
			function()
				require("dap").run_to_cursor()
			end,
			desc = "DAP Run to Cursor",
		},
		{
			"<leader>dg",
			function()
				require("dap").goto_()
			end,
			desc = "DAP Go to line (no execute)",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "DAP Step Into",
		},
		{
			"<leader>dj",
			function()
				require("dap").down()
			end,
			desc = "DAP Down",
		},
		{
			"<leader>dk",
			function()
				require("dap").up()
			end,
			desc = "DAP Up",
		},
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
			desc = "DAP Run Last",
		},
		{
			"<leader>do",
			function()
				require("dap").step_out()
			end,
			desc = "DAP Step Out",
		},
		{
			"<leader>dO",
			function()
				require("dap").step_over()
			end,
			desc = "DAP Step Over",
		},
		{
			"<leader>dp",
			function()
				require("dap").pause()
			end,
			desc = "DAP Pause",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.toggle()
			end,
			desc = "DAP Toggle REPL",
		},
		{
			"<leader>dS",
			function()
				require("dap").session()
			end,
			desc = "DAP Session",
		},
		{
			"<leader>dt",
			function()
				require("dap").terminate()
			end,
			desc = "DAP Terminate",
		},
		{
			"<leader>dw",
			function()
				require("dap.ui.widgets").hover()
			end,
			desc = "DAP Widgets",
		},
		{
			"<leader>dz",
			function()
				require("dap").eval()
			end,
			desc = "DAP Eval",
		},
		{
			"<leader>dZ",
			function()
				require("dap").eval(vim.fn.input("expression: "))
			end,
			desc = "DAP Eval expression",
		},
		{
			"<leader>df",
			function()
				require("telescope").extensions.dap.list_breakpoints()
			end,
			desc = "DAP List of breakpoints",
		},
	},
}
