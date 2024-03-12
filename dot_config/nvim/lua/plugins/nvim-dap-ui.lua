return { "jay-babu/mason-nvim-dap.nvim" },
  {
    "rcarriga/nvim-dap-ui",
    init = function()
      -- require("core.utils").load_mappings "dap"
    end,
    dependencies = {
      {
        "mfussenegger/nvim-dap",
      },
    },
    config = function()
      require("dapui").setup()
    end,
  }
