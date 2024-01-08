local highlight = require('theme.highlights')
local colors = {}

cmd[[colorscheme catppuccin]]

-- cmd [[colorscheme dracula]]
-- colors = require('theme.dracula')

-- vim.cmd('colorscheme github_light_tritanopia')
-- -- Default options
-- -- require('github-theme').setup({
-- --   groups = {
-- --     all = {
-- -- 	    CursorLine = { bg = '#090909' }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
-- --     },
-- --   },
-- -- })

-- setup must be called before loading
-- vim.cmd('colorscheme github_dark')

-- vim.cmd('colorscheme github_light_tritanopia')

-- vim.o.background = "dark"
-- cmd[[colorscheme gruvbox]]
-- colors = require('theme.gruvbox')

-- cmd[[colorscheme molokai]]
-- cmd[[colorscheme moluakai]]

-- cmd[[colorscheme nord]]
-- colors = require('theme.nord')

-- require('onedark').setup()
-- colors = require('theme.onedark')

-- vim.o.background = "light" -- to load onelight
-- require('onedarkpro').load()

-- vim.g.sonokai_style = "andromeda"
-- cmd[[colorscheme sonokai]]
-- colors = require('theme.monokai')

-- vim.g.tokyonight_style = "day"
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_style = "dark"
-- cmd[[colorscheme tokyonight]]

if next(colors) ~= nil then
    highlight(colors)
end
