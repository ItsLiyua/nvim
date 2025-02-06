local utils = require("utils")
local M = {
	ft = {},
	treesitter = nil,
	lsp = {},
	dap = nil,
	formatters = {},
}
M.__index = M

M.new = function(config)
	local instance = setmetatable(config, M)
	utils.send_log("Intialized new language.")
	return instance
end

return M
