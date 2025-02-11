local langs = {
	require("languages.kotlin"),
	require("languages.lua"),
	require("languages.latex"),
	require("languages.ts"),
	require("languages.java"),
	require("languages.hyprlang"),
	require("languages.bash"),
}

local utils = require("utils")

local M = {
	ts_filetypes = {},
	formatter_filetypes = {},
	lsp_filetypes = {},
	dap_filetypes = {},
	ts_ensure_installed = {},
	lsp_configs = {},
	dap_configs = {},
	conform_fmt_by_ft = {},
	conform_fmt_cfg = {},
	mti_tools = {},
}

local function parseTS(lang)
	local ts = lang.treesitter
	if ts ~= nil and ts ~= "" then
		M.ts_ensure_installed[#M.ts_ensure_installed + 1] = ts
		M.ts_filetypes = vim.tbl_extend("force", M.ts_filetypes, lang.ft)
		utils.send_log("Added Treesitter language: " .. ts)
	end
end

local function parseFmt(lang)
	local filetypes = lang.ft
	local formatters = lang.formatters

	for formatter, config in pairs(formatters) do
		for _, filetype in ipairs(filetypes) do
			if not vim.tbl_contains(M.conform_fmt_by_ft, filetype) then
				M.conform_fmt_by_ft[filetype] = {}
			end
			M.conform_fmt_by_ft[filetype] = vim.tbl_extend("force", M.conform_fmt_by_ft[filetype], { formatter })
		end

		if M.conform_fmt_cfg[formatter] ~= nil then
			utils.send_log(
				'WARN: Formatter "'
					.. formatter('" configured twice. Overwriting with config from "')
					.. filetypes[1]
					.. '"'
			)
		end
		M.conform_fmt_cfg[formatter] = config
		M.formatter_filetypes = vim.tbl_extend("force", M.formatter_filetypes, lang.ft)
		M.mti_tools[#M.mti_tools + 1] = formatter

		utils.send_log("Formatter configured: " .. formatter)
	end
end

local function parseLsp(lang)
	local lsps = lang.lsp
	for _, lsp in pairs(lsps) do
		if not vim.tbl_contains(M.mti_tools, lsp.name) then
			M.mti_tools[#M.mti_tools + 1] = lsp.name
		else
			utils.send_log('WARN: LSP "' .. lsp.name .. '" has two configurations.')
		end

		M.lsp_configs[#M.lsp_configs + 1] = lsp
		if lsp.format ~= nil and not lsp.format then
			lsp.on_attach = function(client, bufnr)
				lsp.on_attach(client, bufnr)
				require("lsp_utils").disable_formatting(client)
			end
		end

		M.lsp_filetypes = vim.tbl_extend("force", M.lsp_filetypes, lang.ft)

		utils.send_log("Configured LSP: " .. lsp.name)
	end
end

local function runSetup(lang)
	if lang.setup ~= nil then
		utils.send_log('Running custom setup for language "' .. lang.ft[1] .. '"')
		lang.setup()
	end
end

for _, lang in pairs(langs) do
	utils.send_log('Initializing language for "' .. lang.ft[1] .. '"')
	parseTS(lang)
	parseFmt(lang)
	parseLsp(lang)
	runSetup(lang)
	utils.send_log('Initialized language for "' .. lang.ft[1] .. '"\n')
end

return M
