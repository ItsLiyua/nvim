return {
  {
    'hrsh7th/cmp-nvim-lsp',
    name = 'cmp-nvim-lsp',
  },
  {
    'windwp/nvim-autopairs',
    name = 'autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'L3MON4D3/LuaSnip',
    name = 'luasnip',
    dependencies = {
      {
        'saadparwaiz1/cmp_luasnip',
        name = 'cmp_luasnip',
      },
      {
        'rafamadriz/friendly-snippets',
        name = 'friendly-snippets',
      },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    name = 'nvim-cmp',
    config = function()
      -- Set up nvim-cmp.
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = {
          ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  select = false,
                })
              end
            else
              fallback()
            end
          end),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })
      })
    end,
  },
}
