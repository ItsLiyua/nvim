return {
	"rmagatti/auto-session",
	init = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
	opts = {
		auto_restore = false,
		auto_save = true,
		auto_create = true,
		auto_session_suppress_dirs = { "~/", "~/Code", "~/Downloads", "~/Documents", "~/Desktop" },
	},
	keys = {
		{ "<leader>qr", "<cmd>SessionRestore<CR>", desc = "Restore previous session" },
		{ "<leader>qs", "<cmd>SessionSave<CR>", desc = "Save current session" },
	},
	cmd = { "SessionRestore", "SessionSave" },
	event = { "ExitPre" },
}
