---@diagnostic disable: missing-fields
local M = {}
local base = require("language_config.lsp.utils").base_config_no_format

M.config = vim.tbl_extend("force", base, {
	on_attach = function(client, bufnr)
		base.on_attach(client, bufnr)
		require("ltex_extra").setup({
			load_langs = { "en-US", "de-DE" },
			log_level = "error",
			path = vim.fn.stdpath("data") .. "/ltex",
		})
	end,
	settings = {
		ltex = {
			language = "en-US",
			diagnosticSeverity = "error",
			checkFrequency = "save",
		},
	},
})

return M
