return require("api.language").new({
	ft = { "kotlin" },
	treesitter = "kotlin",
	formatters = {
		ktlint = {
			prepend_args = { "--editorconfig=~/.config/nvim/settings/linters/ktlint.cfg" },
		},
	},
	lsp = { { name = "kotlin_language_server" } },
})
