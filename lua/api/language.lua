local utils = require("utils")
local M = {
	treesitter = nil,
	lsp = {},
	dap = nil,
	formatter = {},
}
M.__index = M

M.new = function(config)
	local instance = setmetatable(config, M)
	utils.send_log("Intialized new language.")
	return instance
end

return M
-- return {
-- 	treesitter = "",
-- 	lsp = {
-- 		{
-- 			name = "",
-- 			cmd = nil, -- {cmd}
-- 			config_base = "default", -- default or defdault_no_fmt
-- 			config = {},
-- 		},
-- 	},
-- 	dap = {
-- 		name = "",
-- 		adapter = nil,
-- 		config = {},
-- 	},
-- 	formatter = {
-- 		["filetype-1"] = { "fmt1", "fmt2" },
-- 		["filetype-2"] = { "fmt3", "fmt4" },
-- 	},
-- }
