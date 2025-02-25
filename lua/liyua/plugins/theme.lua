return {
	"RedsXDD/neopywal.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent_background = true,
		plugins = {
			aerial = false,
			ale = false,
			alpha = false,
			barbar = false,
			beacon = false,
			blink = true,
			coc = false,
			colorful_winsep = { enabled = false },
			dashboard = false,
			diffview = true,
			dropbar = {
				enabled = true,
				colored_text = true,
			},
			fern = false,
			fzf = false,
			gitsigns = true,
			grug_far = false,
			harpoon = false,
			headlines = false,
			hop = { enabled = false },
			indent_blankline = false,
			indentmini = { enabled = false },
			lazy = true,
			lazygit = true,
			leap = { enabled = false },
			lir = { enabled = false },
			lspsaga = { enabled = false },
			markdown = false,
			mason = true,
			neogit = false,
			neotest = false,
			neotree = false,
			netrw = false,
			noice = true,
			normalNvim = false,
			notifier = false,
			nvim_cmp = false,
			dap = false,
			dap_ui = false,
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
			navbuddy = false,
			navic = false,
			notify = true,
			scrollbar = true,
			nvimtree = false,
			surround = true,
			treesitter = true,
			ts_context = { enabled = false },
			ts_rainbow = false,
			ts_rainbow2 = false,
			ufo = false,
			window_picker = false,
			octo = false,
			overseer = false,
			pounce = { enabled = false },
			rainbow = false,
			snacks = { enabled = true },
			telekasten = false,
			telescope = { enabled = false },
			trouble = true,
			undotree = true,
			vimwiki = false,
			dadbod_ui = false,
			illuminate = { enabled = true },
			sandwich = false,
			sneak = { enabled = false },
			which_key = true,
			yanky = false,
		},
		custom_highlights = function(C)
			return {
				all = {
					IlluminatedWordText = { link = "CursorLine" },
					IlluminatedWordWrite = { link = "CursorLine" },
					IlluminatedWordRead = { link = "CursorLine" },
				},
			}
		end,
	},
	init = function()
		vim.cmd.colorscheme("neopywal-dark")
	end,
}
