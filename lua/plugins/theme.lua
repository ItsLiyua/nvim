return {
  "RedsXDD/neopywal.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    use_wallust = true,
    transparent_background = true,
    plugins = {
      dropbar = {
        enabled = true,
        colored_text = true,
      },
      lazy = true,
      mason = true,
      markdown = true,
      neotree = true,
      nvim_cmp = true,
      lsp = {
        enabled = true,
        virtual_text = {
          errors = { "bold", "italic" },
          hints = { "bold", "italic" },
          information = { "bold", "italic" },
          ok = { "bold", "italic" },
          warnings = { "bold", "italic" },
          unnecessary = { "bold", "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          information = { "undercurl" },
          ok = { "undercurl" },
          warnings = { "undercurl" },
        },
        inlay_hints = {
          background = true,
          style = { "bold", "italic" },
        },
      },
      surround = true,
      treesitter = true,
      telescope = { enabled = true, style = "nvchad" },
      trouble = true,
      which_key = true,
    },
  },
  init = function()
    vim.cmd.colorscheme("neopywal-dark")
  end,
}