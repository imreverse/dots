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
-- { vimls, jdtls }
--
-- Nvim Telescope remember search history and maintain order
--
-- Code folding inside a particular scope (workaround)
-- NvimTree map :bd to NvimTreeClose->:bd->NvimTreeToggle
-- Better splits resize (sometimes I see opposite behav)
-- Modify lualine color theme to be based on background
-- autocmd float breaks undo history neovim 11439 (.conf/nvim-undo-/)
-- LOok 'sindrets/diffview.nvim', 'kevinhwang91/nvim-bqf'
-- Learn about partial lines in vim
-- CAPSLOCK indication on status bar
-- Why does :w changes the cursor position? Maybe that autocmd?
-- Add custom highlighting for undotree, packer, etc
-- Increase leader delay time (maybe inf?) and a better visual for it?
-- Use a search bar plugin? I want the count to appear at top right
-- Set autoreload for buffers?
-- Bind caps instead of ctrl, for mac, linux, windows
-- Scroll with  ouse should be single line, not 3 lines for smoother experience
-- Try danymat/neogen for doc annotations
-- Look out if file masking is provided by default in telescope w/o extension

-- Shorthands used in this repo
map   = vim.keymap.set
cmd   = vim.cmd
set   = vim.opt
exe   = vim.api.nvim_command
au    = vim.api.nvim_create_autocmd
nosil = { noremap = true, silent = true }

-- Key Mappings [key] ---------------------------------
require('keymaps')

-- Set VIM Variables [var] ----------------------------
require('options')

-- Plug Plugin Manager [plg] --------------------------
require('plugins')

-- Theme [thm] ----------------------------------------
require('theme')
