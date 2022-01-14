-- Moluakai
-- cmd[[colorscheme moluakai]]
-- cmd[[colorscheme molokai]]

-- OneDark
-- require('onedark').setup()

-- Gruvbox+Tokyonight
-- Default options:
require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    colors = {},
    overrides = {},
})
-- setup must be called before loading
cmd("colorscheme kanagawa")

-- TokyoNight
-- vim.g.tokyonight_style = "day"
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_style = "dark"
-- vim.g.tokyonight_transparent = true
-- cmd[[colorscheme tokyonight]]

-- Github
-- require('github-theme').setup({
--   theme_style = "dark",
--   -- comment_style = "italic",
--   -- keyword_style = "italic",
--   -- function_style = "italic",
--   -- variable_style = "italic"
--   -- other config
-- })

-- Dracula
-- cmd[[colorscheme dracula]]

-- Gruvbox
-- vim.o.background = "dark"
-- cmd[[colorscheme gruvbox]]

-- Nord
-- cmd[[colorscheme nord]]

-- Sonokai
-- vim.g.sonokai_style = "andromeda"
-- cmd[[colorscheme sonokai]]

-- Others
-- cmd[[colorscheme catppuccin]]
-- cmd [[colorscheme moonfly]]
-- cmd[[colorscheme monokai]]
-- cmd[[colorscheme badwolf]]
