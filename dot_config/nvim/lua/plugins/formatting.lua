local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    java = { "google-java-format" },
    python = { "ruff_format" },
    sh = { "shfmt" },
    typst = { "typstyle" },
    go = { "gofmt" },
    rust = { "rustfmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

local function format()
  conform.format({ async = true, lsp_format = "fallback" })
end

-- NvChad <leader>fm + <leader>cf alias
vim.keymap.set({ "n", "x" }, "<leader>fm", format, { desc = "Format buffer" })
vim.keymap.set({ "n", "x" }, "<leader>cf", format, { desc = "Format buffer" })
