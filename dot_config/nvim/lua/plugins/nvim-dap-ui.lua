return {
	"rcarriga/nvim-dap-ui",
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "DAP UI" },
  },
	opts = {},
	config = function(_, opts)
		-- setup dap config by VsCode launch.json file
		-- require("dap.ext.vscode").load_launchjs()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup(opts)
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
		end
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		-- dap.listeners.before.event_terminated.dapui_config = function()
		-- 	dapui.close()
		-- end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
