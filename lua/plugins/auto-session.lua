return {
	"rmagatti/auto-session",
	opts = {
		auto_restore_enabled = true,
		auto_session_suppress_dirs = { "~/", "~/Code", "~/Downloads", "~/Documents", "~/Desktop" },
	},
	keys = {
		{ "<leader>qr", "<cmd>SessionRestore<CR>", desc = "Restore previous session" },
		{ "<leader>qs", "<cmd>SessionSave<CR>", desc = "Save current session" },
	},
}
