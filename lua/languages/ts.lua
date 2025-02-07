return require("api.language").new({
  ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  treesitter = "typescript",
  formatters = {
    prettierd = {}
  },
  lsp = { { name = "ts_ls" } },
})
