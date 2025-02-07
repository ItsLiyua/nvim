return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	ft = require("language_parser").fts,
	config = function()
		local mti_tools = require("language_parser").mti_tools

		for i, v in pairs(mti_tools) do
			require("utils").send_log(i .. ":" .. v)
		end

    local mti = require("mason-tool-installer")
	  mti.setup({ ensure_installed = mti_tools })
    mti.check_install(true, true)
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
