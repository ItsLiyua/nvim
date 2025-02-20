return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"mrbjarksen/neo-tree-diagnostics.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"antosha417/nvim-lsp-file-operations",
	},
	keys = {
		{ "<C-n>", "<cmd>Neotree filesystem reveal left<CR>", desc = "Filetree" },
		{ "<leader>fe", "<cmd>Neotree filesystem reveal left<CR>", desc = "Filetree" },
		{ "<leader>xl", "<cmd>Neotree diagnostics reveal left<CR>", desc = "List diagnostics" },
	},
	cmd = { "Neotree" },
	config = function()
		require("neo-tree").setup({
			sources = { "filesystem", "buffers", "git_status", "diagnostics" },
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				group_empty_dirs = true,
			},
			diagnostics = {
				auto_preview = {
					enabled = true,
				},
			},
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
				{
					event = "file_added",
					handler = function()
						require("lazy").load({ plugins = { "new-file-template.nvim" } })
					end,
				},
			},
		})
		require("lsp-file-operations").setup()
	end,
}
