return require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'
  use 'williamboman/mason.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'nvim-treesitter/nvim-treesitter'
  use 'sbdchd/neoformat'

  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'alvarosevilla95/luatab.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }

  use 'Sublimeful/nvim-brackets'

  use 'tpope/vim-commentary'

  use '907th/vim-auto-save'

end)
