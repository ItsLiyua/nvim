return {
  "nvzone/menu",
  dependencies = { "nvzone/volt" },
  lazy = true,
  keys = { { "<C-t>", function() require("menu").open("default") end, desc = "Open context menu" } }
}
