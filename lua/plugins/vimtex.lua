return {
  "lervag/vimtex",
  lazy = true,
  ft = { "tex" },
  init = function()
    vim.g.vimtex_view_method = "zathura"
    -- vim.g.vimtex_syntax_conceal_disable = true
    vim.g.vimtex_syntax_conceal = {
      math_fracs = false
    }
  end,
}
