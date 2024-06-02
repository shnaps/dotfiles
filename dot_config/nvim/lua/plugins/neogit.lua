  return{
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup()
      dofile(vim.g.base46_cache .. "git")
      dofile(vim.g.base46_cache .. "neogit")
    end,
  }
