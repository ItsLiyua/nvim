local M = {}

M.config = vim.tbl_extend("error", require("lsp.utils").base_config_no_format, {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
			redhat = { telemetry = { enabled = false } },
		},
	},
})

return M
