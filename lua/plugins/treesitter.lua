return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "kotlin",
        "java",
        "hyprlang",
      },
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<C-S-space>",
        },
      },
    })
  end,
  build = ":TSUpdate",
  lazy = true,
  event = { "BufReadPre", "InsertEnter" },
  dependencies = { "windwp/nvim-ts-autotag" },
}
