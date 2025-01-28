return {
	"tadaa/vimade",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local vm = require("vimade")
		vm.setup({
			fadelevel = 0.6,

			blocklist = {
				custom = function(win, active)
					local syn = win.buf_opts.syntax
					local blocked = {
						"neo-tree",
						"lazy",
						"mason",
						"dashboard",
					}
					return vim.tbl_contains(blocked, syn)
				end,
			},
		})
		require("vimade.focus.api").toggle_on()
	end,
}
