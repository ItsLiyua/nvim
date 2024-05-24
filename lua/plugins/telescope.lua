local setup = function()
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<C-p>', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
end

return {
  'nvim-telescope/telescope.nvim',
  name = 'telescope',
  tag = '0.1.8',
  dependencies = {
    {
      'nvim-lua/plenary.nvim',
      name = 'plenary'
    }
  },
  config = setup
}
