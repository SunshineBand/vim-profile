return require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  -- Tools

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'mfussenegger/nvim-dap'
  use 'vim-test/vim-test'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-projectionist'
  use 'renerocksai/telekasten.nvim'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  -- Lsp

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
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

  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'nerdypepper/agila.vim'
  use 'ellisonleao/gruvbox.nvim'
  use 'vigoux/oak'
  use 'Shatur/neovim-ayu'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'ap/vim-css-color'

end)
