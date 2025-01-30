return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<C-n>", "<cmd>:Neotree filesystem reveal left<CR>", desc = "Filetree" },
		{ "<leader>fe", "<cmd>:Neotree filesystem reveal left<CR>", desc = "Filetree" },
	},
	cmd = { "Neotree" },
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			group_empty_dirs = true,
		},
		event_handlers = {
			{
				event = "file_open_requested",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
}
