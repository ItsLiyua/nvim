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
		{ "<leader>dw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Toggle diagnostics window" },
		{
			"<leader>dd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Toggle diagnostics for current window",
		},
		{ "<leader>dq", "<cmd>Trouble quickfix toggle<CR>", desc = "Toggle quickfix" },
		{ "<leader>dl", "<cmd>Trouble loclist toggle<CR>", desc = "Toggle loclist" },
		{ "<leader>dt", "<cmd>Trouble todo toggle<CR>", desc = "Toggle todo list" },
	},
}
