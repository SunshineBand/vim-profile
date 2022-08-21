return require('packer').startup(function()

  use 'wbthomason/packer.nvim'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'airblade/vim-gitgutter'
  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use { 'junegunn/fzf', run = ":lua vim.fn['fzf#install']" }
  use 'junegunn/fzf.vim'
  use 'vim-test/vim-test'

  -- Lsp

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'

  -- Syntax

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
  use 'morhetz/gruvbox'
  use 'vigoux/oak'
  use 'ayu-theme/ayu-vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'ryanoasis/vim-devicons'
  use 'ap/vim-css-color'

end)
