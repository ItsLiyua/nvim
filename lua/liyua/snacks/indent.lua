return {
	enabled = true,
	char = "│",
	hl = "SnacksIndent",
	animate = {
		enabled = vim.fn.has("nvim-0.10") == 1,
		style = "out",
		easing = "linear",
		duration = {
			step = 20,
			total = 200,
		},
	},
	filter = function(buf)
		return vim.g.snacks_indent ~= false
			and vim.b[buf].snacks_indent ~= false
			and vim.bo[buf].buftype == ""
			and not vim.tbl_contains(require("liyua.utils").non_filetypes, vim.bo[buf].filetype)
	end,
}
