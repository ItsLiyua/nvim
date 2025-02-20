local M = {}

M.log = io.open(vim.fn.stdpath("state") .. "/liyua.log", "w")
M.send_log = function(msg)
	M.log:write(msg .. "\n")
	M.log:flush()
end

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		M.send_log("Exiting neovim. Closing log")
		M.log:close()
	end,
})

M.non_filetypes = {
	"dashboard",
	"lazy",
	"mason",
}

M.kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

return M
