return {
  {
    'williamboman/mason.nvim',
    name = 'mason',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    name = 'meson-lspconfig',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls', -- Lua
          'java_language_server', -- Java
          'kotlin_language_server', -- Kotlin
          'ltex', -- LaTeX
          'marksman', -- Markdown
        },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    name = 'nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.java_language_server.setup({})
      lspconfig.kotlin_language_server.setup({})
      lspconfig.ltex.setup({
        settings = {
          ltex = {
            language = 'de-DE',
          },
        },
      })
      lspconfig.marksman.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- Show docs
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) -- Show definition
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {}) -- Show declaration
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {}) -- Code Adction
    end,
  }
}


