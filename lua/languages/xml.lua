return require("api.language").new({
	ft = { "xml" },
	treesitter = "xml",
	formatters = { xmlformatter = {} },
	lsp = {
		{
			name = "lemminx",
			config = {},
			format = false,
		},
	},
})
