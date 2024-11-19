return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua_ls",

        -- Kotlin
        "ktlint",
        "kotlin_language_server",
      },
    },
    dependencies = { { "williamboman/mason.nvim", config = true } },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = { "lua", "kotlin" },
    keys = {
      {
        "K",
        function()
          vim.lsp.buf.hover()
        end,
        desc = "Show description",
      },
      {
        "gD",
        function()
          vim.lsp.buf.declaration()
        end,
        desc = "Go to declaration",
      },
      {
        "gd",
        function()
          vim.lsp.buf.definition()
        end,
        desc = "Go to definition",
      },
      {
        "gi",
        function()
          vim.lsp.buf.implementation()
        end,
        desc = "Go to implementation",
      },
      {
        "gr",
        function()
          vim.lsp.buf.references()
        end,
        desc = "Show references",
      },
      {
        "<leader>rn",
        function()
          vim.lsp.buf.rename()
        end,
        desc = "Rename",
      },
      {
        "<leader>ca",
        function()
          vim.lsp.buf.code_action()
        end,
        desc = "Show code actions",
      },
      {
        "<leader>f",
        function()
          vim.lsp.buf.format({ async = true })
        end,
        desc = "Format file",
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.kotlin_language_server.setup({})
    end,
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        config = function()
          local none_ls = require("null-ls")
          none_ls.setup({
            sources = {
              none_ls.builtins.formatting.stylua,
              none_ls.builtins.formatting.ktlint.with({
                extra_args = { "--editorconfig=~/.config/nvim/ktlint.cfg" },
              }),
            },
          })
        end
      },
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { { "williamboman/mason.nvim", config = true, } },
      },
    },
  },
}
