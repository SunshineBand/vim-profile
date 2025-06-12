return {
    { 'tpope/vim-projectionist' },
    { 'jiangmiao/auto-pairs' },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-commentary' },
    { 'akinsho/git-conflict.nvim',              version = '*',      opts = {} },
    { 'Almo7aya/openingh.nvim' },
    { 'tpope/vim-rails' },
    { 'tpope/vim-endwise' },
    { 'nvim-telescope/telescope-symbols.nvim' },
    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        opts = {}
    },
    {
        'folke/tokyonight.nvim',
        opts = {
            style = 'storm'
        }
    },
    {
        'rcarriga/nvim-notify',
        opts = {
            render = 'compact',
            timeout = 2000,
        }
    },
    {
        'stevearc/oil.nvim',
        dependencies = { 'adelarsq/vim-devicons-emoji' },
        opts = {
            keymaps = {
                ['<leader>e'] = 'actions.close',
            },
        }
    },
    {
        'kawre/leetcode.nvim',
        build = ':TSUpdateSync',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim', -- required by telescope
            'MunifTanjim/nui.nvim',
        },
        opts = {
            arg = 'leetcode.nvim',
            lang = 'cpp',
            injector = {
                ['cpp'] = {
                    before = { '#include <bits/stdc++.h>', 'using namespace std;' },
                    after = 'int main() {}',
                }
            }
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                file_ignore_patterns = {
                    'node_modules',
                    '.git/'
                },
                layout_strategy = 'vertical',
            },
        }
    },
    {
        'zk-org/zk-nvim',
        config = function()
            require('zk').setup({
                picker = 'telescope',
            })
        end
    },
    {
        'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'nvim-telescope/telescope.nvim',
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']h', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']h', bang = true })
                    else
                        gitsigns.nav_hunk('next')
                    end
                end)

                map('n', '[h', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[h', bang = true })
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end)

                -- Actions
                map('n', '<leader>hs', gitsigns.stage_hunk)
                map('n', '<leader>hr', gitsigns.reset_hunk)
                map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                map('n', '<leader>hS', gitsigns.stage_buffer)
                map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                map('n', '<leader>hR', gitsigns.reset_buffer)
                map('n', '<leader>hp', gitsigns.preview_hunk)
                map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                map('n', '<leader>hd', gitsigns.diffthis)
                map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                map('n', '<leader>td', gitsigns.toggle_deleted)

                -- Text object
                map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            local configs = require 'nvim-treesitter.configs'

            configs.setup {
                ensure_installed = { 'typescript', 'tsx', 'ruby' },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                textobjects = {
                    swap = {
                        enable = true,
                        swap_next = {
                            ['<leader>sn'] = '@parameter.inner',
                        },
                        swap_previous = {
                            ['<leader>sp'] = '@parameter.inner',
                        },
                    },
                },
            }
        end
    }
}
