return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre", "BufNewFile"}
  config = function()
    require("lsp")
  end,
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = true,
      build = ":MasonUpdate"
    },
    { "williamboman/mason-lspconfig.nvim", config = true },
    "WhoIsSethDaniel/mason-tool-installer.nvim"
  }
}
