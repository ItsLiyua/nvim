return {
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
					Snacks.picker.smart()
				end,
			},
			{
				icon = " ",
				key = "g",
				desc = "Find String",
				action = function()
					Snacks.picker.grep()
				end,
			},
			{
				icon = " ",
				key = "r",
				desc = "Restore session",
				action = "<cmd>SessionRestore<CR>",
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
}
