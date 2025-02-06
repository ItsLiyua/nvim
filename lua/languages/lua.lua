return require("api.language").new({
	ft = { "lua" },
	treesitter = "lua",
	formatters = {
    stylua = {}
	},
})
