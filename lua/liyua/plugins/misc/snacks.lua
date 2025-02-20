return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>vg",
			function()
				Snacks.lazygit.open()
			end,
			desc = "Open git UI",
		},
		{
			"<leader>vb",
			function()
				Snacks.git.blame_line()
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
		git = { enabled = true },
		indent = require("liyua.snacks.indent"),
		image = { enabled = true },
		input = require("liyua.snacks.input"),
		lazygit = { enabled = true, configure = true },
		picker = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		rename = { enabled = true },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = require("liyua.snacks.statuscolumn"),
		words = { enabled = false },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
