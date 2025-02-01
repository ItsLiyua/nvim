return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lsp")
	end,
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = true,
			build = ":MasonUpdate",
		},
		{
			"stevearc/conform.nvim",
			keys = {
				{
					"<leader>cf",
					function()
						require("conform").format({ async = true, lsp_fallback = true })
					end,
					mode = { "n", "v" },
					desc = "Format file",
				},
			},
			config = function()
				require("conform").setup({
					formatters_by_ft = require("lsp.conform").formatters_by_ft,
					formatters = require("lsp.conform").formatter_conf,
				})
			end,
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
				require("luasnip.loaders.from_vscode").lazy_load()

				cmp.setup({
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					mapping = cmp.mapping.preset.insert({
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.abort(),
						["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					}),
					sources = cmp.config.sources({
						{ name = "luasnip" }, -- For luasnip users.
						{ name = "nvim_lsp" },
					}, {
						{ name = "buffer" },
						{ name = "path" },
						{ name = "calc" },
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
	},
}
