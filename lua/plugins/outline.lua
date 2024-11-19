return {
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineOpen" },
  keys = { { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" } },
  opts = {
    outline_window = {
      position = "right",
      auto_close = true
    },
    symbol_folding = {
      auto_fold = false
    }
  },
}
