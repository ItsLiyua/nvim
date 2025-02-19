---@diagnostic disable: missing-fields
return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

		parser_configs.lua_patterns = {
			install_info = {
				url = "https://github.com/OXY2DEV/tree-sitter-lua_patterns",
				files = { "src/parser.c" },
				branch = "main",
			},
		}

		require("nvim-treesitter.configs").setup({
			ensure_installed = vim.tbl_extend(
				"force",
				require("liyua.language_parser").ts_ensure_installed,
				{ "regex", "lua_patterns" }
			),
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
			opts = {
				enable_close = true,
				enable_rename = true,
			},
		})
	end,
	build = ":TSUpdate",
	cmd = { "TSInstall" },
	ft = require("liyua.language_parser").ts_filetypes,
	dependencies = { "windwp/nvim-ts-autotag", "folke/ts-comments.nvim" },
}
