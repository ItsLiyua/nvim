return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format file",
    },
  },
  cmd = { "ConformInfo" },
  ft = require("language_parser").fts,
  config = function()
    require("conform").setup({
      formatters_by_ft = require("language_parser").conform_formatters,
      formatters = require("language_parser").conform_formatter_opts,
      format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
    })
  end,
}
