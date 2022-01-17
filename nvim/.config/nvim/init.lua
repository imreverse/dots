-------------------------------------------------------
--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
--  ████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██║
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
-------------------------------------------------------
-- TODO
-- Add LSP server configs for other most used languages
-- Configure directory where lsp data should be stored
-- Maybe revisit autocompletition (nvim-cmp)?
-- Look into ccls compile/config options?
--
-- Nvim Telescope search for files with exact name/extension
-- Nvim Telescope remember search history and maintain order
--
-- Code folding inside a particular scope (workaround)
-- Jump back in history using alt+[ and fwd alt+]
--  -- Learn about ctrl+O, ctrl+I
-- Keep search query for diff buffer separate
-- Send commands from nvim to tmux?
-- NvimTree map :bd to NvimTreeClose->:bd->NvimTreeToggle
-- Better splits resize (sometimes I see opposite behav)
-- Modify lualine color theme to be based on background
-- Use custom background color for lualine lsp
-- Look into mfussenegger/nvim-dap
-- Create custom theme exactly like vscode vibrant monokai
-- autocmd float breaks undo history neovim 11439 (.conf/nvim-undo-/)
-- LOok 'sindrets/diffview.nvim', 'kevinhwang91/nvim-bqf'
-- Learn about partial lines in vim
-- CAPSLOCK indication on status bar
-- Look into neovim org mode
-- Why does :w changes the cursor position? Maybe that autocmd?
-- Occassionally treesitter breaks. Why? Have to reinstall
-- A better way to remove sessions
-- Look why saving session with nvim-tree leads to bad bufferline

-- Shorthands used in this repo
map = vim.api.nvim_set_keymap
cmd = vim.cmd
set = vim.opt
exe = vim.api.nvim_command
nosil = { noremap = true, silent = true }

-- Key Mappings [key] ---------------------------------
require('keymaps')

-- Set VIM Variables [var] ----------------------------
require('options')

-- Plug Plugin Manager [plg] --------------------------
require('plugins')

-- Color Schemes [clr] --------------------------------
require('colors')
