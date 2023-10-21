return require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  -- Tools
  use 'tyru/open-browser.vim'
  use('petertriho/nvim-scrollbar')
  use({
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn['mkdp#util#install']() end,
  })
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'ThePrimeagen/harpoon',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      require("scrollbar.handlers.gitsigns").setup()
    end
  }
  use 'mfussenegger/nvim-dap'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-projectionist'
  use 'renerocksai/telekasten.nvim'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'mickael-menu/zk-nvim'
  use 'rcarriga/nvim-notify'
  use {
    'stevearc/oil.nvim',
    config = function() require('oil').setup() end
  }
  use {
    'akinsho/git-conflict.nvim', tag = "*", config = function()
      require('git-conflict').setup()
    end
  }

  -- Lsp

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'andreshazard/vim-freemarker'
  use 'leafgarland/typescript-vim'
  use 'rust-lang/rust.vim'
  use 'maxmellon/vim-jsx-pretty'
  use 'lervag/vimtex'
  use 'OmniSharp/omnisharp-vim'
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'vim-ruby/vim-ruby'
  use 'slim-template/vim-slim'
  use 'kchmck/vim-coffee-script'

  -- Language Specific

  use 'tpope/vim-rails'
  use 'xuhdev/vim-latex-live-preview'
  use 'tpope/vim-endwise'

  -- Color Schemes and Visuals

  use 'adelarsq/vim-devicons-emoji'
  use 'nvim-telescope/telescope-symbols.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'nerdypepper/agila.vim'
  use 'ellisonleao/gruvbox.nvim'
  use 'vigoux/oak'
  use 'Shatur/neovim-ayu'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'folke/tokyonight.nvim'
  use 'ap/vim-css-color'

end)
