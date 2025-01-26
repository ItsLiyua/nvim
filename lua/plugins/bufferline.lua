return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons", "RedsXDD/neopywal.nvim", "folke/which-key.nvim" },
	event = { "BufAdd", "BufEnter", "BufReadPre", "BufNewFile" },
	config = function()
		require("bufferline").setup({
			options = {
				-- separator_style = "slope",
				indicator = { style = "underline" },
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "center",
					},
				},
				show_buffer_icons = true,
			},
		})

		local wk = require("which-key")
		for i = 1, 10 do
			wk.add({ "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", hidden = true })
		end
	end,
}
