return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons", "RedsXDD/neopywal.nvim", "folke/which-key.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local colors = require("neopywal").get_colors()
		local indicator = colors.color4

		require("bufferline").setup({
			options = {
				separator_style = "thin",
				numbers = "ordinal",
				auto_toggle_bufferline = true,
				indicator = {
					icon = nil,
					style = "underline",
				},
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "snacks_layout_box",
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

		local icons = { "󰎤", "󰎧", "󰎪", "󰎭", "󰎱", "󰎳", "󰎶", "󰎹", "󰎼" }

		local wk = require("which-key")
		for i = 1, 9 do
			wk.add({
				{
					"<leader>g" .. (i % 10),
					"<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
					desc = "Go to buffer " .. i,
					icon = { icon = icons[i], color = "azure" },
				},
				{
					"<leader>" .. (i % 10),
					"<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
					hidden = true,
				},
			})
		end

		wk.add({
			{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", mode = "n", hidden = true },
			{ "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", mode = "n", hidden = true },
			{
				"<leader>gn",
				"<cmd>BufferLineCycleNext<CR>",
				mode = "n",
				desc = "Go to next buffer",
				icon = { icon = "", color = "azure" },
			},
			{
				"<leader>gb",
				"<cmd>BufferLineCyclePrev<CR>",
				mode = "n",
				desc = "Go to previous buffer",
				icon = { icon = "", color = "azure" },
			},
		})
	end,
}
