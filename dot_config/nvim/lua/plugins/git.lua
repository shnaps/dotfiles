return {
  -- Git gutter / blame / hunks
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- Hunk navigation
        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Previous hunk")
        map("n", "]c", gs.next_hunk, "Next hunk")
        map("n", "[c", gs.prev_hunk, "Previous hunk")

        -- NvChad gitsigns muscle memory
        map("n", "<leader>ph", gs.preview_hunk, "Preview hunk")
        map({ "n", "v" }, "<leader>rh", "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk")
        map({ "n", "v" }, "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
        map("n", "<leader>td", gs.toggle_deleted, "Toggle deleted")
        map("n", "<leader>hd", gs.diffthis, "Diff this")
      end,
    },
  },

  -- Magit-style git interface (preserved)
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    opts = {
      integrations = {
        fzf_lua = true,
        diffview = true,
      },
    },
    keys = {
      { "<leader>gn", function() require("neogit").open() end, desc = "Neogit" },
      { "<leader>gC", "<cmd>Neogit commit<cr>", desc = "Neogit commit" },
      { "<leader>gP", "<cmd>Neogit pull<cr>", desc = "Neogit pull" },
      { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Neogit push" },
    },
  },
}
