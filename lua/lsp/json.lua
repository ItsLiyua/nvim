local M = {}

M.config = vim.tbl_extend("error", require("lsp.utils").base_config_no_format, {
	settings = {
		json = {
      provideFormatter = false
		},
	},
})

return M
