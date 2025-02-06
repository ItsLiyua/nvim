return {
	"neovim/nvim-lspconfig",
  ft = require("language_parser").fts,
	config = function()
		local lspconfig = require("lspconfig")
		local lsps = require("language_parser").lsp_configs
		local base_config = require("lsp_utils").base_config

		for _, lsp in pairs(lsps) do
			local cfg = lsp.config
			if cfg == nil then
				cfg = {}
			end

			lspconfig[lsp.name].setup(vim.tbl_deep_extend("force", base_config, cfg))
			require("utils").send_log('Configured LSP "' .. lsp.name .. '"')
		end
	end,
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			config = true,
			dependencies = {
				"williamboman/mason.nvim",
				config = true,
				build = ":MasonUpdate",
			},
		},
		"antosha417/nvim-lsp-file-operations",
	},
}
