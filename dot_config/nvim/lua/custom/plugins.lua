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
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "jay-babu/mason-nvim-dap.nvim" },
  { "mfussenegger/nvim-jdtls" },
  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.editor.illuminate" },
    { import = "nvcommunity.lsp.lspsaga" },
  },
}

return plugins
