local map = vim.keymap.set

-- Git gutter / blame / hunks
require("gitsigns").setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
  on_attach = function(buffer)
    local gs = require("gitsigns")
    local bmap = function(mode, l, r, desc)
      map(mode, l, r, { buffer = buffer, desc = desc })
    end

    -- Hunk navigation
    bmap("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
    bmap("n", "[h", function() gs.nav_hunk("prev") end, "Previous hunk")
    bmap("n", "]c", function() gs.nav_hunk("next") end, "Next hunk")
    bmap("n", "[c", function() gs.nav_hunk("prev") end, "Previous hunk")

    -- NvChad gitsigns muscle memory
    bmap("n", "<leader>ph", gs.preview_hunk, "Preview hunk")
    bmap({ "n", "v" }, "<leader>rh", "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk")
    bmap({ "n", "v" }, "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk")
    bmap("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
    bmap("n", "<leader>td", gs.preview_hunk_inline, "Show deleted lines (inline)")
    bmap("n", "<leader>hd", gs.diffthis, "Diff this")
  end,
})

-- Magit-style git interface
require("neogit").setup({
  integrations = {
    fzf_lua = true,
    diffview = true,
  },
})
map("n", "<leader>gn", function() require("neogit").open() end, { desc = "Neogit" })
map("n", "<leader>gC", "<cmd>Neogit commit<cr>", { desc = "Neogit commit" })
map("n", "<leader>gP", "<cmd>Neogit pull<cr>", { desc = "Neogit pull" })
map("n", "<leader>gp", "<cmd>Neogit push<cr>", { desc = "Neogit push" })
