return {
  'akinsho/bufferline.nvim',
  name = 'bufferline',
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
        tab_selected = { sp = '#E06C75' },
        indicator_selected = { sp = '#E06C75' },
        buffer_selected = { sp = '#E06C75' },
        close_button_selected = { sp = '#E06C75' },
        numbers_selected = { sp = '#E06C75' },
        modified_selected = { sp = '#E06C75' },
      }
    })
    vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')
  end
}
