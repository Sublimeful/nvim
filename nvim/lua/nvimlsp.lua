-- Setup lsp for each server
local servers = { 'pyright', 'tsserver', 'jdtls', 'clangd', 'bashls' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
  }
end

-- Setup mason, the lsp installer
require("mason").setup()
