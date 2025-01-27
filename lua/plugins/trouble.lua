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
		{ "<leader>x", group = "Diagnostics..." },
		{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>" },
		{ "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>" },
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>" },
	},
}
