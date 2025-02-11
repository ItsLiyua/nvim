return require("api.language").new({
	ft = { "json" },
	treesitter = "json",
	formatters = { prettierd = {} },
	lsp = {
		{
			name = "json-lsp",
			config = {},
			format = false,
		},
	},
})
