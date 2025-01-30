return {
	"Pocco81/auto-save.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = { { "<leader>mt", "<cmd>ASToggle<CR>", desc = "Toggle autosave" } },
	opts = {
		debounce_delay = 5000,
    condition = function(buf)
      return not vim.api.nvim_buf_get_name(buf) == "zuzu///editor"
    end
	},
}
