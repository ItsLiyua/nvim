return {
	"RRethy/vim-illuminate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("illuminate").configure({
			providers = { "treesitter" },
		})
	end,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
