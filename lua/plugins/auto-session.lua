return {
	"rmagatti/auto-session",
	opts = {
		auto_restore_enabled = true,
		auto_session_suppress_dirs = { "~/", "~/Code", "~/Downloads", "~/Documents", "~/Desktop" },
	},
	keys = {
		{ "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore previous session" },
		{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save current session" },
	},
}
