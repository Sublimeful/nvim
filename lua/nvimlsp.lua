-- Local config
local border_style = 'single'

-- Define options for mappings
local opts = { noremap = true, silent = true }

-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.api.nvim_set_keymap('n', ',E', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',R', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',C', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

-- Configure diagnostics
vim.diagnostic.config {
  float = { border = border_style },
}

-- Define handlers
local handlers = {
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border_style }),
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border_style }),
}

-- Setup mason, the lsp installer
require("mason").setup()

-- Setup mason-lspconfig for convenience with lspconfig
require("mason-lspconfig").setup {
  ensure_installed = { 'bashls', 'clangd', 'rust_analyzer', 'pylsp', 'lua_ls', 'jdtls', 'tsserver', 'html', 'cssls' },
  automatic_installation = true,
}

-- Setup mason-lspconfig setup_handlers
require("mason-lspconfig").setup_handlers {
  -- Default handler
  function (server_name)
    require('lspconfig')[server_name].setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = on_attach,
      handlers = handlers,
    }
  end,
}
