return {
  "rmagatti/auto-session",
  opts = {
    auto_restore_enabled = false,
    auto_session_suppress_dirs = { "~/", "~/Code", "~/Downloads", "~/Documents", "~/Desktop" },
  },
  lazy = true,
  keys = {
    { "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore previous session" },
    { "<leader>ws", "<cmd>SessionSave<CR>",    desc = "Save current session" },
  },
}
