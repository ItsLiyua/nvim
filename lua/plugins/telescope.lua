return {
	"nvim-telescope/telescope.nvim",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				smart_open = {
					show_scores = true,
					match_algorithm = "fzf",
				},
			},
		})
		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")
		telescope.load_extension("smart_open")
	end,
	lazy = true,
	keys = {
		{
			"<leader><leader>",
			function()
				require("telescope").extensions.smart_open.smart_open({ cwd_only = true })
			end,
			desc = "Fuzzy-find files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Search across all files",
		},
		{
			"<leader>tl",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "List all buffers",
		},
	},
	cmd = { "Telescope" },
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"danielfalk/smart-open.nvim",
			branch = "0.2.x",
			dependencies = {
				"kkharji/sqlite.lua",
				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			},
		},
	},
}
