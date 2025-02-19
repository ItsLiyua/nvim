return {
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
	cmd = { "ConformInfo" },
	ft = require("liyua.language_parser").formatter_filetypes,
	event = { "BufWritePre" },
	config = function()
		local parser = require("liyua.language_parser")
		require("conform").setup({
			formatters_by_ft = parser.conform_fmt_by_ft,
			formatters = parser.conform_fmt_cfg,
			format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
		})
	end,
}
