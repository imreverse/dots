-------------------------------------------------------
--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
--  ████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██║
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
-------------------------------------------------------
-- TODO
-- Try nvim lsp
-- Nvim Telescope search for only files with exact name
-- Nvim Telescope remember search history and maintain order
-- Nvim Telescope scroll through the previewer?
-- Code folding inside a particular scope (workaround)
-- Jump back in history using alt+[ and fwd alt+]
-- Keep search query for diff buffer separate
-- Try a better terminal management approach
-- Better comment manager (like jsx,tsx, and lua,vim)
-- Describe a way to search visually selected word
-- NvimTree try to refresh tree when opening/closing a buffer
-- NvimTree map :bd to NvimTreeClose->:bd->NvimTreeToggle
-- NvimTree update tree when opening from session
-- Check this out: stackoverflow.com/questions/37552913
-- Watchout for extensions with popup (nui.nvim)
-- Some examples, Search Replace, Hunk Restore
-- Modify hunk movement because of leader h conflict
-- Better splits movement (sometimes I see opposite behav)
-- Modify lualine color theme to be based on background

-- Shorthands used in this repo
map = vim.api.nvim_set_keymap
cmd = vim.cmd
set = vim.opt
exe = vim.api.nvim_command
opt = { noremap = true, silent = true }

-- Key Mappings [key] ---------------------------------
require('keymaps')

-- Set VIM Variables [var] ----------------------------
require('options')

-- Plug Plugin Manager [plg] --------------------------
require('plugins')

-- Color Schemes [clr] --------------------------------
require('colors')
