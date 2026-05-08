return {
  -- Mason: package manager for LSP servers, formatters, linters, DAP adapters
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonLog" },
    build = ":MasonUpdate",
    opts = {
      registries = {
        "github:nvim-java/mason-registry",
        "github:mason-org/mason-registry",
      },
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Mason ↔ lspconfig bridge (v2 auto-enables installed servers via vim.lsp.enable)
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- These get installed by mason and auto-enabled
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "jdtls",
        "clangd",
        "ruff",
        "gopls",
        "tinymist",
      },
      -- v2 default; sets up vim.lsp.enable() for installed servers
      automatic_enable = true,
    },
  },

  -- LSP server configs (provides lsp/*.lua configs that vim.lsp.config picks up)
  {
    "neovim/nvim-lspconfig",
    -- Configuration is in lua/config/lsp.lua + per-server overrides via vim.lsp.config()
  },

  -- neoconf: project-local LSP config
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    opts = {},
  },

  -- TypeScript tools (replaces tsserver with a faster implementation)
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = {
      "typescript", "typescriptreact", "typescript.tsx",
      "javascript", "javascriptreact", "javascript.jsx",
    },
    opts = {},
  },

  -- nvim-java: full Java IDE setup (handles jdtls separately from mason-lspconfig)
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("java").setup({
        jdk = { auto_install = false },
        handlers = {
          ["$/progress"] = function(_, _, _) end,
        },
      })
    end,
  },
}
