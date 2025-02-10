local langs = {
	require("languages.kotlin"),
	require("languages.lua"),
	require("languages.latex"),
	require("languages.ts"),
	require("languages.java"),
	require("languages.hyprlang"),
}

local utils = require("utils")

local M = {
	fts = {},
	ts_ensure_installed = {},
	lsp_configs = {},
	dap_configs = {},
	confrom_formatters = {},
	conform_formatter_opts = {},
	mti_tools = {},
}

local function addFt(lang)
	for _, ft in pairs(lang.ft) do
		if not vim.tbl_contains(M.fts, ft) then
			M.fts[#M.fts + 1] = ft
		end
		utils.send_log("Configured Filetype: " .. ft)
	end
end

local function parseTS(lang)
	local ts = lang.treesitter
	if ts ~= nil and ts ~= "" then
		M.ts_ensure_installed[#M.ts_ensure_installed + 1] = ts
		utils.send_log("Added TreeSitter language: " .. ts)
	end
end

local function parseFmt(lang)
	local fts = lang.ft
	local fmts = lang.formatters
	for fmt, _ in pairs(fmts) do
		for _, ft in pairs(fts) do
			if M.confrom_formatters[ft] == nil then
				M.confrom_formatters[ft] = { fmt }
			else
				M.confrom_formatters[ft] = vim.tbl_extend("force", M.confrom_formatters[ft], { fmt })
			end
			M.mti_tools = vim.tbl_extend("force", M.mti_tools, { fmt })
			utils.send_log("Formatter configured: " .. fmt)
		end
	end

	M.conform_formatter_opts = vim.tbl_extend("error", M.conform_formatter_opts, fmts)
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
	addFt(lang)
	parseTS(lang)
	parseFmt(lang)
	parseLsp(lang)
	runSetup(lang)
	utils.send_log('Initialized language for "' .. lang.ft[1] .. '"\n')
end

return M
