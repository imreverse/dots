-- Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
    ---------------------------------------------------------------------------
    -- Essential (bare minimum) -----------------------------------------------

    -- the colorscheme should be available when starting Neovim
    {
	    "catppuccin/nvim",
	    -- "dracula/vim"
	    -- "catppuccin/nvim"
	    -- "projekt0n/github-nvim-theme"
	    -- "ellisonleao/gruvbox.nvim"
	    -- "shaunsingh/nord.nvim"
	    -- "ful1e5/onedark.nvim"
	    -- "olimorris/onedarkpro.nvim"
	    -- "sainnhe/sonokai"
	    -- "folke/tokyonight.nvim"
	    lazy = false, -- make sure we load this during startup if it is your main colorscheme
	    priority = 1000, -- make sure to load this before all the other start plugins
    },

    -- [TODO: this doesn't work] Search with count 99+
    -- { "google/vim-searchindex", lazy = true },

    -- Copy over ssh
    {
	'ojroques/nvim-osc52',
        config = function() require('plugins.vim-oscyank') end
    },

    -- Treesitter
    {
	    "nvim-treesitter/nvim-treesitter",
	    build = ":TSUpdate",
	    config = function()
		    require('plugins.nvim-treesitter')
	    end,
    },

    -- Zero LSP
    {
	    'VonHeikemen/lsp-zero.nvim',
	    branch = 'v2.x',
	    dependencies = {
		    -- LSP Support
		    {'neovim/nvim-lspconfig'},             -- Required
		    {'williamboman/mason.nvim'},           -- Optional
		    {'williamboman/mason-lspconfig.nvim'}, -- Optional

		    -- Autocompletion
		    {'hrsh7th/nvim-cmp'},     -- Required
		    {'hrsh7th/cmp-nvim-lsp'}, -- Required
		    {'L3MON4D3/LuaSnip'},     -- Required
	    },
	    config = function() require('plugins.lsp-zero') end
    },

    -- Fuzzy searcher
    {
	    "nvim-telescope/telescope.nvim",
	    dependencies = {
		    "nvim-lua/plenary.nvim",
		    "nvim-telescope/telescope-live-grep-args.nvim",
	    },
	    config = function()
		require('plugins.telescope')
	    end,
    },

    -- Undo history
    {
	    'mbbill/undotree',
	    config = function() require('plugins.undotree') end
    },

    -- Comments handler
    {
	    'numToStr/Comment.nvim',
	    config = function() require('plugins.comment') end,
	    lazy = false,
    },

    ---------------------------------------------------------------------------
    -- Good to have (Might have better workflow available) --------------------

    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        config = function() require('plugins.lualine') end
    },

    -- Bufferline
    {
        'akinsho/nvim-bufferline.lua',
        config = function() require('plugins.bufferline') end
    },

    -- Filetree explorer
    {
        'nvim-tree/nvim-tree.lua',
        config = function() require('plugins.nvim-tree') end
    },

    -- Git tools
    {
        'tpope/vim-fugitive',
        config = function() require('plugins.vim-fugitive') end
    },

    -- Git line changes
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('plugins.gitsigns') end
    },

    -- Git diff
    {
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim'
    },

    -- Git conflict (Keep getting an error on vim startup)
    -- use {
    --     'akinsho/git-conflict.nvim',
    --     tag = '*',
    --     config = function() require('plugins.git-conflict').setup() end
    -- }

    -- Smooth scroll
    {
        'karb94/neoscroll.nvim',
        config = function() require('plugins.neoscroll') end
    },

    -- LSP Loader (bottom right)
    {
        'j-hui/fidget.nvim',
	tag = "legacy",
	event = "LspAttach",
        config = function() require "fidget".setup {} end
    },

    -- Code actions context menu
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu'
    },

    ---------------------------------------------------------------------------
    -- Not Essential (Can work if not there) ----------------------------------

    {
        'nvim-tree/nvim-web-devicons',
	lazy = true,
    },
    {
        'lukas-reineke/indent-blankline.nvim',          -- Indent lines
        config = function() require('plugins.indent-blankline') end
    },
 --    use {
 --        'goolord/alpha-nvim',                               -- Dashboard
 --        config = function() require('plugins.alpha-nvim') end
 --    }
    {
        'L3MON4D3/LuaSnip',                             -- Snippet manager
        config = function() require('plugins.luasnip') end
    },
    -- use "benfowler/telescope-luasnip.nvim"
    -- use {
    --     'hrsh7th/nvim-cmp',
    --     requires = {{'hrsh7th/cmp-nvim-lsp','saadparwaiz1/cmp_luasnip'}},
    --     config = function() require('plugins.nvim-cmp') end
    -- }
    -- use {
    --     'simrat39/symbols-outline.nvim',                -- Function Outline
    --     config = function() require('plugins.outline') end
    -- }
    -- use {
    --     'norcalli/nvim-colorizer.lua',
    --     config = function() require'colorizer'.setup() end
    -- }
    -- use {
    --     'folke/trouble.nvim',
    --     config = function() require'trouble'.setup() end
    -- }
    -- use {
    --     'petertriho/nvim-scrollbar',
    --     config = function() require('plugins.nvim-scrollbar') end
    -- }
})
