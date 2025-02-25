return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	ft = require("liyua.language_parser").fts,
	config = function()
		local mti_tools = require("liyua.language_parser").mti_tools
		local mti = require("mason-tool-installer")
		mti.setup({
			ensure_installed = mti_tools,
			auto_upsate = true,
		})
		mti.check_install(true, false)
	end,
	dependencies = {
		{
			"williamboman/mason-lspconfig",
			dependencies = {
				{
					"williamboman/mason.nvim",
					cmd = { "Mason", "MasonInstall" },
					opts = { ui = { border = "rounded" } },
					build = ":MasonUpdate",
					keys = { { "<leader>mm", "<cmd>Mason<CR>", desc = "Open mason UI" } },
				},
			},
		},
	},
}
