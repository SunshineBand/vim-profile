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
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let fzflocation = system('which fzf')
set rtp+=fzflocation

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

" query, ag options, fzf#run options, fullscreen
autocmd VimEnter *
\ command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, <bang>0)

lua require('plugins')
" lua require('language-server')

let mapleader = " "

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" set tags=./tags,tags,~/prj/work/monolith/Shippit/tags
" set tags=./tags,tags;$HOME
set tags=/home/earlgrey/prj/work/monolith/Shippit/tags

map Y y$

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>v :TestVisit<CR>

nnoremap <C-f> :Files<CR>
nnoremap <C-p> :NERDTreeFind<CR>
nnoremap <leader>yf :let @* = expand("%")<CR>
nnoremap <C-l> :GitGutterAll<CR><C-l>
nmap <leader>gn :diffget //3<CR>
nmap <leader>gt :diffget //2<CR>
nmap <leader>gs :G<CR>
