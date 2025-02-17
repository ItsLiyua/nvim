return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		animate = { enabled = true },
		bigfile = { enabled = false },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		indent = {
			enabled = true,
			char = "│",
			hl = "SnacksIndent",
			animate = {
				enabled = vim.fn.has("nvim-0.10") == 1,
				style = "out",
				easing = "linear",
				duration = {
					step = 20,
					total = 200,
				},
			},
			filter = function(buf)
				return vim.g.snacks_indent ~= false
					and vim.b[buf].snacks_indent ~= false
					and vim.bo[buf].buftype == ""
					and not vim.tbl_contains(require("utils").non_filetypes, vim.bo[buf].filetype)
			end,
		},
		input = {
			enabled = true,
			icon = " ",
			icon_hl = "SnacksInputIcon",
			icon_pos = "left",
			prompt_pos = "left",
			win = { style = "input" },
			expand = true,
		},
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
