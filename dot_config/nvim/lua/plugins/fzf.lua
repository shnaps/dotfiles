return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      fzf_colors = true,
      winopts = {
        height = 0.85,
        width = 0.85,
        preview = {
          scrollbar = false,
        },
      },
    },
    keys = {
      -- Files & buffers (NvChad: ff, fa, fb, fo, fz)
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<leader>fa", "<cmd>FzfLua files hidden=true no_ignore=true<cr>", desc = "Find all files (hidden)" },
      { "<leader>fF", "<cmd>FzfLua files cwd=~<cr>", desc = "Find files (home)" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
      { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files (alias)" },

      -- Search (NvChad: fw = live grep, fz = current buffer fuzzy)
      { "<leader>fw", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
      { "<leader>fW", "<cmd>FzfLua grep_cword<cr>", desc = "Grep word under cursor" },
      { "<leader>fz", "<cmd>FzfLua blines<cr>", desc = "Find in current buffer" },

      -- Misc (preserved from your previous mappings)
      { "<leader>fC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
      { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
      { "<leader>fd", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace diagnostics" },
      { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Help tags" },
      { "<leader>fn", "<cmd>FzfLua notifications<cr>", desc = "Notifications" },
      { "<leader>ma", "<cmd>FzfLua marks<cr>", desc = "Marks" },

      -- Git (NvChad: cm = commits, gt = status; PR aliases retained)
      { "<leader>cm", "<cmd>FzfLua git_commits<cr>", desc = "Git commits" },
      { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Git commits" },
      { "<leader>gt", "<cmd>FzfLua git_status<cr>", desc = "Git status" },
      { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Git status (alias)" },
      { "<leader>gB", "<cmd>FzfLua git_branches<cr>", desc = "Git branches" },

      -- LSP
      { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document symbols" },
      { "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace symbols" },

      -- Resume last picker
      { "<leader>f.", "<cmd>FzfLua resume<cr>", desc = "Resume picker" },
    },
  },
}
