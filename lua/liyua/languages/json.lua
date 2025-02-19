return require("liyua.api.language").new({
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
