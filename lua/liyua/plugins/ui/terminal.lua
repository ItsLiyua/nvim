return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Open Terminal" },
		{ "<leader>t1", "<cmd>ToggleTerm 1<CR>", desc = "Open Terminal 1" },
		{ "<leader>t2", "<cmd>ToggleTerm 2<CR>", desc = "Open Terminal 2" },
		{ "<leader>t3", "<cmd>ToggleTerm 3<CR>", desc = "Open Terminal 3" },
		{ "<leader>t4", "<cmd>ToggleTerm 4<CR>", desc = "Open Terminal 4" },
	},
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
