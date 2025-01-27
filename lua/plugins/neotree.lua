return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		event_handlers = {
			{
				event = "file_open_requested",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = true,
	keys = {
		{ "<C-n>", "<cmd>:Neotree filesystem reveal left<CR>", desc = "Filesystem" },
		{ "<leader>fe", "<cmd>:Neotree filesystem reveal left<CR>", desc = "Filesystem" },
	},
	cmd = { "Neotree" },
}
