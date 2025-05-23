return {
	{
		"OXY2DEV/markview.nvim",
		ft = { "markdown" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("markview").setup({
				-- on_enable = {
				-- 	conceallevel = 2,
				-- 	concealcursor = "",
				-- },
				-- on_disable = {
				-- 	conceallevel = 0,
				-- 	concealcursor = "",
				-- },
				latex = {
					enable = true,
					inlines = { enable = true },
					commands = {
						enable = true,
						["lor"] = { on_command = { conceal = "", virt_text = { "∨" } } },
						["land"] = { on_command = { conceal = "", virt_text = { "∧" } } },
						["leq"] = { on_command = { conceal = "", virt_text = { "≤" } } },
						["geq"] = { on_command = { conceal = "", virt_text = { "≥" } } },
						["cdot"] = { on_command = { conceal = "", virt_text = { "∙" } } },
					},
				},
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		keys = { { "<leader>cm", "<cmd>MarkdownPreview<CR>", desc = "Preview Markdown in Browser" } },
		ft = { "markdown" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_theme = "dark"
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
}
