return require("api.language").new({
	ft = { "json" },
	treesitter = "json",
	formatters = { prettierd = {} },
	lsp = {
		{
			name = "jsonls",
			config = {},
			format = false,
		},
	},
})
