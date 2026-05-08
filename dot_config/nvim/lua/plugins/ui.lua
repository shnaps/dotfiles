return {
  -- Icons (dependency for many UI plugins)
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Statusline + tabline (buffer tabs at top, NvChad tabufline replacement)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight",
        globalstatus = true,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "snacks_dashboard" },
          winbar = {},
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            mode = 2, -- buffer name + index
            symbols = {
              modified = " ●",
              alternate_file = "",
              directory = "",
            },
          },
        },
        lualine_z = { "tabs" },
      },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help", "alpha", "dashboard", "neo-tree", "Trouble", "trouble",
          "lazy", "mason", "notify", "toggleterm", "lazyterm",
        },
      },
    },
  },

  -- Better vim.ui.input / vim.ui.select
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Inline color preview (NvChad colorify replacement)
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      render = "virtual", -- "background" | "foreground" | "virtual"
      virtual_symbol = "󱓻",
      virtual_symbol_position = "inline",
      enable_named_colors = true,
      enable_tailwind = true,
    },
  },

  -- Nicer cmdline / messages / notifications (preserved from your config)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = { enabled = false },
        signature = { enabled = false },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect cmdline" },
      -- NvChad muscle memory: noice under <leader>g*
      { "<leader>gl", function() require("noice").cmd("last") end, desc = "Noice last message" },
      { "<leader>gh", function() require("noice").cmd("history") end, desc = "Noice history" },
      { "<leader>ga", function() require("noice").cmd("all") end, desc = "Noice all" },
      { "<leader>gd", function() require("noice").cmd("dismiss") end, desc = "Noice dismiss all" },
    },
  },

  -- Keymap discovery / cheatsheet
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      -- Group labels for leader prefixes (cheatsheet reads cleanly)
      spec = {
        { "<leader>c", group = "code" },
        { "<leader>d", group = "debug" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git/noice" },
        { "<leader>q", group = "trouble" },
        { "<leader>t", group = "toggle" },
        { "<leader>u", group = "ui" },
      },
    },
    keys = {
      -- Buffer-local keymaps (the "what can I press here" view)
      { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer keymaps" },
      -- Full cheatsheet (NvCheatsheet replacement, NvChad shortcut <leader>ch)
      { "<leader>ch", function() require("which-key").show({ global = true }) end, desc = "Cheatsheet (all keymaps)" },
      { "<leader>wK", function() require("which-key").show({ global = true }) end, desc = "WhichKey all keymaps" },
    },
  },
}
