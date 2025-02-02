local M = {}
local utils = require("lsp.utils")

M.server_configs = {
	bashls = utils.base_config_no_format,
	kotlin_language_server = utils.base_config_no_format,
	lua_ls = require("lsp.configs.lua").config,
	yamlls = require("lsp.configs.yaml").config,
	jsonls = require("lsp.configs.json").config,
	hyprls = require("lsp.configs.hyprlang").config,
	ltex = require("lsp.configs.latex").config,
	cssmodules_ls = utils.base_config_no_format,
	ts_ls = utils.base_config_no_format,
}

return M
