return {
  "nvchad/minty",
  lazy = true,
  dependencies = { "nvchad/volt" },
  keys = { { "<leader>oc", function () require("minty.huefy").toggle() end, desc = "Open color picker" } }
}
