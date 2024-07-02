return {
	"nvim-java/nvim-java",
	config = false,
	dependencies = {
		{
			"neovim/nvim-lspconfig",
			opts = {
				servers = {
					jdtls = {
						-- Your custom jdtls settings goes here
					},
				},
				setup = {
					jdtls = function()
						require("java").setup({
							-- Your custom nvim-java configuration goes here
							handlers = {
								-- By assigning an empty function, you can remove the notifications
								-- printed to the cmd
								["$/progress"] = function(_, result, ctx) end,
							},
							jdk = {
								auto_install = false,
							},
						})
					end,
				},
			},
		},
	},
}
