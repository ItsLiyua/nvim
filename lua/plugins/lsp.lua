return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lsp")
  end,
  dependencies = {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
        config = true,
    },
    {
      "stevearc/conform.nvim",
      event = { "BufWritePre" },
      keys = { { "<leader>F", function() require("conform").format({ async = true, lsp_fallback = true }) end, mode = { "n", "v" }, desc = "Format file" } },
      opts = {
        formatters_by_ft = require("lsp.conform").formatters_by_ft,
        format_on_save = {
          lsp_format = "fallback",
          timeout_ms = 500,
        }
      }
    },
    { "williamboman/mason-lspconfig.nvim", config = true },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  }
}
