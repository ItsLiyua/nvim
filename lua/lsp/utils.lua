local M = {}

local function setup_lsp_keymaps(_client, bufnr)
	local function hover()
	end

	require("which-key").add(vim.tbl_map(function(mapping)
		return vim.tbl_extend("force", mapping, { buffer = bufnr })
	end, {
		{ "K", function() vim.lsp.buf.hover({ border = "single" }) end, desc = "Hover" },
    { "g", group = "LSP keybinds" },
		{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
		{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
		{ "gri", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
		{ "grr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go to references" },
		{ "gc", group = "Call hierarchy" },
		{ "gci", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", desc = "Go to incoming calls" },
		{ "gco", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>", desc = "Go to outgoing calls" },
		{ "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Go to type definition" },
		{ "<C-W>gd", "<cmd>tab split | norm gd<CR>", desc = "Go to definition in a new tab" },
		{ "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
		{
			"<Leader>d",
			function()
				vim.diagnostic.open_float()
			end,
			desc = "Show diagnostics for current line",
		},
		{ "gra", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code actions", mode = { "v", "n" } },
		{ "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Show diagnostics in location list" },
	}))
end

function M.on_attach(client, bufnr)
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  setup_lsp_keymaps()
end

local ok, cmp_capabilities = pcall(function() return require("blink.cmp").get_lsp_capabilities() end)
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
    }
  }
})

M.base_config = {
  on_attach = M.on_attach,
  capabilities = M.capabilities
}

return M
