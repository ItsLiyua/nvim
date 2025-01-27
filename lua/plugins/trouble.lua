return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"folke/which-key.nvim",
	},
	opts = { focus = true },
	init = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>x", group = "Diagnostics...", icon = { icon = "", color = "yellow" } },
			{ "<leader>xw", desc = "Open trouble workspace diagnostics" },
			{ "<leader>xd", desc = "Open trouble document diagnostics" },
			{ "<leader>xq", desc = "Open trouble quickfix list" },
			{ "<leader>xl", desc = "Open trouble location list" },
			{ "<leader>xt", icon = { icon = "", color = "yellow" }, desc = "Open todos in trouble" },
		})
	end,
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
