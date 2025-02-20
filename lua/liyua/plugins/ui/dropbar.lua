return {
	"Bekaboo/dropbar.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		sources = {
			path = {
				relative_to = function(_, win)
					local filter = {
						"src",
						"src/main/java",
						"src/main/kotlin",
						"src/client/java",
						"src/client/kotlin",
						"lua",
					}
					local pos_filters = {}

					local ok, cwd = pcall(vim.fn.getcwd, win)
					if ok then
						for _, f in pairs(filter) do
							if vim.fn.isdirectory(cwd .. "/" .. f) ~= 0 then
								pos_filters[#pos_filters + 1] = cwd .. "/" .. f
							end
						end
						if #pos_filters > 0 then
							local longest = pos_filters[1]
							for _, f in pairs(pos_filters) do
								if f:len() > longest:len() then
									longest = f
								end
							end
							return longest
						end
					end

					return vim.fn.getcwd(win)
				end,
			},
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
