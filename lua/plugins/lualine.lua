return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "RedsXDD/neopywal.nvim" },
	event = { "BufReadPre", "BufNewFile", "BufAdd" },
	opts = {
		options = {
			globalstatus = false,
			theme = "neopywal",
		},
		sections = {
			lualine_x = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
				},
				{ "encoding" },
				{ "fileformat" },
				{ "filetype" },
			},
		},
	},
}
