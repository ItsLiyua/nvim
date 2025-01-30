return {
  "lervag/vimtex",
  ft = { "tex" },
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_syntax_conceal = {
      math_fracs = false,
      accents = true,
    }
    vim.g.vimtex_syntax_custom_cmds = {
    }
    vim.g.vimtex_syntax_custom_cmds_with_concealed_delims = {
      {
        mathmode = true,
        name = "vv",
        concealchar = "v",
        conceal = true,
        optconceal = true,
      },
      {
        mathmode = true,
        name = "br",
        nargs = 1,
        cchar_open = "(",
        cchar_close = ")",
      },
      {
        mathmode = true,
        name = "cbr",
        nargs = 1,
        cchar_open = "{",
        cchar_close = "}",
      },
      {
        mathmode = true,
        name = "csr",
        nargs = 1,
        cchar_open = "[",
        cchar_close = "]",
      },
      {
        mathmode = true,
        name = "abs",
        nargs = 1,
        cchar_open = "|",
        cchar_close = "|",
      },
    }
  end,
}
