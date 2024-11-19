return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  config = true
  -- ys + motion + char => surround area of motion
  -- ds + char => delete surrounding char
  -- cs + oldchar + newchar => replace old surrounding char with new one
}
