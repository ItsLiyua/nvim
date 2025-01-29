return {
	"gitpushjoe/zuzu.nvim",
	config = function()
		-- Config does not work with opts parameter only. God knows why.
		require("zuzu").setup({
			build_count = 4,
			display_strategy_count = 1,
			keymaps = {
				build = { { "r1", "r2", "r3", "r4" } },
				reopen = { "rr" },
				new_profile = "r/",
				new_project_profile = "r+",
				edit_profile = "re",
				edit_all_applicable_profiles = "r?",
				edit_all_profiles = "r*",
				edit_hooks = "rh",
				qflist_prev = "r[",
				qflist_next = "r]",
				stable_toggle_qflist = "r\\",
				toggle_qflist = "r|",
			},
			display_strategies = { require("zuzu.display_strategies").split_below },
			zuzu_function_name = "zuzu_cmd",
			prompt_on_simple_edits = false,
			hook_choices_suffix = "__c",
			qflist_as_diagnostic = true,
			reverse_qflist_diagnostic_order = false,
			qflist_diagnostic_error_level = "WARN",
			write_on_run = true,
			fold_profiles_in_editor = true,
		})
	end,
}
