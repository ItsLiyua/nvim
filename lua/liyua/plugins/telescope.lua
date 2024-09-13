return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  keys = {
    { "<leader>ff", function() require('telescope.builtin').find_files() end, desc = "Find files" },
    { "<leader>fg", function() require('telescope.builtin').live_grep() end, desc = "Find phrases (grep)" },
    { "<leader>fb", function() require('telescope.builtin').buffers() end, desc = "Find buffers" },
  },
}
