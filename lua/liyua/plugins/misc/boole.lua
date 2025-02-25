return {
	"nat-418/boole.nvim",
	keys = {
		{ "<leader>+", "<cmd>Boole increment<CR>", desc = "Increment" },
		{ "<C-+>", "<cmd>Boole increment<CR>", desc = "Increment" },
		{ "<leader>-", "<cmd>Boole decrement<CR>", desc = "Decrement" },
		{ "<C-->", "<cmd>Boole decrement<CR>", desc = "Decrement" },
	},
	config = function()
		require("boole").setup({
			mappings = {
				increment = "<C-a>",
				decrement = "<C-x>",
			},
			-- User defined loops
			additions = {},
			allow_caps_additions = {
				{ "enable", "disable" },
			},
		})
	end,
}
