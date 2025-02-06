return {
	"NStefan002/visual-surround.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local pl = require("visual-surround")
		pl.setup({
			use_default_keymaps = false,
		})
		local fn = pl.surround

		local prefix = "s"
		local surround_chars = { "{", "[", "(", "'", '"', "<" }
		for _, key in pairs(surround_chars) do
			vim.keymap.set("v", "<leader>" .. prefix .. key, function()
				fn(key)
			end, { desc = "Surround with " .. key })
		end
		require("which-key").add({
			"<leader>s",
			mode = "v",
			icon = { icon = "󰅪", color = "green" },
			group = "Surround with...",
		})
	end,
	dependencies = { "folke/which-key.nvim" },
}
