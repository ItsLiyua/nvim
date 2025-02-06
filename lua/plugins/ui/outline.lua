return {
	"hedyhli/outline.nvim",
	cmd = { "Outline", "OutlineOpen" },
	keys = { { "<leader>o", "<cmd>Outline<CR>", desc = "Open outline" } },
	config = function()
		require("outline").setup({
			outline_window = {
				position = "right",
				auto_close = true,
				show_numbers = true,
			},
			symbol_folding = { auto_fold = true },
		})
	end,
}
