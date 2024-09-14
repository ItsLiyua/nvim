return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    "micangl/cmp-vimtex",
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim"
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = function(fallback)
          if cmp.visible() then
            if not cmp.confirm({ select = false }) then
              fallback()
            end
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end,
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "vimtex" },
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer", keyword_length = 5 }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),
      formatting = {
        format = require("lspkind").cmp_format {
          with_text = true,
          menu = {
            vimtex = "[tex]",
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            path = "[path]",
            luasnip = "[snip]"
          }
        }
      },
      experimental = {
        native_menu = false,
        ghost_text = true
      }
    })
  end,
}
