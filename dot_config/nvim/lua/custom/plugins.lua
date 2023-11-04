local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "bash",
        "java",
      },
    },
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
    opts = {
      ensure_installed = {
        "lua-language-server",
        "prettier",
        "stylua",
        "shellcheck",
        "checkstyle",
        "google-java-format",
        "sonarlint-language-server",
        "java-debug-adapter",
      },
    },
  },
  { "williamboman/mason-lspconfig.nvim" },
}

return plugins
