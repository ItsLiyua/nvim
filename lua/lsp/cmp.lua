return {
	enabled = function()
		local disabled_ft = require("utils").non_filetypes
		return not vim.tbl_contains(disabled_ft, vim.bo.filetype)
	end,
	keymap = {
		preset = "super-tab",
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
	},
	completion = {
		menu = {
			draw = {
				columns = {
					{ "kind_icon", "label", "label_description", gap = 1 },
					{ "kind", "source_name", gap = 1 },
				},
			},
		},
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
	signature = { enabled = true },
	sources = {
		default = {
			"lazydev",
			"lsp",
			"snippets",
			"path",
			"buffer",
		},
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
		},
	},
}
