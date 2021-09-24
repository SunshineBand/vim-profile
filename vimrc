call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Languages

Plug 'andreshazard/vim-freemarker'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'lervag/vimtex'
Plug 'OmniSharp/omnisharp-vim'

" Color Schemes and Visuals

Plug 'nerdypepper/agila.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

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
let g:airline#extensions#vimtex#enabled=1

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
set rtp+=/usr/local/opt/fzf

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"

syntax on
set number
set relativenumber

if (has("termguicolors"))
  set termguicolors
endif

let ayucolor="dark"
colorscheme ayu

nnoremap <C-f> :Files<CR>
nnoremap <C-p> :NERDTree<CR>
