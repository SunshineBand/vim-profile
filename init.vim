autocmd StdinReadPre * let s:std_in=1

lua vim.g.loaded_netrw = 1
lua vim.g.loaded_netrwPlugin = 1

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set list
set lcs+=space:·
set number
set relativenumber
set inccommand=split

if (has('termguicolors'))
  set termguicolors
endif
colorscheme tokyonight

filetype plugin on
filetype plugin indent on
lua require('plugins')
lua vim.notify = require('notify')
lua require('nvim-notify-config')
lua require('nvim-scrollbar-config')
lua require('gitsigns-config')
lua require('lualine-config')
lua require('mason').setup()
lua require("mason-lspconfig").setup()
lua require('nvim-cmp-config')
lua require('language-server')
lua require('debugging')
lua require('treesitter-config')
lua require('telescope-config')
lua require('null-ls-config')
lua require('zk-config')
lua require('tokyonight-config')
lua require('oil-nvim-config')
lua require('git-conflict-config')
let mapleader = ' '

map gx <Plug>(openbrowser-smart-search)
map Y y$
noremap <leader>y "+y
noremap <leader>Y "+y$
noremap <leader>p "+p
nnoremap <leader>yf :let @+ = expand("%:.")<CR>

nnoremap <leader>vc :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>sl :set list!<CR>
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>hg <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>rw <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>rq <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').builtin()<cr>
nnoremap <leader>e <cmd>Oil<cr>

nnoremap <leader>mm <cmd>lua require('harpoon.mark').add_file()<cr>
nnoremap <leader>mo <cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>
nnoremap <leader>ma <cmd>lua require('harpoon.ui').nav_file(1)<cr>
nnoremap <leader>mb <cmd>lua require('harpoon.ui').nav_file(2)<cr>
nnoremap <leader>mc <cmd>lua require('harpoon.ui').nav_file(3)<cr>
nnoremap <leader>md <cmd>lua require('harpoon.ui').nav_file(4)<cr>

nnoremap <leader>zd <cmd>lua require('zk.commands').get('ZkNotes')({ hrefs = { 'daily' }})<cr>
nnoremap <leader>li <cmd>lua vim.lsp.buf.format()<cr>

lua << EOF
local opts = { noremap=true, silent=false }

vim.keymap.set("n", "<leader>i", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji', 'kaomoji', 'gitmoji'} }<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zi", "<Cmd>ZkInsertLink<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zg", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>zg", ":'<,'>ZkMatch<CR>", opts)
EOF

nmap <leader>gs :G<CR>
nnoremap <leader>ga :A<CR>
nmap <leader>co :copen<CR>
nmap <leader>cn :cnext<CR>
nmap <leader>cp :cprev<CR>
