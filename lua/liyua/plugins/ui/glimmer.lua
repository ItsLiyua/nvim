return {
	"rachartier/tiny-glimmer.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "RedsXDD/neopywal.nvim" },
	config = function()
		-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "None" })
		require("tiny-glimmer").setup({
			override = {
				search = { enabled = true },
				undo = { enabled = true },
				redo = { enabled = true },
				paste = { enabled = true },
			},
			transparency_color = require("neopywal").get_colors().background,
		})
	end,
}
