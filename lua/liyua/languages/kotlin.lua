return require("liyua.api.language").new({
	ft = { "kotlin" },
	treesitter = "kotlin",
	formatters = {
		ktlint = {
			prepend_args = { "--editorconfig=~/.config/nvim/settings/linters/ktlint.cfg" },
		},
	},
	lsp = {
		{
			name = "kotlin_language_server",
			format = false,
		},
	},
})
