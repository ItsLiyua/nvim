return {
	"bassamsdata/namu.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		namu_symbols = { enable = true },
		colorscheme = { enable = false },
		ui_select = { enable = true },
	},
	keys = {
		{
			"<leader>gs",
			function()
				require("namu.namu_symbols").show()
			end,
			desc = "Jump to LSP symbol",
		},
	},
}
