local utils = require("lsp.utils")

local server_configs = {
	bashls = utils.base_config_no_format,
	kotlin_language_server = utils.base_config_no_format,
	lua_ls = require("lsp.lua").config,
	yamlls = require("lsp.yaml").config,
	jsonls = require("lsp.json").config,
	hyprls = utils.base_config,
	ltex = require("lsp.latex").config,
}

local mason_lspconfig = require("mason-lspconfig")

local function get_servers_to_install()
	local server_names_configured = vim.tbl_keys(server_configs)
	local server_names_available = mason_lspconfig.get_mappings().lspconfig_to_mason

	return vim.tbl_filter(function(name)
		return server_names_available[name] ~= nil
	end, server_names_configured)
end

local function tbl_insert(tbl, val)
	local present = false
	for _, v in pairs(tbl) do
		if v == val then
			present = true
			break
		end
	end
	if not present then
		tbl[#tbl + 1] = val
	end
end

local function tbl_values_deep(table)
	local values = {}
	for _, value in pairs(table) do
		if type(value) == "table" then
			for _, v in pairs(value) do
				tbl_insert(values, v)
			end
		else
			tbl_insert(values, value)
		end
	end
	return values
end

local function get_formatters_to_install()
	local formatters = require("lsp.conform").formatters_by_ft
	return tbl_values_deep(formatters)
end

mason_lspconfig.setup({ ensure_installed = get_servers_to_install() })

local mti = require("mason-tool-installer")
mti.setup({ ensure_installed = get_formatters_to_install() })
vim.defer_fn(function()
	mti.check_install(true, true)
end, 0)

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

use_icons_for_diagnostic_signs()
