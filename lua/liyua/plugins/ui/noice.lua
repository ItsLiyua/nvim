return {
	"folke/noice.nvim",
	event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
	keys = {
		{ "n", "<leader>nd", "<cmd>Noice dismiss<CR>", desc = "Dismiss notification" },
		{
			"n",
			"<leader>nh",
			function()
				Snacks.picker.notifications()
			end,
			desc = "View recent notifications",
		},
		{ "n", "<leader>nl", "<cmd>Noice last<CR>", desc = "View recent notifications" },
		{
			"<leader>nD",
			function()
				local n = require("noice")
				vim.g.noiceenabled = not vim.g.noiceenabled
				if vim.g.noiceenabled then
					n.enable()
					vim.notify("Enabled notification popups", vim.log.levels.INFO)
				else
					vim.notify("Disabled notification popups", vim.log.levels.INFO)
					n.disable()
				end
			end,
			desc = "Toggle notification popups",
		},
	},
	init = function()
		vim.g.noiceenabled = true
	end,
	opts = {
		routes = {
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = "msg_show",
					find = "AutoSave: saved at",
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = "msg_show",
					find = " Compilation completed!",
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = "lsp",
					kind = "progress",
					-- cond = function(message)
					-- 	local client = vim.tbl_get(message.opts, "progress", "client")
					-- 	return client == "ltex" or client == "jdtls"
					-- end,
				},
				opts = { skip = true },
			},
		},
		lsp = {
			override = {
				["vim.lsp.util.conver_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = true,
			lsp_doc_border = true,
		},
	},
	dependencies = {
		{ "rcarriga/nvim-notify", opts = { max_width = 75 } },
		"MunifTanjim/nui.nvim",
	},
}
