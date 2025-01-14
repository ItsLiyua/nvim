return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      latex = {
        enabled = true,
        render_modes = true,
      },
    },
    config = function()
      require("render-markdown").enable()
    end,
  },
  {
    "jbyuki/nabla.nvim",
    ft = { "markdown" },
    keys = {
      {
        "<leader>mp",
        function()
          require("nabla").popup()
        end,
        desc = "Render inline math",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
