return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- require("language_config/lsp")
	end,
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = true,
			build = ":MasonUpdate",
		},
		{ "williamboman/mason-lspconfig.nvim", config = true },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- Will be merged with base neovim soon. Then the plugin can be removed.
			config = function()
				vim.keymap.set("n", "<leader>dt", function()
					require("lsp_lines").toggle()
				end, { desc = "Toggle virtual diagnostics text" })
			end,
		},
		{
			"hrsh7th/nvim-cmp",
			config = function()
				local cmp = require("cmp")
				local luasnip = require("luasnip")
				require("luasnip.loaders.from_vscode").lazy_load()

				local cmp_confirm_or_jump = function(select)
					return cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif cmp.visible() then
							if cmp.get_selected_entry() ~= nil or select then
								cmp.confirm({ select = select })
							else
								fallback()
							end
						else
							fallback()
						end
					end)
				end

				cmp.setup({
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					---@diagnostic disable-next-line: missing-fields
					formatting = {
						format = function(entry, vim_item)
							vim_item.kind =
								string.format("%s %s", require("utils").kind_icons[vim_item.kind], vim_item.kind)
							if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
								vim_item.menu = entry.completion_item.detail
							else
								vim_item.menu = ({
									lazydev = "[LazyDev]",
									nvim_lsp = "[LSP]",
									luasnip = "[LuaSnip]",
									path = "[Path]",
									calc = "[Calc]",
									buffer = "[Buffer]",
								})[entry.source.name]
							end
							return vim_item
						end,
					},
					mapping = {
						["<CR>"] = cmp_confirm_or_jump(false),
						["<Tab>"] = cmp_confirm_or_jump(true),
						["<S-Tab>"] = cmp.mapping(function(fallback)
							if luasnip.locally_jumpable(-1) then
								luasnip.jump(-1)
							else
								fallback()
							end
						end),
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-j>"] = cmp.mapping.select_next_item(),
						["<C-k>"] = cmp.mapping.select_prev_item(),
						["<C-e>"] = cmp.mapping.abort(),
					},
					sources = cmp.config.sources({
						{ name = "lazydev", group_index = 0 },
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
						{ name = "calc" },
						{ name = "path" },
						{
							name = "buffer",
							option = {
								keyword_pattern = [[\k\+]],
							},
						},
					}),
				})
			end,
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-calc",
				"saadparwaiz1/cmp_luasnip",
				"L3MON4D3/LuaSnip",
				"rafamadriz/friendly-snippets",
			},
		},
		"antosha417/nvim-lsp-file-operations",
	},
}
