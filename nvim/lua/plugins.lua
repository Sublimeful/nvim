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
    'Sublimeful/nvim-brackets',
    config = function() require('nvim-brackets') end
  }

  use 'tpope/vim-commentary'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use '907th/vim-auto-save'

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "macchiato" -- mocha, macchiato, frappe, latte
      }
    end
  }

end)
