return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious"
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Move to left split" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Move to lower split"},
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Move to uppder split" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Move to right split" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Move to previous split" }
  },
}
