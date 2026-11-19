local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = augroup("HighlightOnYank", { clear = true }),
  callback = function()
    vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Auto-resize splits when window is resized
autocmd("VimResized", {
  desc = "Auto-resize splits when window is resized",
  group = augroup("VimAutoResize", { clear = true }),
  command = "tabdo wincmd =",
})

-- Trim trailing whitespace on save
autocmd("BufWritePre", {
  desc = "Trim trailing whitespace on save",
  group = augroup("TrimWhitespaceOnSave", { clear = true }),
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[silent! %s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

-- Indent guide every 'shiftwidth' columns
local function set_indent_guide()
  local sw = vim.fn.shiftwidth()
  local lcs = vim.opt_local.listchars:get()
  lcs.leadmultispace = "│" .. string.rep(" ", math.max(sw - 1, 0))
  vim.opt_local.listchars = lcs
end
autocmd({ "BufWinEnter", "FileType" }, {
  desc = "Match indent guides to shiftwidth",
  group = augroup("IndentGuides", { clear = true }),
  callback = set_indent_guide,
})
autocmd("OptionSet", {
  desc = "Match indent guides to shiftwidth",
  group = augroup("IndentGuidesOption", { clear = true }),
  pattern = { "shiftwidth", "tabstop" },
  callback = set_indent_guide,
})

-- Go to last cursor position when reopening a file
autocmd("BufReadPost", {
  desc = "Restore last cursor position",
  group = augroup("RestoreCursor", { clear = true }),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close certain filetypes with q
autocmd("FileType", {
  desc = "Close certain filetypes with q",
  group = augroup("CloseWithQ", { clear = true }),
  pattern = {
    "help", "lspinfo", "man", "qf", "checkhealth", "neotest-output",
    "neotest-summary", "PlenaryTestPopup",
  },
  callback = function(args)
    vim.bo[args.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = args.buf, silent = true })
  end,
})
