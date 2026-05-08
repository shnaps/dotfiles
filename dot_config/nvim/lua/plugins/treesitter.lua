return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- Parsers we want installed
      local parsers = {
        "vim", "vimdoc", "lua", "luadoc", "printf", "html", "css",
        "javascript", "java", "typescript", "tsx", "markdown",
        "markdown_inline", "bash", "regex", "python", "typst",
        "rust", "go", "json", "yaml", "toml", "diff", "git_config",
        "gitcommit", "gitignore",
      }

      -- Install missing parsers
      local installed = require("nvim-treesitter.config").installed_parsers()
      local to_install = vim.tbl_filter(function(p)
        return not vim.tbl_contains(installed, p)
      end, parsers)
      if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
      end

      -- Enable highlight + indent on supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang and vim.tbl_contains(parsers, lang) then
            pcall(vim.treesitter.start)
            -- Folding
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldmethod = "expr"
            -- Indent (experimental in main branch, opt-in)
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  -- Textobjects (also rewritten for the new main branch)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
      })

      local map = vim.keymap.set
      local select = require("nvim-treesitter-textobjects.select").select_textobject

      map({ "x", "o" }, "af", function() select("@function.outer", "textobjects") end, { desc = "Function (outer)" })
      map({ "x", "o" }, "if", function() select("@function.inner", "textobjects") end, { desc = "Function (inner)" })
      map({ "x", "o" }, "ac", function() select("@class.outer", "textobjects") end, { desc = "Class (outer)" })
      map({ "x", "o" }, "ic", function() select("@class.inner", "textobjects") end, { desc = "Class (inner)" })
    end,
  },
}
