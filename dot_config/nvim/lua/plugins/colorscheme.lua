require("tokyonight").setup({
  style = "night",
  light_style = "day",
  transparent = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
  },
})
vim.cmd.colorscheme("tokyonight")

local function toggle_background()
  vim.o.background = (vim.o.background == "dark") and "light" or "dark"
end

-- NvChad <leader>th was a theme picker. Here it toggles light/dark.
vim.keymap.set("n", "<leader>th", toggle_background, { desc = "Toggle theme (light/dark)" })
vim.keymap.set("n", "<leader>uT", toggle_background, { desc = "Toggle theme (light/dark)" })
