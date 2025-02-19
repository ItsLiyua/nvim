return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"folke/which-key.nvim",
	},
	opts = { focus = true },
	cmd = "Trouble",
	keys = {
		{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Toggle diagnostics window" },
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Toggle diagnostics for current window",
		},
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Toggle quickfix" },
		-- { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Toggle loclist" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Toggle todo list" },
	},
}
