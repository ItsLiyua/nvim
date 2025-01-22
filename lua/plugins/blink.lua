return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    event = { "BufReadPre", "InsertEnter" },
    opts = {
      keymap = {
        preset = "super-tab",
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = {
          -- 'lsp',
          "path",
          "snippets",
          "buffer",
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
