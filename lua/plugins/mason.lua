return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		local mti_tools = require("language_parser").mti_tools

		for i, v in pairs(mti_tools) do
			require("utils").send_log(i .. ":" .. v)
		end

		require("mason-tool-installer").setup({ ensure_installed = mti_tools })
	end,
	dependencies = {
		{
			"williamboman/mason-lspconfig",
			dependencies = {
				{
					"williamboman/mason.nvim",
					config = true,
					build = ":MasonUpdate",
				},
			},
		},
	},
}
