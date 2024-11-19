return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = true,
  event = { "BufReadPre", "InsertEnter" },
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "kotlin",
        "java",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
