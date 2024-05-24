local setup = function()
  require('neo-tree').setup({
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  })
  vim.keymap.set('n', '<C-n>', ':Neotree focus<CR>')
end

return {
  'nvim-neo-tree/neo-tree.nvim',
  name = 'neo-tree',
  branch = 'v3.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim', name = 'plenary' },
    { 'nvim-tree/nvim-web-devicons', name = 'devicons' },
    { 'MunifTanjim/nui.nvim', name = 'nui' }
  },
  config = setup
}
