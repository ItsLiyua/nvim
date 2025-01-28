return {
	"tadaa/vimade",
	-- enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local vm = require("vimade")
		vm.setup({
			recope = { "default", { animate = false } },
			fadelevel = 0.7,

			blocklist = { default = function(win,active)
        local syn = win.buf_opts.syntax
        local blocked = {
          "neo-tree",
          "lazy"
        }
        return vim.tbl_contains(blocked, syn)
      end },
		})
		require("vimade.focus.api").toggle_on()
	end,
}
