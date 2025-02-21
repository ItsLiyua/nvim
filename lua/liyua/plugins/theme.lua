return {
	"RedsXDD/neopywal.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent_background = true,
		plugins = {
			dashboard = false,
			dropbar = {
				enabled = true,
				colored_text = true,
			},
			lazy = true,
			mason = true,
			markdown = true,
			neotree = false,
			nvim_cmp = true,
			noice = true,
			notify = true,
			indent_blankline = false,
			lsp = {
				enabled = true,
				virtual_text = {
					errors = { "bold", "italic" },
					hints = { "bold", "italic" },
					information = { "bold", "italic" },
					ok = { "bold", "italic" },
					warnings = { "bold", "italic" },
					unnecessary = { "bold", "italic" },
				},
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					information = { "undercurl" },
					ok = { "undercurl" },
					warnings = { "undercurl" },
				},
				inlay_hints = {
					background = true,
					style = { "bold", "italic" },
				},
			},
			surround = true,
			treesitter = true,
			telescope = { enabled = false },
			trouble = true,
			which_key = true,
		},
	},
	init = function()
		vim.cmd.colorscheme("neopywal-dark")
	end,
}
