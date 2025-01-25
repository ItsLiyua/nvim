local M = {}

M.formatters_by_ft = {
	lua = { "stylua" },
	kotlin = { "ktlint" },
}

M.formatter_conf = {
	ktlint = {
		prepend_args = { "--editorconfig=~/.config/nvim/ktlint.cfg" },
	},
}

return M
