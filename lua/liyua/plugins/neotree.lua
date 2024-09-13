return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  keys = { { "<leader>e", "<cmd>Neotree focus filesystem<cr>", desc = "Open the explorer" } },
  cmd = "Neotree",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end
      }
    }
  }
}
