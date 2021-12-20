-------------------------------------------------------
--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
--  ████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██║
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
-------------------------------------------------------
-- TODO: {FEATURE-RQSTS}
-- * Try nvim lsp
-- * Nvim Telescope search for only files with exact name
-- * Nvim Telescope remember search history and maintain order
-- * Code folding inside a particular scope (workaround)
-- * Jump back in history using alt+[ and fwd alt+]
-- * Keep search query for diff buffer separate
-- * Try a better terminal management approach
-- * Better comment manager (like jsx,tsx, and lua,vim)
-- * Describe a way to search visually selected word
-- * NvimTree try to refresh tree when opening/closing a buffer
-- * NvimTree map :bd to NvimTreeClose->:bd->NvimTreeToggle
-- * Check this out: stackoverflow.com/questions/37552913
-- * Watchout for extensions with popup (nui.nvim)
-- * Some examples, Search Replace, Hunk Restore


-- Key Mappings [key] ---------------------------------
require('keymaps')

-- Set VIM Variables [var] ----------------------------
require('options')

-- Plug Plugin Manager [plg] --------------------------
require('plugins')

-- Color Schemes [clr] --------------------------------

-- Moluakai
-- vim.cmd[[colorscheme moluakai]]

-- TokyoNight
-- vim.g.tokyonight_style = "day"
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_transparent = true
-- vim.cmd[[colorscheme tokyonight]]

-- Github
-- require('github-theme').setup()

-- Gruvbox
-- vim.o.background = "dark"
-- vim.cmd[[colorscheme gruvbox]]

-- Sonokai
vim.g.sonokai_style = "andromeda"
vim.cmd[[colorscheme sonokai]]

-- Others
-- vim.cmd[[colorscheme catppuccin]]
-- vim.cmd [[colorscheme moonfly]]
-- vim.cmd[[colorscheme monokai]]
