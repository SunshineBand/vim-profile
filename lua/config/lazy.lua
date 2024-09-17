-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    spec = {
        -- Tools
        { 'tyru/open-browser.vim' },
        { 'petertriho/nvim-scrollbar', opts = {} },
        {
            'nvim-telescope/telescope.nvim',
            version = "0.1.8",
            dependencies = {'nvim-lua/plenary.nvim'},
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
            'ThePrimeagen/harpoon',
            dependencies = {'nvim-lua/plenary.nvim'}
        },
        { 'tpope/vim-fugitive' },
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
                            vim.cmd.normal({']h', bang = true})
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '[h', function()
                        if vim.wo.diff then
                            vim.cmd.normal({'[h', bang = true})
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    map('n', '<leader>hs', gitsigns.stage_hunk)
                    map('n', '<leader>hr', gitsigns.reset_hunk)
                    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                    map('n', '<leader>hS', gitsigns.stage_buffer)
                    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                    map('n', '<leader>hR', gitsigns.reset_buffer)
                    map('n', '<leader>hp', gitsigns.preview_hunk)
                    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                    map('n', '<leader>hd', gitsigns.diffthis)
                    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                    map('n', '<leader>td', gitsigns.toggle_deleted)

                    -- Text object
                    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            }
        },
        { 'tpope/vim-projectionist' },
        { 'jiangmiao/auto-pairs' },
        { 'tpope/vim-repeat' },
        { 'tpope/vim-surround' },
        { 'tpope/vim-commentary' },
        { 'nvim-tree/nvim-web-devicons' },
        {
            'zk-org/zk-nvim',
            config = function()
                require('zk').setup({
                    picker = 'telescope',
                })
            end
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
            -- config = function() require('oil').init() end
        },
        {
            'akinsho/git-conflict.nvim', version = "*",
            opts = {}
        },
        { 'Almo7aya/openingh.nvim' },
        { 'github/copilot.vim' },

        -- Lsp

        {
            'williamboman/mason.nvim',
            opts = {}
        },
        {
            'williamboman/mason-lspconfig.nvim',
            opts = {}
        },
        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'hrsh7th/nvim-cmp' },

        -- Syntax

        {
            'nvim-treesitter/nvim-treesitter',
            config = function()
                local configs = require'nvim-treesitter.configs'

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
        { 'nvim-treesitter/nvim-treesitter-context' },

        -- Language Specific

        { 'tpope/vim-rails' },
        { 'tpope/vim-endwise' },

        -- Color Schemes and Visuals

        { 'adelarsq/vim-devicons-emoji' },
        { 'nvim-telescope/telescope-symbols.nvim' },
        { 'catppuccin/nvim', name = 'catppuccin' },
        { 'nerdypepper/agila.vim' },
        { 'ellisonleao/gruvbox.nvim' },
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
        { 'ap/vim-css-color' },
        {
            'kawre/leetcode.nvim',
            build = ':TSUpdateSync',
            dependencies = {
                'nvim-telescope/telescope.nvim',
                'nvim-lua/plenary.nvim', -- required by telescope
                'MunifTanjim/nui.nvim',
            },
            opts = {
                arg = "leetcode.nvim",
                lang = "python3"
            },
        },
    },
    install = { colorscheme = { 'tokyonight-storm' } },
})
