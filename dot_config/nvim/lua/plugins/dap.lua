return {
  -- Debug adapter protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
    },
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "DAP Breakpoint condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP Toggle breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "DAP Continue" },
      { "<leader>da", function() require("dap").continue({ before = function() return vim.split(vim.fn.input("Args: "), " ") end }) end, desc = "DAP Run with args" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "DAP Run to cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "DAP Go to line (no execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "DAP Step into" },
      { "<leader>dj", function() require("dap").down() end, desc = "DAP Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "DAP Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "DAP Run last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "DAP Step out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "DAP Step over" },
      { "<leader>dp", function() require("dap").pause() end, desc = "DAP Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "DAP Toggle REPL" },
      { "<leader>dS", function() require("dap").session() end, desc = "DAP Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "DAP Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "DAP Widgets" },
      { "<leader>dz", function() require("dap").eval() end, desc = "DAP Eval" },
      { "<leader>dZ", function() require("dap").eval(vim.fn.input("Expression: ")) end, desc = "DAP Eval expression" },
      -- Breakpoint list via fzf-lua (replaces telescope-dap)
      { "<leader>df", "<cmd>FzfLua dap_breakpoints<cr>", desc = "DAP List breakpoints" },
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "DAP UI" },
      { "<leader>de", function() require("dapui").eval() end, mode = { "n", "v" }, desc = "DAP Eval" },
    },
    opts = {},
    config = function(_, opts)
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({}) end
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },

  -- Auto-install DAP adapters via mason
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-dap" },
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      automatic_installation = true,
      handlers = {},
    },
  },
}
