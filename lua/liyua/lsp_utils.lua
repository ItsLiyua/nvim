local M = {}

M.hover = function()
	---@diagnostic disable-next-line: redundant-parameter
	vim.lsp.buf.hover({ border = "rounded" })
end

---@diagnostic disable-next-line: unused-local
M.setup_lsp_keymaps = function(_client, bufnr)
	local keys = {
		{ "K", M.hover, desc = "Hover" },
		{ "<leader>gD", vim.lsp.buf.declaration, desc = "Go to declaration" },
		{ "<leader>gd", Snacks.picker.lsp_definitions, desc = "Go to definition" },
		{ "<leader>gi", Snacks.picker.lsp_implementations, desc = "Go to implementation" },
		{ "<leader>gr", Snacks.picker.lsp_references, desc = "Go to references", nowait = true },
		{ "<leader>gt", Snacks.picker.lsp_type_definitions, desc = "Go to type definition" },
		{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename (LSP)" },
		{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions", mode = { "v", "n" } },
	}

	for _, key in pairs(keys) do
		local mode = key.mode or "n"
		local combination = key[1]
		local action = key[2]
		local desc = key.desc
		local nw = key.nowait or false
		vim.keymap.set(mode, combination, action, { desc = desc, buffer = bufnr, nowait = nw, remap = true })
	end
end
local function setup_document_highlight(client)
	if not client.supports_method("textDocument/documentHighlight") then
		return
	end
end

---@diagnostic disable-next-line: unused-local
function M.on_attach(client, bufnr)
	vim.bo.omnifunc = "v:lua.vim.lsp.omninc"

	M.setup_lsp_keymaps()
	setup_document_highlight(client)
end

M.capabilities = require("blink.cmp").get_lsp_capabilities()

M.capabilities = vim.tbl_deep_extend("force", M.capabilities, {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
})

function M.run_all(...)
	local fns = { ... }

	return function(...)
		for _, fn in ipairs(fns) do
			fn(...)
		end
	end
end

function M.disable_formatting(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

M.base_config = {
	on_attach = M.on_attach,
	capabilities = M.capabilities,
}

M.base_config_no_format = vim.tbl_extend("force", M.base_config, {
	on_attach = M.run_all(M.disable_formatting, M.on_attach),
})

return M
