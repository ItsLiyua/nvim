return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons", "RedsXDD/neopywal.nvim" },
	-- lazy = false,
	event = { "BufAdd", "BufEnter", "BufReadPre", "BufNewFile" },
	config = function()
		require("bufferline").setup({
			options = {
				seperator_style = "slant",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "center",
					},
				},
			},
			highlights = require("neopywal.theme.plugins.bufferline").setup(),
		})
	end,
}
