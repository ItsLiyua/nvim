return {
	"jbyuki/nabla.nvim",
	ft = { "markdown", "latex" },
	dependencies = { "folke/which-key.nvim" },
	config = function()
		require("which-key").add({
			"<leader>mp",
			function()
				require("nabla").popup()
			end,
			desc = "Render inline maths",
			icon = { icon = "󰿉", color = "blue" },
		})
	end,
}
