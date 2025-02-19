return require("liyua.api.language").new({
	ft = { "tex" },
	treesitter = "latex",
	formatters = {
		latexindent = {},
	},
	lsp = {
		{
			name = "ltex",
			config = {
				cmd = {
					"env",
					"JAVACMD=/usr/lib64/jvm/java-21-openjdk/bin/java",
					vim.fn.stdpath("data") .. "/mason/bin/ltex-ls",
				},
				settings = {
					ltex = {
						enabled = { "latex", "bibtex", "context", "context.tex" },
						language = "en-US",
					},
				},
			},
			format = false,
		},
	},
})
