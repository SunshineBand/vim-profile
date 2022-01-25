call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'ap/vim-css-color'

" Color Schemes and Visuals

Plug 'nerdypepper/agila.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'kchmck/vim-coffee-script'

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
let fzflocation = system('which fzf')
set rtp+=fzflocation

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"

syntax on
set number
set relativenumber

if (has("termguicolors"))
  set termguicolors
endif

let ayucolor="dark"
colorscheme gruvbox

" query, ag options, fzf#run options, fullscreen
autocmd VimEnter *
\ command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, <bang>0)

let mapleader = " "

nnoremap <C-f> :Files<CR>
nnoremap <C-p> :NERDTreeFind<CR>
nnoremap <leader>yf :let @* = expand("%")<CR>
nmap <leader>gn :diffget //3<CR>
nmap <leader>gt :diffget //2<CR>
nmap <leader>gs :G<CR>