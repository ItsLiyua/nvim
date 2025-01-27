return {
	"folke/which-key.nvim",
	event = { "BufAdd", "BufReadPre", "BufNewFile" },
	config = function()
		local wk = require("which-key")
		wk.setup({ preset = "helix", delay = 1000 })

		wk.add({
			"<leader>?",
			function()
				wk.show({ global = false })
			end,
			desc = "Show keymap",
			icon = { icon = "󰌌", color = "yellow" },
		})
	end,
}
