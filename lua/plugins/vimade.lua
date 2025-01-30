return {
	"tadaa/vimade",
	-- enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local vm = require("vimade")
		vm.setup({
			fadelevel = 0.75,

			blocklist = {
				statusbar = { highlights = { "/^lualine.*/" } },
				windows = function(win, active)
					return vim.tbl_contains(require("utils").non_filetypes, win.buf_opts.syntax)
				end,
			},
		})
		require("vimade.focus.api").toggle_on()
	end,
}
