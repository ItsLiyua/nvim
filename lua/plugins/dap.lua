return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = dapui.open
		dap.listeners.before.launch.dapui_config = dapui.open
		dap.listeners.before.event_terminated.dapui_config = dapui.close
		dap.listeners.before.event_exited.dapui_config = dapui.close

		local cfgs = require("lsp.dap").adapter_configs
		for _, config in pairs(cfgs) do
			dap.adapters[config.name] = config.adapter
			dap.configurations[config.name] = config.configuration
		end
	end,
	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Continue code execution",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "Step over function",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "Step into function",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "Step out of function",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle breakpoint",
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint()
			end,
			desc = "Set breakpoint",
		},
		{
			"<leader>dl",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			desc = "Set logpoint",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
			desc = "Not quite sure what this does yet",
		},
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
			desc = "Rerun last debug session",
		},
		{
			"<leader>dh",
			function()
				require("dap.ui.widgets").hover()
			end,
			mode = { "n", "v" },
			desc = "Hover",
		},
		{
			"<leader>dp",
			function()
				require("dap.ui.widgets").preview()
			end,
			mode = { "n", "v" },
			desc = "Preview",
		},
		{
			"<leader>df",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end,
			desc = "Show frames",
		},
		{
			"<leader>ds",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end,
			desc = "Show scopes",
		},
	},
}
