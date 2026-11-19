local map = vim.keymap.set

-- Autopairs. <CR> is mapped in config/completion.lua so it can also accept completions.
require("nvim-autopairs").setup({
  fast_wrap = {},
  map_cr = false,
  disable_filetype = { "vim" },
})

-- Distraction-free writing
require("zen-mode").setup({})
map("n", "<leader>uz", "<cmd>ZenMode<cr>", { desc = "Zen mode" })

-- Undo history visualizer (built-in optional plugin)
vim.cmd.packadd("nvim.undotree")
map("n", "<leader>tu", "<cmd>Undotree<cr>", { desc = "Toggle undo tree" })

-- Vim training wheels
require("hardtime").setup({
  disable_mouse = false,
  disabled_filetypes = {
    "checkhealth", "dapui*", "Diffview*", "help", "lspinfo", "Neogit*",
    "mason", "netrw", "qf", "undotree", "snacks_*", "pager", "cmd", "msg",
  },
})
map("n", "<leader>tg", function() require("hardtime").toggle() end, { desc = "Toggle hardtime" })

-- Movement hints
require("precognition").setup({})
map("n", "<leader>up", "<cmd>Precognition toggle<cr>", { desc = "Toggle precognition" })

-- Snacks: dashboard, explorer, terminal
require("snacks").setup({
  bigfile = { enabled = true },
  explorer = { enabled = true },
  quickfile = { enabled = true },
  statuscolumn = { enabled = true },
  terminal = { enabled = true },

  -- NvDash-style start screen
  dashboard = {
    enabled = true,
    preset = {
      header = [[

      ████ ██████           █████      ██
     ███████████             █████
     █████████ ███████████████████ ███   ███████████
    █████████  ███    █████████████ █████ ██████████████
   █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████
        ]],
      keys = {
        { icon = " ", key = "f", desc = "Find file",       action = ":FzfLua files" },
        { icon = " ", key = "n", desc = "New file",        action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find text",       action = ":FzfLua live_grep" },
        { icon = " ", key = "r", desc = "Recent files",    action = ":FzfLua oldfiles" },
        { icon = " ", key = "c", desc = "Config",          action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })" },
        { icon = " ", key = "s", desc = "Restore session", section = "session" },
        { icon = "󰒲 ", key = "u", desc = "Update plugins",  action = ":lua vim.pack.update()" },
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
})

-- Explorer (NvChad: <C-n> toggle, <leader>e focus)
map("n", "<C-n>", function() Snacks.explorer() end, { desc = "Toggle file explorer" })
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "File explorer (snacks)" })
map("n", "<leader>E", function() Snacks.explorer.reveal() end, { desc = "Reveal current file" })

-- Terminals (NvChad-style: float toggle on <A-i>, splits on <A-h>/<A-v>)
map({ "n", "t" }, "<A-i>", function() Snacks.terminal.toggle(nil, { win = { position = "float" } }) end, { desc = "Toggle floating terminal" })
map({ "n", "t" }, "<A-h>", function() Snacks.terminal.toggle(nil, { win = { position = "bottom" } }) end, { desc = "Toggle horizontal terminal" })
map({ "n", "t" }, "<A-v>", function() Snacks.terminal.toggle(nil, { win = { position = "right" } }) end, { desc = "Toggle vertical terminal" })
map("n", "<leader>tt", function() Snacks.terminal() end, { desc = "New terminal" })
