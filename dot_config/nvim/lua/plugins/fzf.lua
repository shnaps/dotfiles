require("fzf-lua").setup({
  fzf_colors = true,
  winopts = {
    height = 0.85,
    width = 0.85,
    preview = {
      scrollbar = false,
    },
  },
})

local function map(lhs, cmd, desc)
  vim.keymap.set("n", lhs, "<cmd>FzfLua " .. cmd .. "<cr>", { desc = desc })
end

-- Files & buffers (NvChad: ff, fa, fb, fo, fz)
map("<leader>ff", "files", "Find files")
map("<leader>fa", "files hidden=true no_ignore=true", "Find all files (hidden)")
map("<leader>fF", "files cwd=~", "Find files (home)")
map("<leader>fb", "buffers", "Find buffers")
map("<leader>fo", "oldfiles", "Recent files")
map("<leader>fr", "oldfiles", "Recent files (alias)")

-- Search (NvChad: fw = live grep, fz = current buffer fuzzy)
map("<leader>fw", "live_grep", "Live grep")
map("<leader>fW", "grep_cword", "Grep word under cursor")
map("<leader>fz", "blines", "Find in current buffer")

-- Misc
map("<leader>fC", "commands", "Commands")
map("<leader>fk", "keymaps", "Keymaps")
map("<leader>fd", "diagnostics_workspace", "Workspace diagnostics")
map("<leader>fh", "helptags", "Help tags")
map("<leader>ma", "marks", "Marks")

-- Git (NvChad: cm = commits, gt = status)
map("<leader>cm", "git_commits", "Git commits")
map("<leader>gc", "git_commits", "Git commits")
map("<leader>gt", "git_status", "Git status")
map("<leader>gs", "git_status", "Git status (alias)")
map("<leader>gB", "git_branches", "Git branches")

-- LSP
map("<leader>fs", "lsp_document_symbols", "Document symbols")
map("<leader>fS", "lsp_workspace_symbols", "Workspace symbols")

-- Resume last picker
map("<leader>f.", "resume", "Resume picker")
