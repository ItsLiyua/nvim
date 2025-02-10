return require("api.language").new({
  ft = { "java" },
  treesitter = "java",
  formatters = { ["google-java-format"] = {} },
  lsp = {
    {
      name = "jdtls",
      config = {
        cmd = { vim.fn.stdpath("data") .. "/mason/packages/jdtls/jdtls", "--java-executable=/usr/lib64/jvm/java-21-openjdk/bin/java" },
        settings = {
          java = {
            format = {
              settings = {
                profile = "GoogleStyle"
              }
            }
          }
        }
      },
    },
  },
})
