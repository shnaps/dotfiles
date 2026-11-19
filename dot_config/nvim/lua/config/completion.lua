-- Built-in completion (replaces blink.cmp).
-- Non-LSP buffers: 'autocomplete' offers words from open buffers.
-- LSP buffers: vim.lsp.completion triggers on every identifier character instead.

vim.o.autocomplete = true
vim.o.complete = ".^5,w^5,b^5,u^5"
vim.o.completeopt = "menuone,noselect,popup,fuzzy"
vim.o.pumborder = "rounded"

local ident_chars = vim.split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_", "")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspCompletion", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client or not client:supports_method("textDocument/completion") then
      return
    end
    local provider = client.server_capabilities.completionProvider
    provider.triggerCharacters = vim.list_extend(vim.deepcopy(provider.triggerCharacters or {}), ident_chars)
    -- One menu at a time: LSP results replace buffer-word autocomplete here
    vim.bo[ev.buf].autocomplete = false
    vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
  end,
})

local map = vim.keymap.set
local function pum_selected()
  return vim.fn.pumvisible() == 1 and vim.fn.complete_info({ "selected" }).selected ~= -1
end

-- <Tab>/<S-Tab>: move through the menu, else jump in an active snippet
map({ "i", "s" }, "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  elseif vim.snippet.active({ direction = 1 }) then
    return "<Cmd>lua vim.snippet.jump(1)<CR>"
  end
  return "<Tab>"
end, { expr = true, desc = "Next completion / snippet field" })

map({ "i", "s" }, "<S-Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  elseif vim.snippet.active({ direction = -1 }) then
    return "<Cmd>lua vim.snippet.jump(-1)<CR>"
  end
  return "<S-Tab>"
end, { expr = true, desc = "Previous completion / snippet field" })

-- <CR>: accept the selected item, else let nvim-autopairs handle the newline
map("i", "<CR>", function()
  if pum_selected() then
    return vim.keycode("<C-y>")
  end
  -- autopairs_cr() already returns termcodes, so this map skips replace_keycodes
  return require("nvim-autopairs").autopairs_cr()
end, { expr = true, replace_keycodes = false, desc = "Accept completion / newline" })

-- <C-Space>: open LSP completion by hand
map("i", "<C-Space>", function()
  vim.lsp.completion.get()
end, { desc = "Trigger LSP completion" })
