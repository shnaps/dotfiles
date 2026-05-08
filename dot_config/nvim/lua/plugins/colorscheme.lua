return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      light_style = "day",
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
    keys = {
      {
        "<leader>uT",
        function()
          local current = vim.o.background
          vim.o.background = (current == "dark") and "light" or "dark"
        end,
        desc = "Toggle theme (light/dark)",
      },
    },
  },
}
