-- Bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command 'packadd packer.nvim'
end

-- Plugins
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'                        -- Plugin manager
    use
    {
        'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.nvim-web-devicons') end
    }
    use 'folke/tokyonight.nvim'                         -- Colorscheme
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
    -- Bufferline no animations
    -- Barbar colorscheme bad
    -- Barbar offset bad
    -- Barbar buffer ordering messed up
    use
    {
        'akinsho/nvim-bufferline.lua',                  -- Bufferline
        config = function() require('plugins.bufferline') end
    }
    -- use 'romgrk/barbar.nvim'
    use
    {
        'nvim-treesitter/nvim-treesitter',              -- Treesitter
        config = function() require('plugins.nvim-treesitter') end
    }
    -- use 'neovim/nvim-lspconfig'                      -- LSP
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
        requires = {{'nvim-lua/plenary.nvim'}},
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
        'L3MON4D3/LuaSnip',                             -- Snippet manager
        config = function() require('plugins.luasnip') end
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
end)
