vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath('data') ..'/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")

require('onedark').setup({
  style = 'warmer',
  transparent = false,
  ending_tildes = true,
  code_style = {
    comments = 'italic',
    keywords = 'bold',
    functions = 'italic',
    strings = 'none',
    variables = 'none'
  },
  lualine = {
    transparent = false,
  },
  diagnostics = {
    darker = true,
    undercurl = true,
    background = true,
  }
})
require('onedark').load()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<C-n>', ':Neotree focus<CR>')

local config = require('nvim-treesitter.configs')
config.setup({
  ensure_installed = { 'lua', 'kotlin', 'java', 'html', 'css', 'javascript' },
  highlight = { enable = true, },
  indent = { enable = true, },
})
