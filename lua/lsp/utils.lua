local M = {}

-- local function setup_lsp_keymaps()

function M.on_attach(client, bufnr)
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
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
  on_attach = M.on_attach
  capabilities = M.capabilities
}

return M
