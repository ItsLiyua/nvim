return {
  "lervag/vimtex",
  lazy = true,
  ft = { "latex" },
  init = function()
    vim.g.vimtex_view_method = "zathura"
  end
}
