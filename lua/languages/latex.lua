return require("api.language").new({
	ft = { "tex" },
	treesitter = "latex",
	formatters = {
		latexindent = {},
	},
	lsp = {
		{
			name = "ltex",
			config = {
				settings = {
					ltex = {
						language = "en-US",
					},
				},
			},
		},
	},
})
