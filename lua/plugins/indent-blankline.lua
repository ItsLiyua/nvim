return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "▎" },
		exclude = { filetypes = { "dashboard" } },
		-- scope = {
		-- 	enabled = true,
		-- 	char = "▎",
		-- 	show_start = true,
		-- 	show_end = true,
		-- },
	},
}
