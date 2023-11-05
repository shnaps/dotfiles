local M = {}

local keymap = vim.keymap.set
local utils = require "core.utils"

local cmp_nvim_lsp = require "cmp_nvim_lsp"

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "bash",
    "java",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "prettier",
    "stylua",
    "shellcheck",
    -- "checkstyle",
    "google-java-format",
    "sonarlint-language-server",
    "java-debug-adapter",
    "clang-format",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = false,
    icons = {
      show = {
        git = true,
      },
    },
  },
}


-- This part down to the bottom of the file is copypaste which I don't understand :(
M.capabilities = cmp_nvim_lsp.default_capabilities()

local function lsp_keymaps(bufnr)
  local buf_opts = { buffer = bufnr, silent = true }
  -- keymap("n", "gD", vim.lsp.buf.declaration, buf_opts)
  keymap("n", "gD", "<cmd>Lspsaga finder<cr>", buf_opts)
  keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", buf_opts)
  -- keymap("n", "gd", vim.lsp.buf.definition, buf_opts)
  keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", buf_opts)
  keymap("n", "gc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", buf_opts)
  keymap("n", "gp", "<cmd>Lspsaga peek_definition<cr>", buf_opts)
  -- keymap("n", "K", vim.lsp.buf.hover, buf_opts)
  keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", buf_opts)
  keymap("n", "gi", "<cmd>Telescope lsp_implementations<cr>", buf_opts)
end

-- Highlight symbol under cursor
local function lsp_highlight(client, bufnr)
  if client.supports_method "textDocument/documentHighlight" then
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })
    vim.api.nvim_clear_autocmds {
      buffer = bufnr,
      group = "lsp_document_highlight",
    }
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight(client, bufnr)
  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  if client.name == "jdtls" then
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
    require("jdtls").setup.add_commands()
    -- Auto-detect main and setup dap config
    require("jdtls.dap").setup_dap_main_class_configs()
    map_java_keys(bufnr)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

return M
