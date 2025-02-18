return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>v",
			function()
				Snacks.lazygit.open()
			end,
			desc = "Open git UI",
		},
	},
	---@type snacks.Config
	opts = {
		animate = { enabled = true },
		bigfile = {
			notify = true,
			size = 1.5 * 1024 * 1024,
			line_length = 1000,
			setup = function(ctx)
				if vim.fn.exists(":NoMatchParen") ~= 0 then
					vim.cmd([[NoMatchParen]])
				end
				require("snacks").util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
				vim.b.minianimate_disable = true
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(ctx.buf) then
						vim.bo[ctx.buf].syntax = ctx.ft
					end
				end)
			end,
		},
		dashboard = {
			enabled = true,
			preset = {
				header = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
 ]],
				keys = {
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ action = "Neotree", desc = "File Manager", icon = " ", key = "t" },
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = function()
							require("telescope").extensions.smart_open.smart_open({ cwd_only = true })
						end,
					},
					{
						icon = " ",
						key = "g",
						desc = "Find String",
						action = function()
							require("telescope.builtin").live_grep()
						end,
					},
					{ icon = " ", key = "r", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
					},
					{
						icon = "󱊈 ",
						key = "m",
						desc = "Mason",
						action = ":Mason",
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = { enabled = false },
		indent = {
			enabled = true,
			char = "│",
			hl = "SnacksIndent",
			animate = {
				enabled = vim.fn.has("nvim-0.10") == 1,
				style = "out",
				easing = "linear",
				duration = {
					step = 20,
					total = 200,
				},
			},
			filter = function(buf)
				return vim.g.snacks_indent ~= false
					and vim.b[buf].snacks_indent ~= false
					and vim.bo[buf].buftype == ""
					and not vim.tbl_contains(require("utils").non_filetypes, vim.bo[buf].filetype)
			end,
		},
		image = { enabled = true },
		input = {
			enabled = true,
			icon = " ",
			icon_hl = "SnacksInputIcon",
			icon_pos = "left",
			prompt_pos = "left",
			win = { style = "input" },
			expand = true,
		},
		lazygit = { enabled = true, configure = true },
		picker = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
