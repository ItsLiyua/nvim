return require("liyua.api.language").new({
	ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	treesitter = { "typescript", "tsx" },
	formatters = {
		prettierd = {},
	},
	lsp = {
		{
			name = "ts_ls",
			format = false,
		},
	},
})
