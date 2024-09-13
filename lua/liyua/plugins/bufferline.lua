return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    require("bufferline").setup {
      options = {
        mode = "buffers",
        offsets = {
          {
            filetype = "NvimTree",
            text = function()
              return vim.fn.getcwd()
            end,
            highlight = "Directory",
            text_align = "left"
          }
        }
      },
      highlights = {
        buffer_selected = { italic = false },
        diagnostic_selected = { italic = false },
        hint_selected = { italic = false },
        pick_selected = { italic = false },
        pick_visible = { italic = false },
        pick = { italic = false },
      },
    }

    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycles to the next tab" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycles to the previous tab" })
  end
}
