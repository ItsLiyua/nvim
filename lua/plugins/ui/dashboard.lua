return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
  enabled = false,
	config = function()
		require("dashboard").setup({
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
					{ action = "SessionRestore", desc = " Restore Session", icon = "󰦛 ", key = "r" },
					{
						action = function()
							require("telescope").extensions.smart_open.smart_open({ cwd_only = true })
						end,
						desc = " Fuzzy Find",
						icon = " ",
						key = "f",
					},
					{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
					{ action = "Mason", desc = " Mason", icon = "󱊈 ", key = "m" },
					{ action = "qa", desc = " Quit", icon = " ", key = "q" },
				},
				footer = {},
			},
		})
		vim.defer_fn(function()
			vim.api.nvim_create_autocmd("BufDelete", {
				group = vim.api.nvim_create_augroup("open-dashboard-after-last-buffer-close", { clear = true }),
				callback = function(event)
					for buf = 1, vim.fn.bufnr("$") do
						if buf ~= event.buf and vim.fn.buflisted(buf) == 1 then
							if vim.api.nvim_buf_get_name(buf) ~= "" and vim.bo[buf].filetype ~= "dashboard" then
								return
							end
						end
					end
					require("dashboard"):instance()
				end,
			})
		end, 0)
	end,
}
