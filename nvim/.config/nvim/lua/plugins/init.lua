-- Bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    exe 'packadd packer.nvim'
end

-- Plugins
return require('packer').startup({function()
    use 'wbthomason/packer.nvim'                        -- Plugin manager
    -- use
    -- {
    --     'projekt0n/circles.nvim',
    --     config = function() require('plugins.circles') end
    -- }
    use
    {
        'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.nvim-web-devicons') end
    }

    -- use 'catppuccin/nvim'                               -- Colorschemes
    use 'dracula/vim'
    -- use 'projekt0n/github-nvim-theme'
    -- use 'ellisonleao/gruvbox.nvim'
    -- use 'shaunsingh/nord.nvim'
    -- use 'ful1e5/onedark.nvim'
    -- use 'olimorris/onedarkpro.nvim'
    -- use 'sainnhe/sonokai'
    -- use 'folke/tokyonight.nvim'

    use
    {
        'mhinz/vim-startify',                           -- Dashboard
        config = function() require('plugins.startify') end
    }
    -- use 'glepnir/dashboard-nvim'
    use
    {
        'nvim-lualine/lualine.nvim',                    -- Statusline
        config = function() require('plugins.lualine') end
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    -- Bufferline no animations
    -- Barbar offset bad
    use
    {
        'akinsho/nvim-bufferline.lua',                  -- Bufferline
        config = function() require('plugins.bufferline') end
    }
    -- use
    -- {
    --     'romgrk/barbar.nvim',
    --     config = function() require('plugins.barbar') end
    -- }
    use
    {
        'nvim-treesitter/nvim-treesitter',              -- Treesitter
        config = function() require('plugins.nvim-treesitter') end
    }
    use
    {
        'L3MON4D3/LuaSnip',                             -- Snippet manager
        config = function() require('plugins.luasnip') end
    }
    -- use
    -- {
    --     'hrsh7th/nvim-cmp',
    --     requires = {{'hrsh7th/cmp-nvim-lsp','saadparwaiz1/cmp_luasnip'}},
    --     config = function() require('plugins.nvim-cmp') end
    -- }
    use
    {
        'neovim/nvim-lspconfig',                        -- LSP
        config = function() require('plugins.nvim-lspconfig') end
    }
    use
    {
        'lukas-reineke/indent-blankline.nvim',          -- Indent lines
        config = function() require('plugins.indent-blankline') end
    }
    use
    {
        'kyazdani42/nvim-tree.lua',                     -- Filetree explorer
        config = function() require('plugins.nvim-tree') end
    }
    use
    {
        'nvim-telescope/telescope.nvim',                -- Fuzzy searcher
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-rg.nvim'}
        },
        config = function() require('plugins.telescope') end
    }
    use 'airblade/vim-current-search-match'             -- Highlight current search term
    use 'google/vim-searchindex'                        -- Search with count 99+
    use
    {
        "akinsho/nvim-toggleterm.lua",                  -- Terminal
        config = function() require('plugins.toggleterm') end
    }
    use
    {
        'mbbill/undotree',                              -- Undo history
        config = function() require('plugins.undotree') end
    }
    use
    {
        'b3nj5m1n/kommentary',                          -- Comments handler
        config = function() require('plugins.kommentary') end
    }
    use
    {
        'tpope/vim-fugitive',                           -- Git tools
        config = function() require('plugins.vim-fugitive') end
    }
    use
    {
        'lewis6991/gitsigns.nvim',                      -- Git line changes
        requires = {{'nvim-lua/plenary.nvim'}},
        config = function() require('plugins.gitsigns') end
    }
    use
    {
        'simrat39/symbols-outline.nvim',                -- Function Outline
        config = function() require('plugins.outline') end
    }
    use
    {
        "benfowler/telescope-luasnip.nvim"
    }
    use
    {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }
    use
    {
        'folke/trouble.nvim',
        config = function() require'trouble'.setup() end
    }
    use
    {
        'karb94/neoscroll.nvim',
        config = function() require('plugins.neoscroll') end
    }
    use
    {
        'petertriho/nvim-scrollbar',
        config = function() require('plugins.nvim-scrollbar') end
    }
    use
    {
        'j-hui/fidget.nvim',
        config = function() require"fidget".setup{} end
    }
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    }
}})
