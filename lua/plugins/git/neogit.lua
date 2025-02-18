return {
	"NeogitOrg/neogit",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		graph_style = "kitty",
		telescope_sorter = function()
			return require("telescope").extensions.fzf.native_fzf_sorter()
		end,
		initial_branch_name = "main",
		disable_line_numbers = false,
		disable_relative_line_numbers = true,
	},
	cmd = { "Neogit", "NeogitCommit" },
	keys = {
		{
			"<leader>vc",
			function()
				require("neogit").open({ "commit" })
			end,
			desc = "Open commit window",
		},
		{
			"<leader>vl",
			function()
				require("neogit").open({ "log" })
			end,
			desc = "Open git log",
		},
		{
			"<leader>vp",
			function()
				require("neogit").open({ "push" })
			end,
			desc = "Open git push dialogue",
		},
		{
			"<leader>vP",
			function()
				require("neogit").open({ "pull" })
			end,
			desc = "Open git pull dialogue",
		},
		{
			"<leader>vm",
			function()
				require("neogit").open({ "merge" })
			end,
			desc = "Open git merge dialogue",
		},
	},
}
