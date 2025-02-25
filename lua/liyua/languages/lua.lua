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
				-- on_attach = function(client, bufnr)
				-- 	local lsp_utils = require("liyua.lsp_utils")
				-- 	lsp_utils.on_attach(client, bufnr)
				-- 	vim.notify("test1")
				-- end,
			},
			format = false,
		},
	},
	-- setup = function()
	-- 	vim.notify("test2")
	-- 	vim.api.nvim_create_autocmd("LspAttach", {
	-- 		callback = function(opts)
	-- 			vim.notify("test3")
	-- 			vim.keymap.set(
	-- 				"n",
	-- 				"K",
	-- 				require("liyua.lsp_utils").hover,
	-- 				{ desc = "Hover", remap = true, buffer = opts.bufnr }
	-- 			)
	-- 		end,
	-- 	})
	-- end,
})
