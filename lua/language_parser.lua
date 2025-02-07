local langs = {
  require("languages.kotlin"),
  require("languages.lua"),
  require("languages.latex"),
  require("languages.ts"),
}

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
  end
end

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
    for _, ft in pairs(fts) do
      if M.confrom_formatters[ft] == nil then
        M.confrom_formatters[ft] = { fmt }
      else
        M.confrom_formatters[ft] = vim.tbl_extend("force", M.confrom_formatters[ft], { fmt })
      end
      M.mti_tools = vim.tbl_extend("force", M.mti_tools, { fmt })
    end
  end

  M.conform_formatter_opts = vim.tbl_extend("error", M.conform_formatter_opts, fmts)
end

local function parseLsp(lang)
  local lsps = lang.lsp
  for _, lsp in pairs(lsps) do
    if not vim.tbl_contains(M.mti_tools, lsp.name) then
      M.mti_tools[#M.mti_tools + 1] = lsp.name
    end
    M.lsp_configs[#M.lsp_configs + 1] = lsp
  end
end

for _, lang in pairs(langs) do
  addFt(lang)
  parseTS(lang)
  parseFmt(lang)
  parseLsp(lang)
end

return M
