return require("api.language").new({
	ft = { "markdown" },
	treesitter = "markdown",
	formatters = {
		prettierd = {},
	},
	lsp = {
		{
			name = "marksman",
			config = {},
			format = false,
		},
	},
})
