return require("api.language").new({
	ft = { "bash", "sh", "zsh" },
	treesitter = "bash",
	formatters = {
		beautysh = {
			prepend_args = { "-t" },
		},
	},
	lsp = {
		{
			name = "bashls",
			config = {},
			format = false,
		},
	},
})
