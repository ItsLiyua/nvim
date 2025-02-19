local M = {
	ft = {},
	treesitter = nil,
	lsp = {},
	dap = nil,
	formatters = {},
	setup = nil,
}
M.__index = M

M.new = function(config)
	return setmetatable(config, M)
end

return M
