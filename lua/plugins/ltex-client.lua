return {
	"icewind/ltex-client.nvim",
  -- enabled = false,
	ft = { "tex", "markdown" },
	opts = {
    user_dictionaries_path = vim.fn.stdpath("data").."/ltex_client/dictionaries"
  },
}
