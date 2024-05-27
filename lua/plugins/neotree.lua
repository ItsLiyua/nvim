return {
  'nvim-neo-tree/neo-tree.nvim',
  name = 'neo-tree',
  branch = 'v3.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim',       name = 'plenary' },
    { 'nvim-tree/nvim-web-devicons', name = 'devicons' },
    { 'MunifTanjim/nui.nvim',        name = 'nui' }
  },
  config = function()
    require('neo-tree').setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            '.git',
            '.DS_Store',
            'thumbs.db',
          },
        },
      },
    })
    vim.keymap.set('n', '<leader>n', ':Neotree focus<CR>')
  end
}
