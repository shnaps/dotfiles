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
      -- Files & buffers
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<leader>fF", "<cmd>FzfLua files cwd=~<cr>", desc = "Find files (home)" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },

      -- Search
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
      { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep word under cursor" },
      { "<leader>fl", "<cmd>FzfLua blines<cr>", desc = "Buffer lines" },

      -- Misc (replacing your old telescope mappings)
      { "<leader>fC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
      { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
      { "<leader>fd", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace diagnostics" },
      { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Help tags" },
      { "<leader>fn", "<cmd>FzfLua notifications<cr>", desc = "Notifications" },

      -- Git
      { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Git commits" },
      { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Git branches" },
      { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Git status" },

      -- LSP
      { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document symbols" },
      { "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace symbols" },

      -- Resume last picker
      { "<leader>f.", "<cmd>FzfLua resume<cr>", desc = "Resume picker" },
    },
  },
}
