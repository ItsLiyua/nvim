return {
	"folke/zen-mode.nvim",
	keys = {
		{
			"<leader>z",
			function()
				require("zen-mode").toggle()
			end,
			desc = "Toggle zen mode",
		},
	},
	opts = {
		window = {
			width = 1,
			options = {
				signcolumn = "no",
				foldcolumn = "0",
			},
		},
		kitty = {
			enabled = true,
			font = "+4",
		},
		on_enable = function(_)
			vim.g.liyua_zen_mode_active = true
		end,
		on_disable = function()
			vim.g.liyua_zen_mode_active = false
		end,
	},
}
