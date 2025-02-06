local langs = {
	require("languages.kotlin"),
}

local M = {}

M.ts_ensure_installed = {}
M.lsp_configs = {}
M.dap_configs = {}
M.formatters = {}

local function parseTS(lang)
	local ts = lang.treesitter
	if ts ~= nil and ts ~= "" then
		M.ts_ensure_installed[#M.ts_ensure_installed + 1] = ts
	end
end

for _, lang in pairs(langs) do
	parseTS(lang)
end

return M
