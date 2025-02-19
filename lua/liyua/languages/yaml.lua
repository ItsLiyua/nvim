return require("liyua.api.language").new({
	ft = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
	treesitter = "yaml",
	formatters = { prettierd = {} },
	lsp = {
		{
			name = "yamlls",
			config = {
				settings = {
					yaml = {
						redhat = {
							telemetry = {
								enabled = false,
							},
						},
					},
				},
			},
			format = false,
		},
	},
})
