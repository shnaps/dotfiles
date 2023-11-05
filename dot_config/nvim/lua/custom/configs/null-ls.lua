local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier.with { filetypes = { "html", "markdown", "css" } },
  formatting.stylua,
  formatting.clang_format,
  formatting.google_java_format,
  lint.shellcheck,
  -- lint.checkstyle,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
