lua require('config.options')
lua require('config.lazy')
lua require('config.maps')

colorscheme tokyonight-storm

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
