call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Languages

Plug 'andreshazard/vim-freemarker'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Color Schemes

Plug 'nerdypepper/agila.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

call plug#end()

filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
let g:airline_powerline_fonts=1
set list
set lcs+=space:·
let g:NERDTreeWinSize=40

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
set rtp+=/usr/local/opt/fzf

syntax on
set number
set relativenumber

if (has("termguicolors"))
  set termguicolors
endif

let ayucolor="dark"
colorscheme ayu
