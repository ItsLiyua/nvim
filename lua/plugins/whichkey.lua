return {
	"folke/which-key.nvim",
	event = { "BufAdd", "BufReadPre", "BufNewFile" },
	config = function()
		local wk = require("which-key")
		wk.setup({ preset = "helix", delay = 1000 })

		wk.add({
			{
				"<leader>?",
				function()
					wk.show({ global = false })
				end,
				desc = "Show keymap",
				icon = { icon = "󰌌", color = "yellow" },
			},
			{ "<leader>b", group = "Buffers...", icon = { icon = "", color = "blue" } },
			{ "<leader>c", group = "Code...", icon = { icon = "", color = "blue" } },
			{ "<leader>d", group = "Diagnostics...", icon = { icon = "", color = "blue" } },
			{ "<leader>f", group = "Files...", icon = { icon = "", color = "blue" } },
			{ "<leader>g", group = "Go to...", icon = { icon = "", color = "blue" } },
			{ "<leader>m", group = "Miscellaneous...", icon = { icon = "󱁤", color = "blue" } },
			{ "<leader>n", group = "Notifications...", icon = { icon = "", color = "blue" } },
			{ "<leader>o", icon = { icon = "󰅪", color = "yellow" } },
			{ "<leader>q", group = "Session...", icon = { icon = "󰦛", color = "blue" } },
			{ "<leader>r", group = "Run...", icon = { icon = "", color = "blue" } },
			{ "<leader>s", group = "Split...", icon = { icon = "", color = "blue" } },
			{ "<leader>t", group = "Terminal...", icon = { icon = "", color = "blue" } },
			{ "<leader>v", group = "VCS...", icon = { icon = "", color = "blue" } },
		})
	end,
}
