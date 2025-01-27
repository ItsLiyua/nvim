local M = {}

local function setup_lsp_keymaps(_client, bufnr)
	require("which-key").add(vim.tbl_map(function(mapping)
		return vim.tbl_extend("force", mapping, { buffer = bufnr })
	end, {
		{
			"K",
			function()
				vim.lsp.buf.hover({ border = "rounded" })
			end,
			desc = "Hover",
		},
		{ "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
		{ "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
		{ "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
		{ "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go to references" },
		{ "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Go to type definition" },
		{ "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename (LSP)" },
		{ "<Leader>dl", "lua vim.diagnostic.open_float()", desc = "Show diagnostics for current line" },
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code actions", mode = { "v", "n" } },
	}))
end

function M.on_attach(client, bufnr)
	vim.bo.omnifunc = "v:lua.vim.lsp.omninc"

	setup_lsp_keymaps()
end

local ok, cmp_capabilities = pcall(function()
	return require("blink.cmp").get_lsp_capabilities()
end)
if ok then
	M.capabilities = cmp_capabilities
else
	M.capabilities = vim.lsp.protocol.make_client_capabilities()
end

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
