return {
	"jbyuki/nabla.nvim",
	ft = { "markdown", "latex" },
	keys = {
		{
			"<leader>mp",
			function()
				require("nabla").popup()
			end,
			desc = "Render inline math",
		},
	},
}
