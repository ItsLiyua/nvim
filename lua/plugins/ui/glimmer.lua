return {
	"rachartier/tiny-glimmer.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		override = {
			search = { enabled = true },
			undo = { enabled = true },
			redo = { enabled = true },
			paste = { enabled = true },
		},
	},
}
