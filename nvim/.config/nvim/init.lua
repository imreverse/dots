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
-- Configure directory where lsp data should be stored
-- Maybe revisit autocompletition (nvim-cmp)?
--
-- Nvim Telescope remember search history and maintain order
-- Nvim Telescope sometimes break when editing command/file search
--
-- Code folding inside a particular scope (workaround)
-- Jump back in history using alt+[ and fwd alt+]
--  -- Learn about ctrl+O, ctrl+I
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
-- Add custom highlighting for undotree, packer, etc
-- Increase leader delay time (maybe inf?) and a better visual for it?
-- Look why,what error nvim gives when :wq
-- Use a search bar plugin? I want the count to appear at top right
-- Set autoreload for buffers?
-- Bind caps instead of ctrl, for mac, linux, windows
-- Scroll with  ouse should be single line, not 3 lines for smoother experience
-- Try danymat/neogen for doc annotations
-- Look out if file masking is provided by default in telescope w/o extension

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

-- Theme [thm] ----------------------------------------
require('theme')
