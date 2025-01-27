return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lsp")
	end,
	dependencies = {
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			config = true,
		},
		{
			"stevearc/conform.nvim",
			event = { "BufWritePre" },
			keys = {
				{
					"<leader>cf",
					function()
						require("conform").format({ async = true, lsp_fallback = true })
					end,
					mode = { "n", "v" },
					desc = "Format file",
				},
				{
					"<leader>cF",
					"<cmd>FormatOnSaveToggle<CR>",
					desc = "Toggle format-on-save",
				},
			},
			config = function()
				require("conform").setup({
					formatters_by_ft = require("lsp.conform").formatters_by_ft,
					formatters = require("lsp.conform").formatter_conf,
					format_on_save = function(bufnr)
						if vim.b[bufnr].formatonsave ~= nil and not vim.b[bufnr].formatonsave then
							return
						else
							return {
								lsp_format = "fallback",
								timeout_ms = 500,
							}
						end
					end,
				})

				vim.api.nvim_create_user_command("FormatOnSaveToggle", function()
					if vim.b.formatonsave ~= nil then
						vim.b.formatonsave = not vim.b.formatonsave
					else
						vim.b.formatonsave = false
					end
					if vim.b.formatonsave then
						vim.notify("Enabled format-on-save for this buffer.", vim.log.levels.INFO)
					else
						vim.notify("Disbled format-on-save for this buffer.", vim.log.levels.INFO)
					end
				end, {
					desc = "Toggle format-on-save",
				})
			end,
		},
		{ "williamboman/mason-lspconfig.nvim", config = true },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}
