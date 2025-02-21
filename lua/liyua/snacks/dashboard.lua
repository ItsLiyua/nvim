-- TODO: Fix this broken autocmd:

-- vim.api.nvim_create_autocmd("BufDelete", {
-- 	callback = function(event)
-- 		local buffers = 0
-- 		for _, buf in pairs(vim.api.nvim_list_bufs()) do
-- 			local ft = vim.bo[buf].filetype
-- 			if ft ~= "" and ft ~= nil and not vim.list_contains(require("liyua.utils").non_filetypes, ft) then
-- 				buffers = buffers + 1
-- 			end
-- 		end
-- 		if buffers <= 1 then
-- 			Snacks.dashboard().current.open()
-- 		end
-- 	end,
-- })
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
			{
				action = function()
					Snacks.explorer.reveal()
				end,
				desc = "File Manager",
				icon = " ",
				key = "t",
			},
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
