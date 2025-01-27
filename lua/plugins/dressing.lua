return {
	"stevearc/dressing.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		mappings = {
			i = {
				["<C-j>"] = "HistoryNext",
				["<C-k>"] = "HistoryPrev",
			},
		},
		backend = "telescope",
		telescope = function()
			return require("telescope.themes").get_cursor()
		end,
	},
	-- dependencies = { "nvim-telescope/telescope.nvim" },
}
