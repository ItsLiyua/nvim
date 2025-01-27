return {
	"Pocco81/auto-save.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = { { "<leader>mt", "<cmd>ASToggle<CR>", desc = "Toggle autosave" } },
	opts = {
		debounce_delay = 5000,
	},
}
