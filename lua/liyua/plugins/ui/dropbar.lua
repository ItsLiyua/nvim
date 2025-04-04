return {
	"Bekaboo/dropbar.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		bar = {
			enable = function(buf, win, _)
				if
					not vim.api.nvim_buf_is_valid(buf)
					or not vim.api.nvim_win_is_valid(win)
					or vim.fn.win_gettype(win) ~= ""
					or vim.wo[win].winbar ~= ""
					or vim.bo[buf].ft == "help"
					or vim.bo[buf].ft == "checkhealth"
					or vim.g.liyua_zen_mode_active
				then
					return false
				end
			end,
		},
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

					return ""
				end,
			},
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
