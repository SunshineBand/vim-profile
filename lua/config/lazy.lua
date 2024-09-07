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
        { 'wbthomason/packer.nvim' },

        -- Tools
        { 'tyru/open-browser.vim' },
        { 'petertriho/nvim-scrollbar' },
        {
            'iamcco/markdown-preview.nvim',
            cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
            ft = { 'markdown' },
            build = function() vim.fn['mkdp#util#install']() end,
        },
        {
            'nvim-telescope/telescope.nvim', version = "0.1.8",
            dependencies = { {'nvim-lua/plenary.nvim'} }
        },
        {
            'ThePrimeagen/harpoon',
            dependencies = { {'nvim-lua/plenary.nvim'} }
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
        { 'mickael-menu/zk-nvim' },
        { 'rcarriga/nvim-notify' },
        {
            'stevearc/oil.nvim',
            -- config = function() require('oil').init() end
        },
        {
            'akinsho/git-conflict.nvim', version = "*",
            -- config = function()
            --     require('git-conflict').init()
            -- end
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
            -- build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
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
            dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
        },
        { 'folke/tokyonight.nvim' },
        { 'ap/vim-css-color' },
    },
    -- install = { colorscheme = { 'tokyonight.nvim' } },
})
