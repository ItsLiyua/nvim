local M = {}

M.config = vim.tbl_extend("error", require("language_config.lsp.utils").base_config_no_format, {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			telemetry = false,
		},
	},
})

return M
