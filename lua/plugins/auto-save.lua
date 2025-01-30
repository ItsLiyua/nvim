return {
	"Pocco81/auto-save.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = { { "<leader>mt", "<cmd>ASToggle<CR>", desc = "Toggle autosave" } },
	opts = {
		debounce_delay = 5000,
		condition = function(buf)
			local fn = vim.fn
			local utils = require("auto-save.utils.data")

			if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then -- If buffer is writable
				return not vim.api.nvim_buf_get_name(buf) == "zuzu///editor" -- Check if buffer is a zuzu configuration editor
			end
			return false
		end,
	},
}
