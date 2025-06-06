lua require('config.options')
lua require('config.lazy')

colorscheme tokyonight-storm

map gx <Plug>(openbrowser-smart-search)
map Y y$
noremap <leader>y "+y
noremap <leader>Y "+y$
noremap <leader>p "+p
nnoremap <leader>yf :let @+ = expand("%:.")<cr>
nnoremap <leader>vc :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sl :set list!<cr>
nnoremap <leader>rl :set relativenumber!<cr>
tnoremap <leader><Esc> <C-\><C-n>

nnoremap <leader>e <cmd>Oil<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>rr <cmd>lua require('telescope.builtin').resume()<cr>
nnoremap <leader>hg <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>rw <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>rq <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').builtin()<cr>

nnoremap <leader>mm <cmd>lua require('harpoon.mark').add_file()<cr>
nnoremap <leader>mo <cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>
nnoremap <leader>ma <cmd>lua require('harpoon.ui').nav_file(1)<cr>
nnoremap <leader>mb <cmd>lua require('harpoon.ui').nav_file(2)<cr>
nnoremap <leader>mc <cmd>lua require('harpoon.ui').nav_file(3)<cr>
nnoremap <leader>md <cmd>lua require('harpoon.ui').nav_file(4)<cr>

nnoremap <leader>li <cmd>lua vim.lsp.buf.format()<cr>

vmap <C-j> :m '>+1<CR>gv=gv
vmap <C-k> :m '<-2<CR>gv=gv
nmap <C-j> :m +1<cr>==
nmap <C-k> :m -2<cr>==

nnoremap <silent> [c <cmd>lua require('treesitter-context').go_to_context(vim.v.count1)<cr>

nmap <leader>i <cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji', 'kaomoji', 'gitmoji'} }<cr>
nmap <leader>zn <cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>
nmap <leader>zf <cmd>ZkNotes { sort = { 'modified' }, tags = { '-person' } }<cr>
nmap <leader>zt <cmd>ZkTags<cr>
nmap <leader>zi <cmd>ZkInsertLink<cr>
nmap <leader>zb <cmd>ZkBacklinks<cr>
nmap <leader>zg <cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<cr>
nmap <leader>zd <cmd>lua require('zk.commands').get('ZkNotes')({ hrefs = { 'daily' }})<cr>
nmap <leader>zj <cmd>ZkNew { dir = 'weekly' }<cr>
nmap <leader>zw <cmd>lua require('zk.commands').get('ZkNotes')({ hrefs = { 'weekly' }})<cr>
vmap <leader>zg :'<,'>ZkMatch<cr>

nmap <leader>gs :G<cr>
nnoremap <leader>ga :A<cr>
nnoremap <leader>gr :OpenInGHRepo <cr>
nnoremap <leader>gf :OpenInGHFile <cr>
vnoremap <leader>gf :OpenInGHFileLines <cr>

nmap <leader>co :copen<cr>
nmap <leader>cn :cnext<cr>
nmap <leader>cp :cprev<cr>
