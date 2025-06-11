lua require('config.options')
lua require('config.lazy')
lua require('config.maps')

colorscheme tokyonight-storm

nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>rr <cmd>lua require('telescope.builtin').resume()<cr>
nnoremap <leader>hg <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>rw <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>rq <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').builtin()<cr>

nnoremap <leader>li <cmd>lua vim.lsp.buf.format()<cr>

nmap <leader>i <cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji', 'kaomoji', 'gitmoji'} }<cr>
nmap <leader>zn <cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>
nmap <leader>zf <cmd>ZkNotes { sort = { 'modified' }, tags = { '-person' } }<cr>
nmap <leader>zt <cmd>ZkTags<cr>
nmap <leader>zi <cmd>ZkInsertLink<cr>
nmap <leader>zb <cmd>ZkBacklinks<cr>
vmap <leader>zw :'<,'>ZkMatch<cr>

nnoremap <leader>ga :A<cr>
nnoremap <leader>gr :OpenInGHRepo <cr>
nnoremap <leader>gf :OpenInGHFile <cr>
vnoremap <leader>gf :OpenInGHFileLines <cr>
