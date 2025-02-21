return require("liyua.api.language").new({
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
				on_attach = function(client, bufnr)
					local lsp_utils = require("liyua.lsp_utils")
					lsp_utils.on_attach(client, bufnr)
					vim.defer_fn(function()
						-- TODO: Maybe find a workaround for this or something
						lsp_utils.setup_lsp_keymaps(client, bufnr)
					end, 2000)
				end,
			},
			format = false,
		},
	},
})
