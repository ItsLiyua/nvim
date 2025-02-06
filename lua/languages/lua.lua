return require("api.language").new({
	ft = { "lua" },
	treesitter = "lua",
	formatters = {
		stylua = {},
	},
	lsp = {
		{
			name = "lua_ls",
			config = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						telemetry = false,
					},
				},
			},
		},
	},
})
