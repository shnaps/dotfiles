require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

local parsers = {
  "vim", "vimdoc", "lua", "luadoc", "printf", "html", "css",
  "javascript", "java", "typescript", "tsx", "markdown",
  "markdown_inline", "bash", "regex", "python", "typst",
  "rust", "go", "json", "yaml", "toml", "diff", "git_config",
  "gitcommit", "gitignore",
}

-- Install missing parsers (runs async)
local installed = require("nvim-treesitter.config").get_installed()
local to_install = vim.tbl_filter(function(p)
  return not vim.tbl_contains(installed, p)
end, parsers)
if #to_install > 0 then
  require("nvim-treesitter").install(to_install)
end

-- Highlight, folds and indent on filetypes with a listed parser
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang and vim.tbl_contains(parsers, lang) then
      pcall(vim.treesitter.start, args.buf)
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldmethod = "expr"
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- Textobjects
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
  },
})

local select = require("nvim-treesitter-textobjects.select").select_textobject
local map = vim.keymap.set
map({ "x", "o" }, "af", function() select("@function.outer", "textobjects") end, { desc = "Function (outer)" })
map({ "x", "o" }, "if", function() select("@function.inner", "textobjects") end, { desc = "Function (inner)" })
map({ "x", "o" }, "ac", function() select("@class.outer", "textobjects") end, { desc = "Class (outer)" })
map({ "x", "o" }, "ic", function() select("@class.inner", "textobjects") end, { desc = "Class (inner)" })
