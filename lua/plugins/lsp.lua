return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lsp")
	end,
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = true,
			build = ":MasonUpdate",
		},
		{
			"stevearc/conform.nvim",
			keys = {
				{
					"<leader>cf",
					function()
						require("conform").format({ async = true, lsp_fallback = true })
					end,
					mode = { "n", "v" },
					desc = "Format file",
				},
			},
			config = function()
				require("conform").setup({
					formatters_by_ft = require("lsp.conform").formatters_by_ft,
					formatters = require("lsp.conform").formatter_conf,
				})
			end,
		},
		{ "williamboman/mason-lspconfig.nvim", config = true },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"saghen/blink.cmp",
			dependencies = "rafamadriz/friendly-snippets",
			version = "*",
			opts = require("lsp.cmp"),
		},
		{
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- Will be merged with base neovim soon. Then the plugin can be removed.
			config = function()
				vim.keymap.set("n", "<leader>dt", function()
					require("lsp_lines").toggle()
				end, { desc = "Toggle virtual diagnostics text" })
			end,
		},
	},
}
