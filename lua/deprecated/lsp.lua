return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- require("language_config/lsp")
	end,
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", config = true },
		{
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- Will be merged with base neovim soon. Then the plugin can be removed.
			config = function()
				vim.keymap.set("n", "<leader>dt", function()
					require("lsp_lines").toggle()
				end, { desc = "Toggle virtual diagnostics text" })
			end,
		},
		"antosha417/nvim-lsp-file-operations",
	},
}
