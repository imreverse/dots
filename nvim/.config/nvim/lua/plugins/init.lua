-- Bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    exe 'packadd packer.nvim'
end

-- Plugins
return require('packer').startup({ function()
    ---------------------------------------------------------------------------
    -- Essential (bare minimum) -----------------------------------------------

    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- Search with count 99+
    use 'google/vim-searchindex'

    -- Highlight current search term
    use 'airblade/vim-current-search-match'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require('plugins.nvim-treesitter') end
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = function() require('plugins.nvim-lspconfig') end
    }

    -- Colorschemes
    use 'dracula/vim'
    -- use 'catppuccin/nvim'
    -- use 'projekt0n/github-nvim-theme'
    -- use 'ellisonleao/gruvbox.nvim'
    -- use 'shaunsingh/nord.nvim'
    -- use 'ful1e5/onedark.nvim'
    -- use 'olimorris/onedarkpro.nvim'
    -- use 'sainnhe/sonokai'
    -- use 'folke/tokyonight.nvim'

    -- Fuzzy searcher
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-rg.nvim' }
        },
        config = function() require('plugins.telescope') end
    }

    -- Undo history
    use {
        'mbbill/undotree',
        config = function() require('plugins.undotree') end
    }

    -- Comments handler
    use {
        'b3nj5m1n/kommentary',
        config = function() require('plugins.kommentary') end
    }

    ---------------------------------------------------------------------------
    -- Good to have (Might have better workflow available) --------------------

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('plugins.lualine') end
    }

    -- Bufferline
    use {
        'akinsho/nvim-bufferline.lua',
        config = function() require('plugins.bufferline') end
    }
    -- use {
    --     'romgrk/barbar.nvim',
    --     config = function() require('plugins.barbar') end
    -- }

    -- Filetree explorer
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require('plugins.nvim-tree') end
    }

    -- Git tools
    use {
        'tpope/vim-fugitive',
        config = function() require('plugins.vim-fugitive') end
    }

    -- Git line changes
    use {
        'lewis6991/gitsigns.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function() require('plugins.gitsigns') end
    }

    -- Git diff
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    -- Git conflict (Keep getting an error on vim startup)
    -- use {
    --     'akinsho/git-conflict.nvim',
    --     tag = '*',
    --     config = function() require('plugins.git-conflict').setup() end
    -- }

    -- Smooth scroll
    use {
        'karb94/neoscroll.nvim',
        config = function() require('plugins.neoscroll') end
    }

    -- LSP Loader (bottom right)
    use {
        'j-hui/fidget.nvim',
        config = function() require "fidget".setup {} end
    }

    -- Code actions context menu
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu'
    }

    ---------------------------------------------------------------------------
    -- Not Essential (Can work if not there) ----------------------------------

    use {
        'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.nvim-web-devicons') end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',          -- Indent lines
        config = function() require('plugins.indent-blankline') end
    }
    use {
        'goolord/alpha-nvim',                               -- Dashboard
        config = function() require('plugins.alpha-nvim') end
    }
    -- use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {
        'L3MON4D3/LuaSnip',                             -- Snippet manager
        config = function() require('plugins.luasnip') end
    }
    -- use "benfowler/telescope-luasnip.nvim"
    -- use {
    --     'hrsh7th/nvim-cmp',
    --     requires = {{'hrsh7th/cmp-nvim-lsp','saadparwaiz1/cmp_luasnip'}},
    --     config = function() require('plugins.nvim-cmp') end
    -- }
    -- use {
    --     "akinsho/nvim-toggleterm.lua",                  -- Terminal
    --     config = function() require('plugins.toggleterm') end
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
end
})
