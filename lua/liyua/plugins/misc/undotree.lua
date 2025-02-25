return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	keys = { { "<leader>mu", "<cmd>lua require('undotree').toggle()<cr>", desc = "Toggle undo tree" } },
	opts = {
		position = "right",
		ignore_filetype = require("liyua.utils").non_filetypes,
		keymaps = {
			["j"] = "move_next",
			["k"] = "move_prev",
			["gj"] = "move2parent",
			["J"] = "move_change_next",
			["K"] = "move_change_prev",
			["<cr>"] = "action_enter",
			["p"] = "enter_diffbuf",
			["q"] = "quit",
			["<ESC>"] = "quit",
		},
	},
}
