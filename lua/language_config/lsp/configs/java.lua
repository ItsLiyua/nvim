local M = {}

M.config = vim.tbl_extend("error", require("language_config.lsp.utils").base_config, {
	cmd = {
		vim.fn.stdpath("data") .. "/mason/packages/jdtls/jdtls",
		"--java-executable=/usr/lib64/jvm/java-21-openjdk/bin/java",
	},
})

return M
