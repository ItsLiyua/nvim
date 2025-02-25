return {
	"folke/lazydev.nvim",
	enabled = false,
	ft = "lua", -- only load on lua files
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
