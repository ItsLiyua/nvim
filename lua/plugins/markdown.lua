return {
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      latex = {
        enable = true,
        inline = {
          enable = true,
        },
        operators = {
          enable = true,
        },
        symbols = {
          enable = true,
          -- symbols not yet in markview
          overwrite = {
            dots = "…",
            quad = "  ",
            [" "] = " ",
            enspace = " ",
            thinspace = "",
            iff = "⇔",
            leftrightarrows = "⇆",
            to = "→",
            forall = "∀",
            emptyset = "∅",
            Chi = "Χ",
            choose = "C",
            coloneqq = "≔",
            E = "E",
            Var = "Var",
          },
        },
      },
    },
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
