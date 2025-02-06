return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		require("mason-tool-installer").setup({ ensure_installed = require("language_parser").mti_tools })
	end,
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = true,
			build = ":MasonUpdate",
		},
	},
}
