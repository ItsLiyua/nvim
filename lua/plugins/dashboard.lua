return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = function()
		return {
			theme = "doom",
			disable_move = true,
			shortcut_type = "number",
			change_to_vcs_root = true,
			hide = {
				tabline = false,
			},
			config = {
				header = {
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                     ]],
					[[       ████ ██████           █████      ██                     ]],
					[[      ███████████             █████                             ]],
					[[      █████████ ███████████████████ ███   ███████████   ]],
					[[     █████████  ███    █████████████ █████ ██████████████   ]],
					[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
					[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
					[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
				},
				center = {
					{ action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
					{ action = "Neotree", desc = " File Manager", icon = " ", key = "t" },
					{
						action = function()
							require("telescope").extensions.smart_open.smart_open({ cwd_only = true })
						end,
						desc = " Fuzzy Find",
						icon = " ",
						key = "f",
					},
					{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
					{ action = "qa", desc = " Quit", icon = " ", key = "q" },
				},
				footer = {},
			},
		}
	end,
}
