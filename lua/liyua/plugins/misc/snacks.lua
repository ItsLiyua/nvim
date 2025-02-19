return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>v",
			function()
				Snacks.lazygit.open()
			end,
			desc = "Open git UI",
		},
	},
	---@type snacks.Config
	opts = {
		animate = { enabled = true },
		bigfile = require("liyua.snacks.bigfile"),
		dashboard = require("liyua.snacks.dashboard"),
		explorer = { enabled = false },
		indent = require("liyua.snacks.indent"),
		image = { enabled = true },
		input = require("liyua.snacks.input"),
		lazygit = { enabled = true, configure = true },
		picker = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
