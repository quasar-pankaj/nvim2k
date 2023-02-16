local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local plugins = {
    -- Appearance
    'navarasu/onedark.nvim',
    'nvim-lualine/lualine.nvim',
    'akinsho/bufferline.nvim',
    { 'akinsho/toggleterm.nvim',   cmd = 'ToggleTerm' },
    {
        'folke/zen-mode.nvim', cmd = 'ZenMode', lazy = true,
        dependencies = {
            'folke/twilight.nvim',
        },
    },

    -- Utilities
    'kyazdani42/nvim-tree.lua',
    { 'mbbill/undotree',           cmd = 'UndotreeToggle',      lazy = true },
    { 'folke/which-key.nvim',      lazy = true },
    { 'michaelb/sniprun',          build = 'bash ./install.sh', cmd = "SnipRun" },
    { '2kabhishek/co-author.nvim', cmd = "GitCoAuthors" },

    {
        'lewis6991/impatient.nvim',
        dependencies = {
            {
                "iamcco/markdown-preview.nvim",
                build = function() vim.fn["mkdp#util#install"]() end,
                cmd = "MarkdownPreviewToggle"
            },
            'stevearc/oil.nvim',
            'lukas-reineke/indent-blankline.nvim',
            'stevearc/dressing.nvim',
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
            'sindrets/diffview.nvim',
            'TimUntersberger/neogit',
            'numToStr/Comment.nvim',
            'kylechui/nvim-surround',
            'windwp/nvim-autopairs',
            'norcalli/nvim-colorizer.lua',
            'gelguy/wilder.nvim',
            'ThePrimeagen/refactoring.nvim',
            'windwp/nvim-spectre',
            'ThePrimeagen/harpoon',
            'abecodes/tabout.nvim',
            'ggandor/leap.nvim',
            'tpope/vim-endwise',
        },
        event = 'BufRead',
        lazy = true,
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'folke/trouble.nvim',
            'Maan2003/lsp_lines.nvim',
            'ray-x/lsp_signature.nvim',
            'glepnir/lspsaga.nvim'
        },
        lazy = true,
    },

    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui'
        },
        cmd = 'DapToggleBreakpoint',
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.0',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-symbols.nvim',
            'nvim-telescope/telescope-hop.nvim',
            'renerocksai/telekasten.nvim',
            'renerocksai/calendar-vim',
        },
        lazy = true,
    },

    -- Tresitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'windwp/nvim-ts-autotag',
            'p00f/nvim-ts-rainbow',
            'andymass/vim-matchup',
        },
        lazy = true,
    },

    -- Language specific
    { 'tpope/vim-rails', ft = "ruby" }
}

require('lazy').setup(plugins)
