local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "jiaoshijie/undotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
    config = function()
      require("undotree").setup {
        float_diff = true,
        layout = "left_bottom",
        ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
        window = {
          winblend = 30,
        },
        keymaps = {
          ["j"] = "move_next",
          ["k"] = "move_prev",
          ["J"] = "move_change_next",
          ["K"] = "move_change_prev",
          ["<cr>"] = "action_enter",
          ["p"] = "enter_diffbuf",
          ["q"] = "quit",
        },
      }
    end,
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvimtools/none-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "rcarriga/nvim-dap-ui",
    init = function()
      require("core.utils").load_mappings "dap"
    end,
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          -- NOTE: Check out this for guide
          -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
          local dap = require "dap"
          vim.fn.sign_define(
            "DapBreakpoint",
            { text = "🛑", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
          )

          local dapui = require "dapui"
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end

          -- dap.listeners.before.event_terminated["dapui_config"] = function()
          --   dapui.close()
          -- end

          -- dap.listeners.before.event_exited["dapui_config"] = function()
          --   dapui.close()
          -- end

          -- NOTE: Make sure to install the needed files/exectubles through mason
          require "custom.configs.dap.settings.java-debug"
        end,
      },
    },
    opts = require "custom.configs.dap.ui",
  },
  { "jay-babu/mason-nvim-dap.nvim" },
  { "mfussenegger/nvim-jdtls" },
  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.editor.illuminate" },
    { import = "nvcommunity.lsp.lspsaga" },
  },
}

return plugins
