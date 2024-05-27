return {
  {
    'williamboman/mason.nvim',
    name = 'mason',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    name = 'mason-installer',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          'lua_ls',                 -- Lua LSP
          'stylua',                 -- Lua Formatter

          'java_language_server',   -- Java LSP
          'kotlin_language_server', -- Kotlin LSP
          'ktlint',                 -- Kotlin Linter / Formatter

          'html',                   -- HTML LSP
          'cssls',                  -- CSS LSP
          'prettierd',              -- CSS Formatter

          'ltex',                   -- LaTeX LSP
          'marksman',               -- Markdown LSP
        },
        auto_update = true,
      })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    name = 'meson-lspconfig',
    config = function()
      require('mason-lspconfig').setup()
    end,
  },
  {
    'neovim/nvim-lspconfig',
    name = 'nvim-lspconfig',
    config = function()
      local border = {
        { "🭽", "FloatBorder" },
        { "▔", "FloatBorder" },
        { "🭾", "FloatBorder" },
        { "▕", "FloatBorder" },
        { "🭿", "FloatBorder" },
        { "▁", "FloatBorder" },
        { "🭼", "FloatBorder" },
        { "▏", "FloatBorder" },
      }
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local handlers = {
        ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
        ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = border }),
      }
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({ capabilities = capabilities, handlers = handlers })
      lspconfig.java_language_server.setup({ capabilities = capabilities, handlers = handlers })
      lspconfig.kotlin_language_server.setup({ capabilities = capabilities, handlers = handlers })
      lspconfig.html.setup({ capabilities = capabilities, handlers = handlers })
      lspconfig.cssls.setup({ capabilities = capabilities, handlers = handlers })
      lspconfig.ltex.setup({
        capabilities = capabilities,
        handlers = handlers,
        settings = {
          ltex = {
            language = 'de-DE',
          },
        },
      })
      lspconfig.marksman.setup({ capabilities = capabilities })

      vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, {})                 -- Show docs
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})           -- Show definition
      vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, {})          -- Show declaration
      vim.keymap.set({ 'n', 'v' }, '<leader>ga', vim.lsp.buf.code_action, {}) -- Code Adction
      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})               -- Code Formatting
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    name = 'nonels',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.ktlint,
        null_ls.builtins.diagnostics.ktlint,
        null_ls.builtins.formatting.prettierd,
      })
    end,
  },
}
