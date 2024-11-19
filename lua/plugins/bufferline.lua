return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = true,
  event = { "BufReadPre", "InsertEnter" },
  opts = {
    options = {
      seperator_style = "slant",
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "center"
        }
      }
    },
  },
}
