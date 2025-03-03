return require("liyua.api.language").new({
	ft = { "python" },
	treesitter = "python",
	formatters = {
		isort = {},
		black = {},
	},
	lsp = {
		{
			name = "pylsp",
			format = false,
		},
	},
})
