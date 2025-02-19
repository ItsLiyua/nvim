local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("liyua.options")
require("liyua.keymap")
local ok, _ = pcall(function()
	require("liyua.language_parser")
end)
if not ok then
	vim.notify("Something went wrong initializing the language parsers!", vim.log.levels.ERROR)
end

require("lazy").setup("liyua.plugins", {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
