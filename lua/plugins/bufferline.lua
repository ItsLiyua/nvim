return {
  'akinsho/bufferline.nvim',
  name = 'bufferline',
  tag = '*',
  requires = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup({
      options = {
        indicator = { style = 'underline' },
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left'
          },
        },
      },
      highlights = {
        indicator_selected = { sp = '#E06C75' },
        buffer_selected = { sp = '#E06C75' },
        close_button_selected = { sp = '#E06C75' },
        numbers_selected = { sp = '#E06C75' },
        modified_selected = { sp = '#E06C75' },
      }
    })
    vim.keymap.set('n', '<Tab>', ':bn<CR>')
    vim.keymap.set('n', '<S-Tab>', ':bp<CR>')
  end
}
