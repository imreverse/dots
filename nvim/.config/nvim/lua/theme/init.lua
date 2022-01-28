local highlight = require('theme.highlights')
local colors = {}

-- cmd[[colorscheme catppuccin]]

cmd[[colorscheme dracula]]
colors = require('theme.dracula')

-- require('github-theme').setup({theme_style = "dark",})

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

if next(colors)~=nil then
    highlight(colors)
end
