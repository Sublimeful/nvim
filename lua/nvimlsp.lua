-- Server config
servers = { 'bashls', 'clangd', 'rust_analyzer', 'pylsp', 'lua_ls', 'jdtls', 'tsserver', 'html', 'cssls' }

-- Additional servers
local Path = require("plenary.path")
local Scan = require("plenary.scandir")
local custom_servers = Scan.scan_dir(vim.fn.expand("$HOME") .. "/.local/share/nvim/lsp_servers")
for i = 1, #custom_servers, 1 do
  local server_path = Path:new(custom_servers[i])
  dofile(server_path:absolute())
end

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

-- Setup lsp for each server
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = on_attach,
    handlers = handlers,
  }
end

-- Setup mason, the lsp installer
require("mason").setup()
