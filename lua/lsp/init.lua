local utils = require("lsp.utils")

local server_configs = {
  lua_ls = utils.base_config,
  ts_ls = utils.base_config
}

local mason_lspconfig = require("mason-lspconfig")

local function get_servers_to_install()
  local server_names_configured = vim.tbl_keys(server_configs)
  local server_names_available = mason_lspconfig.get_mappings().lspconfig_to_mason

  return vim.tbl_filter(function(name)
    return server_names_available[name] ~= nil
  end, server_names_configured)
end

mason_lspconfig.setup({
  ensure_installed = get_servers_to_install()
})

local lspconfig = require("lspconfig")
local function setup_lsp()
  for name, config in pairs(server_configs) do
    lspconfig[name].setup(config)
  end
end

setup_lsp()

vim.diagnostic.config({
	float = {
		scope = "line",
		source = true,
		border = "single",
	},
	jump = {
		wrap = false,
	},
})

local function use_icons_for_diagnostic_signs()
	local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

