local langs = {
	require("languages.kotlin"),
}

local M = {}

M.ts_ensure_installed = {}
M.lsp_configs = {}
M.dap_configs = {}
M.confrom_formatters = {}
M.conform_formatter_opts = {}
M.mti_tools = {}

local function parseTS(lang)
	local ts = lang.treesitter
	if ts ~= nil and ts ~= "" then
		M.ts_ensure_installed[#M.ts_ensure_installed + 1] = ts
	end
end

local function parseFmt(lang)
	local fts = lang.ft
	local fmts = lang.formatters
	for fmt, _ in pairs(fmts) do
for _,ft in pairs(fts) do
		if M.confrom_formatters[ft] == nil then
			M.confrom_formatters[ft] = {fmt}
		else
			M.confrom_formatters[ft] = vim.tbl_extend("force", M.confrom_formatters[ft], {fmt})
		end
		M.mti_tools = vim.tbl_extend("force", M.mti_tools, { fmt })
    end
	end

	M.conform_formatter_opts = vim.tbl_extend("error", M.conform_formatter_opts, fmts)
end

for _, lang in pairs(langs) do
	parseTS(lang)
	parseFmt(lang)
end

return M
