return {
	"OXY2DEV/foldtext.nvim",
	event = { "BufReadPost", "FileReadPost" },
	opts = {
		default = {
			{
				type = "custom",
				handler = function(_, buf)
					local ln = table.concat(vim.fn.getbufline(buf, vim.v.foldstart))
					return { ln, "Title" }
				end,
			},
			{ type = "raw", text = " -- ", hl = "Comment" },
			{ type = "fold_size", hl = "Comment" },
			{ type = "raw", text = " Lines folded", hl = "Comment" },
		},
	},
}
