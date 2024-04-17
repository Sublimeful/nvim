-- Bootstrap lazy.nvim (Plugin Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- List of plugins
local plugins = {
  -- Language Server Configs
  'neovim/nvim-lspconfig',
  -- LSP Signature Hints
  'ray-x/lsp_signature.nvim',
  -- Language Server manager
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- Completion and Code Snippets
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  { 'hrsh7th/cmp-path', lazy = false },
  { 'hrsh7th/cmp-buffer', lazy = false },
  { 'hrsh7th/vim-vsnip', lazy = false },
  -- Code Formatter
  { 'sbdchd/neoformat', lazy = false },
  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "vimdoc", "bash", "c", "cpp", "rust", "python", "lua", "java", "javascript", "typescript", "html", "css" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'lewis6991/gitsigns.nvim' }
  },
  -- Tabline
  {
    'alvarosevilla95/luatab.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' }
  },
  -- Fuzzy Finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Properly indents brackets
  { 'Sublimeful/nvim-brackets' },
  -- Quick code comments
  { 'tpope/vim-commentary', lazy = false },
  -- AutoSave to prevent losing work
  { '907th/vim-auto-save', lazy = false },
  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}

-- Load custom plugins
local custom_plugins_path = vim.fn.stdpath("data") .. "/custom/plugins.lua"
if vim.fn.filereadable(custom_plugins_path) == 1 then
  local custom_plugins = dofile(custom_plugins_path)
  if type(custom_plugins) == "table" then
    for _, plugin in ipairs(custom_plugins) do
      table.insert(plugins, plugin)
    end
  end
end

-- Lazy configuration
local opts = {
  -- Lazy loads all plugins by default
  defaults = { lazy = true },
}

require('lazy').setup(plugins, opts)
