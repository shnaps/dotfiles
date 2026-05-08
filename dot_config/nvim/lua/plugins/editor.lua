return {
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },

  -- Highlight other instances of word under cursor
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        providers = { "lsp", "treesitter", "regex" },
        delay = 100,
      })
    end,
  },

  -- Distraction-free writing
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Zen mode" },
    },
    opts = {},
  },

  -- Undo history visualizer (replaces telescope-undo)
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeFocus" },
    keys = {
      { "<leader>tu", "<cmd>UndotreeToggle<cr>", desc = "Toggle undo tree" },
    },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  -- Vim training wheels (kept from your config)
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    opts = {
      disable_mouse = false,
      disabled_filetypes = {
        "NvimTree", "TelescopePrompt", "alpha", "checkhealth", "dapui*",
        "Diffview*", "Dressing*", "help", "lazy", "lspinfo", "Neogit*",
        "mason", "minifiles", "neo%-tree*", "netrw", "noice", "notify",
        "qf", "oil", "trouble", "Trouble", "dashboard", "snacks_*",
      },
    },
    keys = {
      { "<leader>uh", function() require("hardtime").toggle() end, desc = "Toggle hardtime" },
    },
  },

  -- Movement hints
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>up", "<cmd>Precognition toggle<cr>", desc = "Toggle precognition" },
    },
  },

  -- Snacks: provides dashboard, explorer, terminal, and more
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = false }, -- using indent-blankline
      input = { enabled = false }, -- using dressing
      notifier = { enabled = false }, -- using noice/nvim-notify
      quickfile = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      terminal = { enabled = true },
      words = { enabled = false }, -- using illuminate

      -- NvDash-style start screen
      dashboard = {
        enabled = true,
        preset = {
          -- Header: a faux NvChad-flavored ASCII logo
          header = [[
                                                           
      ████ ██████           █████      ██                  
     ███████████             █████                          
     █████████ ███████████████████ ███   ███████████       
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████   
██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
          -- Quick actions (the NvDash-style shortcuts)
          keys = {
            { icon = " ", key = "f", desc = "Find file",       action = ":FzfLua files" },
            { icon = " ", key = "n", desc = "New file",        action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find text",       action = ":FzfLua live_grep" },
            { icon = " ", key = "r", desc = "Recent files",    action = ":FzfLua oldfiles" },
            { icon = " ", key = "c", desc = "Config",          action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })" },
            { icon = " ", key = "s", desc = "Restore session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy",            action = ":Lazy",  enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "m", desc = "Mason",           action = ":Mason" },
            { icon = " ", key = "q", desc = "Quit",            action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
    keys = {
      -- Explorer
      { "<leader>e", function() Snacks.explorer() end, desc = "File explorer (snacks)" },
      { "<leader>E", function() Snacks.explorer.reveal() end, desc = "Reveal current file" },

      -- Terminals (NvChad-style: float toggle on <A-i>, splits on <A-h>/<A-v>)
      { "<A-i>", function() Snacks.terminal.toggle(nil, { win = { position = "float" } }) end, mode = { "n", "t" }, desc = "Toggle floating terminal" },
      { "<A-h>", function() Snacks.terminal.toggle(nil, { win = { position = "bottom" } }) end, mode = { "n", "t" }, desc = "Toggle horizontal terminal" },
      { "<A-v>", function() Snacks.terminal.toggle(nil, { win = { position = "right" } }) end, mode = { "n", "t" }, desc = "Toggle vertical terminal" },
      { "<leader>tt", function() Snacks.terminal() end, desc = "New terminal" },
    },
  },
}
