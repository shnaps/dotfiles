return {
	"mrcjkb/rustaceanvim",
	version = "^4",
	ft = { "rust" },
	config = function()
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {
				float_win_config = {
					border = "rounded",
				},
			},
			-- LSP configuration
			server = {
				on_attach = function()
					-- local function opts(desc)
					-- 	return { buffer = bufnr, desc = "LSP " .. desc }
					-- end

					vim.lsp.inlay_hint.enable()
					local map = vim.keymap.set
					map("n", "K", "<cmd>lua vim.cmd.RustLsp({ 'hover', 'actions' })<CR>", { desc = "Rust Hover" })
					map("n", "<leader>ca", "<cmd>lua vim.cmd.RustLsp('codeAction')<CR>", { desc = "Rust Code actions" })

					-- map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
					-- map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
					-- map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
					-- map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
					-- map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
					-- map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
					--
					-- map("n", "<leader>wl", function()
					-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					-- end, opts("List workspace folders"))
					--
					-- map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
					--
					-- map("n", "<leader>ra", function()
					-- 	require("nvchad.lsp.renamer")()
					-- end, opts("NvRenamer"))
					--
					-- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
					-- map("n", "gr", vim.lsp.buf.references, opts("Show references"))
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {},
				},
			},
			-- DAP configuration
			dap = {},
		}
	end,
}
