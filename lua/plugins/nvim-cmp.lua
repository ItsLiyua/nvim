return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          elseif cmp.visible() then
            if cmp.get_selected_entry() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({ select = false })
              end
            else
              fallback()
            end
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          elseif cmp.visible() then
            if luasnip.expandable() then
              luasnip.expand()
            else
              cmp.confirm({ select = true })
            end
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
    })
  end,
  lazy = true,
  event = { "BufReadPre", "InsertEnter" },
  dependencies = {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}
