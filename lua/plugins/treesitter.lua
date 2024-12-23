return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "lua",

        "kotlin",
        "java",

        "hyprlang",
        "yuck",

        "latex",
        "markdown",

        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",

        "toml",
        "json",
        "yaml",
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
  cmd = { "TSInstall" },
  dependencies = { "windwp/nvim-ts-autotag" },
}
