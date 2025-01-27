return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons", "RedsXDD/neopywal.nvim", "folke/which-key.nvim" },
	event = { "BufAdd", "BufEnter", "BufReadPre", "BufNewFile" },
	config = function()
		local colors = require("neopywal").get_colors()
		local indicator = colors.color4

		require("bufferline").setup({
			options = {
				separator_style = "thin",
				numbers = "ordinal",
				indicator = {
					icon = nil,
					style = "underline",
				},
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
			highlights = require("neopywal.theme.plugins.bufferline").setup({
				indicator_selected = { sp = indicator, underline = true },
				tab_separator_selected = { sp = indicator, underline = true },
				close_button_selected = { sp = indicator, underline = true },
				buffer_selected = { sp = indicator, underline = true },
				numbers_selected = { sp = indicator, underline = true },
				diagnostic_selected = { sp = indicator, underline = true },
				hint_selected = { sp = indicator, underline = true },
				hint_diagnostic_selected = { sp = indicator, underline = true },
				info_selected = { sp = indicator, underline = true },
				info_diagnostic_selected = { sp = indicator, underline = true },
				warning_selected = { sp = indicator, underline = true },
				warning_diagnostic_selected = { sp = indicator, underline = true },
				error_selected = { sp = indicator, underline = true },
				error_diagnostic_selected = { sp = indicator, underline = true },
				modified_selected = { sp = indicator, underline = true },
				duplicate_selected = { sp = indicator, underline = true },
				separator_selected = { sp = indicator, underline = true },
				pick_selected = { sp = indicator, underline = true },
			}),
		})

		local wk = require("which-key")
		for i = 1, 10 do
			wk.add({ "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", hidden = true })
		end
	end,
}
