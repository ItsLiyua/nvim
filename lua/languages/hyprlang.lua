return require("api.language").new({
  ft = { "hyprlang", "**/*.hl" },
  treesitter = "hyprlang",
  formatters = {},
  lsp = { { name = "hyprls" } },
  setup = function()
    require("utils").send_log("hyprls")
    vim.filetype.add({
      pattern = {
        [".*/hypr/.*.conf"] = "hyprlang",
        [".*/hypr/.*.hl"] = "hyprlang",
      }
    })
  end
})
