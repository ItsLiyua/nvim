return require("liyua.api.language").new({
	ft = { "hyprlang", "**/*.hl" },
	treesitter = "hyprlang",
	formatters = {},
	lsp = { { name = "hyprls" } },
	setup = function()
		vim.filetype.add({
			pattern = {
				[".*/hypr/.*.conf"] = "hyprlang",
				[".*/hypr/.*.hl"] = "hyprlang",
			},
		})
	end,
})
