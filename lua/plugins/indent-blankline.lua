return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "▎" },
		exclude = { filetypes = require("utils").non_filetypes },
		scope = {
			enabled = true,
			show_start = true,
			show_end = true,
			highlight = "Todo",
		},
	},
}
