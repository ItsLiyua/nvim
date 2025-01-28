return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		event = { "BufReadPre", "InsertEnter" },
		opts = {
			enabled = function()
				local disabled_ft = { "neo-tree", "neo-tree-popup", "dashboard" }
				return not vim.tbl_contains(disabled_ft, vim.bo.filetype)
			end,
			keymap = {
				preset = "super-tab",
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
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
		},
		opts_extend = { "sources.default" },
	},
}
