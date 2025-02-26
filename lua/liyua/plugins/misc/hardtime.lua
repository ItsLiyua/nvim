return {
	"m4xshen/hardtime.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = { disabled_filetypes = require("liyua.utils").non_filetypes },
}
