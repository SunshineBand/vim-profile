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
            'iamcco/markdown-preview.nvim',
            cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
            ft = { 'markdown' },
            build = function() vim.fn['mkdp#util#install']() end,
        },
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
            -- config = function()
            --     require('gitsigns').init()
            --     require("scrollbar.handlers.gitsigns").init()
            -- end
        },
        { 'mfussenegger/nvim-dap' },
        { 'tpope/vim-dispatch' },
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

        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'hrsh7th/nvim-cmp' },
        { 'jose-elias-alvarez/null-ls.nvim' },

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
                        additional_vim_regex_highlighting = false,
                    },
                }
            end
        },
        { 'nvim-treesitter/nvim-treesitter-context' },

        -- Language Specific

        { 'tpope/vim-rails' },
        { 'xuhdev/vim-latex-live-preview' },
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
                lang = "typescript"
            },
        },
    },
    install = { colorscheme = { 'tokyonight-storm' } },
})
