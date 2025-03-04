return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"MahanRahmati/blink-nerdfont.nvim",
		"moyiz/blink-emoji.nvim",
	},
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<C-e>"] = { "hide", "fallback" },
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
			["<CR>"] = {
				"accept",
				"fallback",
			},
			["<S-Tab>"] = { "snippet_backward", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-K>"] = { "select_prev", "fallback" },
			["<C-J>"] = { "select_next", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback", "snippet_forward" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = {
				"snippets",
				"lsp",
				"path",
				"buffer",
				"nerdfont",
				"emoji",
			},
			providers = {
				snippets = {
					score_offset = 30,
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				nerdfont = {
					module = "blink-nerdfont",
					name = "Nerd Fonts",
					-- score_offset = 15,
					opts = { insert = true },
				},
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					-- score_offset = 15,
					opts = { insert = true },
					should_show_items = function()
						return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
					end,
				},
			},
			transform_items = function(_, items)
				return vim.tbl_filter(function(item)
					return not (
						item.kind == require("blink.cmp.types").CompletionItemKind.Snippet
						and item.source_name == "LSP"
					)
				end, items)
			end,
		},

		completion = {
			menu = {
				draw = {
					columns = {
						{ "kind_icon", "label", "label_description", "source_name", gap = 1 },
					},
					components = {
						label_description = {
							width = { max = 50 },
						},
						source_name = {
							text = function(ctx)
								return "[" .. ctx.source_name .. "]"
							end,
						},
					},
				},
			},
			list = {
				selection = {
					preselect = false,
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 2000,
			},
			ghost_text = { enabled = true },
		},
	},
	opts_extend = { "sources.default" },
}
