local map = vim.keymap.set

-- Statusline + buffer tabline (NvChad tabufline replacement)
require("lualine").setup({
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
})

-- Inline color preview (NvChad colorify replacement)
require("nvim-highlight-colors").setup({
  render = "virtual",
  virtual_symbol = "󱓻",
  virtual_symbol_position = "inline",
  enable_named_colors = true,
  enable_tailwind = true,
})

-- Message history. ui2 opens :messages in its pager window.
map("n", "<leader>gh", "<cmd>messages<cr>", { desc = "Message history" })
map("n", "<leader>gd", "<cmd>messages clear<cr>", { desc = "Clear messages" })

-- Keymap discovery / cheatsheet
local wk = require("which-key")
wk.setup({
  preset = "modern",
  spec = {
    { "<leader>c", group = "code" },
    { "<leader>d", group = "debug" },
    { "<leader>f", group = "find" },
    { "<leader>g", group = "git" },
    { "<leader>q", group = "lists" },
    { "<leader>t", group = "toggle" },
    { "<leader>u", group = "ui" },
  },
})
map("n", "<leader>?", function() wk.show({ global = false }) end, { desc = "Buffer keymaps" })
map("n", "<leader>ch", function() wk.show({ global = true }) end, { desc = "Cheatsheet (all keymaps)" })
map("n", "<leader>wK", function() wk.show({ global = true }) end, { desc = "WhichKey all keymaps" })
