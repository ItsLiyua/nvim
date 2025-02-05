local M = {}

M.config = vim.tbl_extend("error", require("language_config.lsp.utils").base_config, {
	settings = {
		hyprls = {
			filetypes = {
				"hyprlang",
				"*.hl",
			},
		},
	},
})

return M
