return require('packer').startup(function()

  -- Plugin Manager
  use 'wbthomason/packer.nvim'

  -- Language Server Configs
  use 'neovim/nvim-lspconfig'

  -- LSP Signature Hints
  use 'ray-x/lsp_signature.nvim'

  -- Language Server manager
  use 'williamboman/mason.nvim'

  -- Completion and Code Snippets
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- Code Formatter
  use 'sbdchd/neoformat'

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    requires = 'lewis6991/gitsigns.nvim'
  }

  -- Tabline
  use {
    'alvarosevilla95/luatab.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Theme
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }

  -- Properly indents brackets
  use 'Sublimeful/nvim-brackets'

  -- Quick code comments
  use 'tpope/vim-commentary'

  -- AutoSave to prevent losing work
  use '907th/vim-auto-save'

  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons'
  }

end)
