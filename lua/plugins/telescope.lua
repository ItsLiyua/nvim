return {
  {
    'nvim-telescope/telescope.nvim',
    name = 'telescope',
    tag = '0.1.8',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
        name = 'plenary'
      }
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>p', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    name = 'telescope-ui-select',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end,
  }
}
