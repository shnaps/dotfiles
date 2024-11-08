local M = {}

M.nvdash = {}

M.base46 = {
	integrations = { "neogit" },
	theme = "decay",
	changed_themes = {},
	transparency = false,
	theme_toggle = { "decay", "one_light" },
}

M.colorify = {
	enabled = true,
	mode = "virtual", -- fg, bg, virtual
	virt_text = "󱓻 ",
	highlight = { hex = true, lspvars = true },
}

M.lsp = {
	signature = true,
}

return M
