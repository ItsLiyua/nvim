return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = { { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Show Keymap" } },
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>e", group = "Explorer..." },
      { "<leader>f", group = "Find..." },
    })
  end
}
