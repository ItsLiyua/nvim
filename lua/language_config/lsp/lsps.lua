local M = {}
local utils = require("language_config.lsp.utils")

M.server_configs = {
	bashls = utils.base_config_no_format,
	kotlin_language_server = utils.base_config_no_format,
	lua_ls = require("language_config.lsp.configs.lua").config,
	yamlls = require("language_config.lsp.configs.yaml").config,
	jsonls = require("language_config.lsp.configs.json").config,
	hyprls = require("language_config.lsp.configs.hyprlang").config,
	ltex = require("language_config.lsp.configs.latex").config,
	cssmodules_ls = utils.base_config_no_format,
	ts_ls = utils.base_config_no_format,
	jdtls = require("language_config.lsp.configs.java").config,
}

return M
