---@diagnostic disable: missing-fields
return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = require("language_parser").ts_ensure_installed,
			highlight = {
				enable = true,
				disable = { "latex" },
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<C-S-space>",
				},
			},
		})

		require("nvim-ts-autotag").setup({
			enable_close = true,
			enable_rename = true,
		})
	end,
	build = ":TSUpdate",
	cmd = { "TSInstall" },
	ft = require("language_parser").ts_filetypes,
	dependencies = { "windwp/nvim-ts-autotag", "folke/ts-comments.nvim" },
}
