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
let test#strategy = "dispatch"

autocmd StdinReadPre * let s:std_in=1

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"

syntax on
set number
set relativenumber
set inccommand=split

if (has("termguicolors"))
  set termguicolors
endif

let ayucolor="dark"
colorscheme gruvbox

lua require('plugins')
lua require('mason').setup()
lua require("mason-lspconfig").setup()
lua require('language-server')
lua require('debugging')
lua require('treesitter-config')

let mapleader = " "

map Y y$
noremap <leader>y "*y
noremap <leader>Y "*y$
noremap <leader>p "*p
nnoremap <leader>yf :let @* = expand("%")<CR>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>v :TestVisit<CR>

nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <C-p> :NERDTreeFind<CR>
nnoremap <C-l> :GitGutterAll<CR><C-l>
nmap <leader>gn :diffget //3<CR>
nmap <leader>gt :diffget //2<CR>
nmap <leader>gs :G<CR>
nnoremap <leader>ga :A<CR>
nmap <leader>co :copen<CR>
nmap <leader>cn :cnext<CR>
nmap <leader>cp :cprev<CR>
