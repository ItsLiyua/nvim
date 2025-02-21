return {
	enabled = true,
	ui_select = true,
	sources = {
		explorer = {
			auto_close = true,
			actions = {
				new_add = function(picker)
					require("lazy").load({ plugins = { "new-file-template.nvim" } })
					require("snacks.explorer.actions").actions.explorer_add(picker)
				end,
			},
			win = {
				list = {
					keys = {
						["a"] = "new_add",
					},
				},
			},
		},
	},
}
