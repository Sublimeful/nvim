-- Local config
local border_style = "single"

-- Define options for mappings
local opts = { noremap = true, silent = true }

-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.api.nvim_set_keymap("n", ",E", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", ",R", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", ",C", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

-- Configure diagnostics
vim.diagnostic.config({
  float = { border = border_style },
})

-- Define handlers
local handlers = {
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border_style }),
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border_style }),
}

-- Load custom lsp setup configs
local custom_setup_configs_path = vim.fn.stdpath("data") .. "/custom/lsp_setup_configs.lua"
local custom_setup_configs = {}
if vim.fn.filereadable(custom_setup_configs_path) == 1 then
  local setup_configs = dofile(custom_setup_configs_path)
  if type(setup_configs) == "table" then
    custom_setup_configs = setup_configs
  end
end

-- Default LSP handler
local function lsp_handler(server_name)
  local setup_configs = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = on_attach,
    handlers = handlers,
  }

  if type(custom_setup_configs[server_name]) == "table" then
    setup_configs = vim.tbl_deep_extend("force", setup_configs, custom_setup_configs[server_name])
  end

  require("lspconfig")[server_name].setup(setup_configs)
end

-- Load custom lsp servers
local custom_servers_path = vim.fn.stdpath("data") .. "/custom/lsp_servers.lua"
if vim.fn.filereadable(custom_servers_path) == 1 then
  local custom_servers = dofile(custom_servers_path)
  if type(custom_servers) == "table" then
    for _, server_name in ipairs(custom_servers) do
      lsp_handler(server_name)
    end
  end
end

-- Setup mason, the lsp installer
require("mason").setup()

-- Setup mason-lspconfig for convenience with lspconfig
require("mason-lspconfig").setup()

-- Setup mason-lspconfig setup_handlers
require("mason-lspconfig").setup_handlers({ lsp_handler })
