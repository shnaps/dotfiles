-- LSP setup using the modern vim.lsp.config API (Nvim 0.11+)
-- Server configs live here; mason-lspconfig auto-enables installed ones.

-- Diagnostic UI
vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN]  = "󰀪 ",
      [vim.diagnostic.severity.INFO]  = "󰋽 ",
      [vim.diagnostic.severity.HINT]  = "󰌶 ",
    },
  },
  virtual_text = {
    source = "if_many",
    spacing = 2,
    prefix = "●",
  },
})

-- Per-server overrides. mason-lspconfig handles enabling installed servers.
-- Servers without an entry here use defaults from nvim-lspconfig's lsp/ folder.
vim.lsp.config("tinymist", {
  filetypes = { "typst" },
  root_markers = { ".git" },
  single_file_support = true,
  settings = {
    formatterMode = "typstyle",
  },
})

-- Attach mappings on LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("grn", vim.lsp.buf.rename, "Rename")
    map("gra", vim.lsp.buf.code_action, "Code action", { "n", "x" })
    map("grr", vim.lsp.buf.references, "References")
    map("gri", vim.lsp.buf.implementation, "Implementation")
    map("grd", vim.lsp.buf.definition, "Definition")
    map("grD", vim.lsp.buf.declaration, "Declaration")
    map("gO", vim.lsp.buf.document_symbol, "Document symbols")
    map("gW", vim.lsp.buf.workspace_symbol, "Workspace symbols")
    map("grt", vim.lsp.buf.type_definition, "Type definition")

    -- Inlay hints toggle
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method("textDocument/inlayHint") then
      map("<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, "Toggle inlay hints")
    end
  end,
})
