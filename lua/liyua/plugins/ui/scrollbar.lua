return {
	"petertriho/nvim-scrollbar",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("scrollbar").setup({
			handlers = {
				cursor = true,
				diagnostic = true,
				gitsigns = true,
				handle = true,
			},
		})
		require("scrollbar.handlers.gitsigns")
	end,
	dependencies = { "lewis6991/gitsigns.nvim" },
}
