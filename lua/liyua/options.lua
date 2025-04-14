vim.g.mapleader = " "

vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.opt.backspace = "indent,eol,start"

vim.opt.clipboard:append("unnamedplus")

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.conceallevel = 2
vim.opt.concealcursor = ""

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 20

vim.opt.cursorline = true

vim.opt.autoread = true

local sev = vim.diagnostic.severity
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = false,
	signs = {
		text = {
			[sev.ERROR] = "󰅚 ",
			[sev.WARN] = "󰀪 ",
			[sev.INFO] = " ",
			[sev.HINT] = "󰌶 ",
		},
	},
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 2
vim.opt.foldnestmax = 4
vim.opt.foldcolumn = "0"
