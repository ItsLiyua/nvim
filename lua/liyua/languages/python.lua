return require("liyua.api.language").new({
	ft = { "python" },
	treesitter = "python",
	formatters = {
		black = {},
		isort = {},
	},
	lsp = {
		{
			name = "pylsp",
			format = false,
		},
	},
})
