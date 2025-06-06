-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out,                            'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    spec = {
        { 'tyru/open-browser.vim' },
        { 'tpope/vim-fugitive' },
        { 'tpope/vim-projectionist' },
        { 'jiangmiao/auto-pairs' },
        { 'tpope/vim-repeat' },
        { 'tpope/vim-surround' },
        { 'tpope/vim-commentary' },
        { 'nvim-tree/nvim-web-devicons' },
        { 'akinsho/git-conflict.nvim',              version = '*',      opts = {} },
        { 'Almo7aya/openingh.nvim' },
        { 'nvim-treesitter/nvim-treesitter-context' },
        { 'tpope/vim-rails' },
        { 'tpope/vim-endwise' },
        { 'adelarsq/vim-devicons-emoji' },
        { 'nvim-telescope/telescope-symbols.nvim' },
        { 'catppuccin/nvim',                        name = 'catppuccin' },
        { 'nerdypepper/agila.vim' },
        { 'ellisonleao/gruvbox.nvim' },
        { 'ap/vim-css-color' },
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
                timeout = 2000,
            }
        },
        {
            'stevearc/oil.nvim',
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
                    -- Install parsers synchronously (only applied to `ensure_installed`)
                    sync_install = false,
                    -- Automatically install missing parsers when entering buffer
                    auto_install = true,

                    highlight = {
                        -- `false` will disable the whole extension
                        enable = true,

                        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                        -- Using this option may slow down your editor, and you may see some duplicate highlights.
                        -- Instead of true it can also be a list of languages
                        additional_vim_regex_highlighting = true,
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
                        select = {
                            enable = true,

                            -- Automatically jump forward to textobj, similar to targets.vim
                            lookahead = true,

                            keymaps = {
                                -- You can use the capture groups defined in textobjects.scm
                                ['af'] = '@function.outer',
                                ['if'] = '@function.inner',
                                ['ac'] = '@class.outer',
                                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                                -- nvim_buf_set_keymap) which plugins like which-key display
                                ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
                                -- You can also use captures from other query groups like `locals.scm`
                                -- ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
                            },
                            -- You can choose the select mode (default is charwise 'v')
                            --
                            -- Can also be a function which gets passed a table with the keys
                            -- * query_string: eg '@function.inner'
                            -- * method: eg 'v' or 'o'
                            -- and should return the mode ('v', 'V', or '<c-v>') or a table
                            -- mapping query_strings to modes.
                            selection_modes = {
                                ['@parameter.outer'] = 'v', -- charwise
                                ['@function.outer'] = 'V',  -- linewise
                                ['@class.outer'] = '<c-v>', -- blockwise
                            },
                            -- If you set this to `true` (default is `false`) then any textobject is
                            -- extended to include preceding or succeeding whitespace. Succeeding
                            -- whitespace has priority in order to act similarly to eg the built-in
                            -- `ap`.
                            --
                            -- Can also be a function which gets passed a table with the keys
                            -- * query_string: eg '@function.inner'
                            -- * selection_mode: eg 'v'
                            -- and should return true or false
                            include_surrounding_whitespace = true,
                        },
                        swap = {
                            enable = true,
                            swap_next = {
                                ['<leader>sn'] = '@parameter.inner',
                            },
                            swap_previous = {
                                ['<leader>sp'] = '@parameter.inner',
                            },
                        },
                        move = {
                            enable = true,
                            set_jumps = true, -- whether to set jumps in the jumplist
                            goto_next_start = {
                                [']m'] = '@function.outer',
                                [']]'] = { query = '@class.outer', desc = 'Next class start' },
                                --
                                -- You can use regex matching (i.e. lua pattern) and/or pass a list in a 'query' key to group multiple queries.
                                [']o'] = '@loop.*',
                                -- [']o'] = { query = { '@loop.inner', '@loop.outer' } }
                                --
                                -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                                -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                                -- [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
                                [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
                            },
                            goto_next_end = {
                                [']M'] = '@function.outer',
                                [']['] = '@class.outer',
                            },
                            goto_previous_start = {
                                ['[m'] = '@function.outer',
                                ['[['] = '@class.outer',
                                ['[o'] = '@loop.*',
                            },
                            goto_previous_end = {
                                ['[M'] = '@function.outer',
                                ['[]'] = '@class.outer',
                            },
                            -- Below will go to either the start or the end, whichever is closer.
                            -- Use if you want more granular movements
                            -- Make it even more gradual by adding multiple queries and regex.
                            goto_next = {
                                [']f'] = '@conditional.outer',
                            },
                            goto_previous = {
                                ['[f'] = '@conditional.outer',
                            }
                        },
                    },
                }

                local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

                -- Repeat movement with ; and ,
                -- ensure ; goes forward and , goes backward regardless of the last direction
                vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
                vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

                -- vim way: ; goes to the direction you were moving.
                -- vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
                -- vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

                -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
                vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
                vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
                vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
                vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
            end
        }
    },
    install = { colorscheme = { 'tokyonight-storm' } },
})
