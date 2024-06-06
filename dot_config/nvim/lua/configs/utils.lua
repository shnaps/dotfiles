---@class Utils
--- Add an alias to any existing command
---@field add_alias fun(target_cmd: string, alias: string)
--- Check if any value is a table
---@field is_tbl fun(v: any): boolean
--- Create a global keymap
---@field glb_map fun(mode: string | table, lhs: string | table, rhs: string | fun(), opts?: table | nil)
--- Create a keymap local to buffer
---@field buf_map fun(mode: string, lhs: string, rhs: string, opts?: table)
--- Delete keymap/s globally. Does not attempt to unmap if keymap does not exist.
---@field del_map fun(mode: string | table, trigger: string | table)
local M = {}

--- Navigate to plugin repo if valid string name under cursor
M.go_to_github_link = function()
	local ts = vim.treesitter
	local node = ts.get_node()

	if not node then
		return
	end

	local string = ts.get_node_text(node, 0)

	local is_github_string = function(str)
		local _, count = str:gsub("/", "")
		return count == 1
	end

	if string then
		local is_valid_string = is_github_string(string)

		if is_valid_string then
			local gh_link = string.format("https://github.com/%s.git", string)
			vim.ui.open(gh_link)
		else
			vim.notify.dismiss() ---@diagnostic disable-line
			vim.notify(" Not a valid GitHub string", vim.log.levels.ERROR, { icon = "" })
			return
		end
	else
		vim.notify.dismiss() ---@diagnostic disable-line
		vim.notify(" Not a string", vim.log.levels.ERROR, { icon = "" })
		return
	end
end

return M
