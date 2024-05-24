return {
  { 'navarasu/onedark.nvim', name = 'onedark' },
  { 'nvim-telescope/telescope.nvim', name = 'telescope', tag = '0.1.8', dependencies = { { 'nvim-lua/plenary.nvim', name = 'plenary' } } },
  { 'nvim-treesitter/nvim-treesitter', name = 'treesitter', build = ':TSUpdate' },
  { 'nvim-neo-tree/neo-tree.nvim',
    name = 'neo-tree',
    branch = 'v3.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim', name = 'plenary' },
      { 'nvim-tree/nvim-web-devicons', name = 'devicons' },
      { 'MunifTanjim/nui.nvim', name = 'nui' }
    }
  }
}
