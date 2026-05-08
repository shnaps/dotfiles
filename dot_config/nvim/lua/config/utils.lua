local M = {}

--- Navigate to plugin repo if valid string name under cursor
M.go_to_github_link = function()
  local ts = vim.treesitter
  local node = ts.get_node()

  if not node then
    vim.notify("No treesitter node under cursor", vim.log.levels.WARN)
    return
  end

  local str = ts.get_node_text(node, 0)

  local is_github_string = function(s)
    local _, count = s:gsub("/", "")
    return count == 1
  end

  if str and is_github_string(str) then
    local gh_link = string.format("https://github.com/%s", str)
    vim.ui.open(gh_link)
  else
    vim.notify("Not a valid 'owner/repo' string", vim.log.levels.ERROR)
  end
end

return M
