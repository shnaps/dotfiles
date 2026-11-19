-- Plugins are managed by the built-in vim.pack. Versions are pinned in
-- nvim-pack-lock.json next to init.lua. Update with :lua vim.pack.update().

-- Build steps for plugins that ship compiled parts. Must exist before vim.pack.add().
vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("UserPackHooks", { clear = true }),
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    elseif name == "typst-preview.nvim" then
      if not ev.data.active then
        vim.cmd.packadd("typst-preview.nvim")
      end
      require("typst-preview").update()
    end
  end,
})

local function gh(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  -- UI
  gh("folke/tokyonight.nvim"),
  gh("nvim-tree/nvim-web-devicons"),
  gh("nvim-lualine/lualine.nvim"),
  gh("folke/which-key.nvim"),
  gh("brenoprata10/nvim-highlight-colors"),
  gh("folke/snacks.nvim"),

  -- Editor
  gh("windwp/nvim-autopairs"),
  gh("folke/zen-mode.nvim"),
  gh("MunifTanjim/nui.nvim"),
  gh("m4xshen/hardtime.nvim"),
  gh("tris203/precognition.nvim"),
  gh("ibhagwan/fzf-lua"),
  gh("stevearc/conform.nvim"),
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  { src = gh("nvim-treesitter/nvim-treesitter-textobjects"), version = "main" },

  -- LSP
  gh("neovim/nvim-lspconfig"),
  gh("mason-org/mason.nvim"),
  gh("mason-org/mason-lspconfig.nvim"),
  -- nvim-java's README pins spring-boot.nvim to this commit
  { src = gh("JavaHello/spring-boot.nvim"), version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0" },
  gh("nvim-java/nvim-java"),

  -- Git
  gh("lewis6991/gitsigns.nvim"),
  gh("nvim-lua/plenary.nvim"),
  gh("sindrets/diffview.nvim"),
  gh("NeogitOrg/neogit"),

  -- Debug
  gh("mfussenegger/nvim-dap"),
  gh("nvim-neotest/nvim-nio"),
  gh("rcarriga/nvim-dap-ui"),
  gh("theHamsta/nvim-dap-virtual-text"),
  gh("jay-babu/mason-nvim-dap.nvim"),

  -- Writing
  { src = gh("chomosuke/typst-preview.nvim"), version = vim.version.range("1.*") },
}, { confirm = false })

require("plugins.colorscheme")
require("plugins.ui")
require("plugins.editor")
require("plugins.fzf")
require("plugins.treesitter")
require("plugins.formatting")
require("plugins.lsp")
require("plugins.git")
require("plugins.dap")
require("plugins.typst")
