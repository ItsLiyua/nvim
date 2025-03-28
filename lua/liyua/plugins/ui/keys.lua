return {
	"NStefan002/screenkey.nvim",
	cmd = { "Screenkey" },
	keys = {
		{ "<leader>mk", "<cmd>Screenkey<CR>", desc = "Toggle keystroke display" },
	},
	opts = {
		show_leader = false,
		disable = { filetypes = { "toggleterm" } },
		win_opts = {
			border = "rounded",
		},
	},
}
