return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons"
  },
  lazy = true,
  keys = {
    { "<leader>ff", function() require('telescope.builtin').find_files() end, desc = "Find files" },
    { "<leader>fg", function() require('telescope.builtin').live_grep() end, desc = "Find phrases (grep)" },
    { "<leader>fb", function() require('telescope.builtin').buffers() end, desc = "Find buffers" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")
  end
}
