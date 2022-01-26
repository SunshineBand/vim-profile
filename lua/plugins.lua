return require('packer').startup(function()

  use 'wbthomason/packer.nvim'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'airblade/vim-gitgutter'
  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use { 'junegunn/fzf', run = ":lua vim.fn['fzf#install']" }
  use 'junegunn/fzf.vim'

  -- Languages

  use 'andreshazard/vim-freemarker'
  use 'leafgarland/typescript-vim'
  use 'rust-lang/rust.vim'
  use 'maxmellon/vim-jsx-pretty'
  use 'xuhdev/vim-latex-live-preview'
  use 'lervag/vimtex'
  use 'OmniSharp/omnisharp-vim'
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'tpope/vim-rails'
  use 'tpope/vim-endwise'
  use 'vim-ruby/vim-ruby'
  use 'slim-template/vim-slim'
  use 'ap/vim-css-color'

  -- Color Schemes and Visuals

  use 'nerdypepper/agila.vim'
  use 'morhetz/gruvbox'
  use 'ayu-theme/ayu-vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'ryanoasis/vim-devicons'
  use 'kchmck/vim-coffee-script'

end)
