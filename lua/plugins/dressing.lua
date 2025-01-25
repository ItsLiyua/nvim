return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = {
		mappings = {
			i = {
				["<C-j>"] = "HistoryNext",
				["<C-k>"] = "HistoryPrev",
			},
		},
		backend = "telescope",
		telescope = require("telescope.themes").get_cursor(),
	},
	dependencies = { "nvim-telescope/telescope.nvim" },
}
