return {
	"Wansmer/treesj",
	keys = {
		{
			"<leader>j",
			function()
				require("treesj").toggle()
			end,
			desc = "Split or join current line",
		},
		{
			"<leader>J",
			function()
				require("treesj").toggle({ split = { recursive = true } })
			end,
			desc = "Split or join current line recursively",
		},
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		use_default_keymaps = false,
		max_join_length = 2000,
	},
}
