return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = { { "<leader>mt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" } },
	cmd = "ToggleTerm",
	opts = {
		size = function(term)
			return vim.o.lines * 0.25
		end,
		hide_numbers = true,
		start_in_insert = true,
		direction = "horizontal",
	},
}
