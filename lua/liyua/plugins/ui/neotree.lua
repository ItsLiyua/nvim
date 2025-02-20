return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"mrbjarksen/neo-tree-diagnostics.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<C-n>", "<cmd>Neotree filesystem reveal left<CR>", desc = "Filetree" },
		{ "<leader>fe", "<cmd>Neotree filesystem reveal left<CR>", desc = "Filetree" },
		{ "<leader>xl", "<cmd>Neotree diagnostics reveal left<CR>", desc = "List diagnostics" },
	},
	cmd = { "Neotree" },
	config = function()
		local function on_move(data)
			Snacks.rename.on_rename_file(data.source, data.destination)
		end
		local events = require("neo-tree.events")

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
				{ event = events.FILE_MOVED, handler = on_move },
				{ event = events.FILE_RENAMED, handler = on_move },
				{
					event = events.FILE_OPEN_REQUESTED,
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
				{
					event = events.FILE_ADDED,
					handler = function()
						require("lazy").load({ plugins = { "new-file-template.nvim" } })
					end,
				},
			},
		})
	end,
}
