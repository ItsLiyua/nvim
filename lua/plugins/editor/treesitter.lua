---@diagnostic disable: missing-fields
return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- ensure_installed = require("language_config.treesitter").ts_langs,
			ensure_installed = require("language_parser").ts_ensure_installed,
			highlight = {
				enable = true,
				disable = { "latex" },
			},
			indent = { enable = true },
			autotag = { enable = true },
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

		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})
	end,
	build = ":TSUpdate",
	cmd = { "TSInstall" },
	ft = require("language_parser").ts_filetypes,
	dependencies = { "windwp/nvim-ts-autotag", "folke/ts-comments.nvim" },
}
