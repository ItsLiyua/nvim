return {
  'navarasu/onedark.nvim',
  name = 'onedark',
  lazy = false,
  config = function()
    require('onedark').setup({
      style = 'warmer',
      transparent = false,
      ending_tildes = false,
      code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'italic',
        strings = 'none',
        variables = 'none'
      },
      lualine = {
        transparent = false,
      },
      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      }
    })
    require('onedark').load()
  end
}
