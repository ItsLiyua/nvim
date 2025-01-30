return {
	"tadaa/vimade",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local vm = require("vimade")
		local blocked = { "tex" }

		vm.setup({
			fadelevel = 0.75,

			blocklist = {
				statusbar = { highlights = { "/^lualine.*/", "/^DropBar.*/" } },
				windows = function(win, active)
					return vim.tbl_contains(
						vim.tbl_extend("force", require("utils").non_filetypes, blocked),
						win.buf_opts.syntax
					)
				end,
			},
		})
		require("vimade.focus.api").toggle_on()
	end,
}
