return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	ft = require("language_parser").fts,
	config = function()
		local mti_tools = require("language_parser").mti_tools
		local mti = require("mason-tool-installer")
		mti.setup({
			ensure_installed = mti_tools,
			auto_upsate = true,
		})
		mti.check_install(true, true)
	end,
	dependencies = {
		{
			"williamboman/mason-lspconfig",
			dependencies = {
				{
					"williamboman/mason.nvim",
					cmd = { "Mason", "MasonInstall" },
					config = true,
					build = ":MasonUpdate",
					dependencies = {
						"nvim-telescope/telescope.nvim",
						dependencies = { "nvim-lua/plenary.nvim" },
					},
				},
			},
		},
	},
}
