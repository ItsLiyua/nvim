local M = {}

M.non_filetypes = {
	"dashboard",
	"lazy",
	"mason",
	"neo-tree",
	"neo-tree-popup",
	"TelescopePrompt",
	"/^SignColumn.*/",
	"/^StatusLine.*/",
	"LuaLine",
	"/^LuaLine.*/",
	"WinSeparator", -- Note: unrelated in case you don't need this
	"EndOfBuffer",
	"/^lualine.*/",
}

return M
