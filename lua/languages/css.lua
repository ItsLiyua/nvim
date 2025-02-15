return require("api.language").new({
	ft = { "css", "scss", "less" },
	treesitter = "kotlin",
	formatters = {
		prettierd = {},
	},
	lsp = {
		{
			name = "cssls",
			format = false,
		},
	},
})
