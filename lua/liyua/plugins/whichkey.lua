return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>e", group = "Explorer..." },
      { "<leader>f", group = "Find..." },
      { "<leader>o", group = "Misc options" },
      { "<leader>s", group = "Split..." },
      { "<leader>t", group = "Tabs..." },
      { "<leader>c", group = "Code..." },
      { "<leader>w", group = "Session..." }
    })
  end
}
