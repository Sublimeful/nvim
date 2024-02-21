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
require('lazy').setup({
  -- Language Server Configs
  'neovim/nvim-lspconfig',
  -- LSP Signature Hints
  'ray-x/lsp_signature.nvim',
  -- Language Server manager
  'williamboman/mason.nvim',
  -- Completion and Code Snippets
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  'hrsh7th/vim-vsnip',
  'hrsh7th/vim-vsnip-integ',
  -- Code Formatter
  'sbdchd/neoformat',
  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "bash", "c", "cpp", "rust", "python", "lua", "java", "javascript", "typescript", "html", "css" },
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
  { 'tpope/vim-commentary' },
  -- AutoSave to prevent losing work
  { '907th/vim-auto-save' },
  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
})
