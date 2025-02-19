return {
  -- NOTE: When deleting this: Remove code from treesitter config for lua_patterns and regex parser
	"OXY2DEV/patterns.nvim",
	keys = { { "<leader>cp", "<cmd>Pattern explain<CR>", desc = "Explain regex pattern" } },
	opts = {
		keymaps = {
			explain_input = {
				["<ESC>"] = {
					callback = "close",
				},
			},
			explain_preview = {
				["<ESC>"] = {
					callback = "close",
				},
			},
		},
	},
}
