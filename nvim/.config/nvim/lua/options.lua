set.clipboard:append { "unnamedplus" } -- Set clipboard global linux
-- set.guicursor     = ''                            -- Set cursor block default
set.cursorline    = true
set.cursorlineopt = 'number'
set.mouse         = 'n'
set.undofile      = true -- Undofile exists
set.tabstop       = 8
set.softtabstop   = 8
set.shiftwidth    = 8
set.expandtab     = false
set.autoindent    = true
set.number        = true -- Show numberline
-- set.relativenumber= true                          -- Relative line [slow]
set.wrap          = false -- No wrapping when size small
set.splitbelow    = true -- Open horizontal split view below
set.splitright    = true -- Open vertical split view right
set.hidden        = true -- Hide buffer when opening new file
set.scrolloff     = 5 -- Scroll offset
set.termguicolors = true -- TermGUIcolor
set.foldmethod    = 'manual'
-- set.foldexpr      = 'nvim_treesitter#foldexpr()'
-- set.foldtext      = 'getline(v:foldstart).\'...\'.trim(getline(v:foldend))'
-- set.fillchars     = 'fold: '
-- set.foldnestmax   = 3
-- set.foldminlines  = 1
-- set.foldlevelstart= 99
set.ignorecase    = true
set.smartcase     = true
set.signcolumn    = 'yes'
set.inccommand    = 'nosplit' -- Live substitution
-- set.laststatus    = 3

-- Italic support?
-- set.t_ZH          = '^[[3m'
-- set.t_ZR          = '^[[23m'
cmd [[
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
]]

-- Show gutter for help files
au({ "FileType" }, {
    pattern = 'help',
    command = "setlocal number"
})

-- If swap exists for a file, open in read-only
-- au({"SwapExists"}, {
--     pattern = '*',
--     command = "let v:swapchoice = 'o'"
-- })

-- Remove trailing spaces [may not be safe]
-- exe('au BufWritePre * %s/\\s\\+$//e')
au({ "BufWritePre" }, {
    pattern = '*',
    command = "%s/\\s\\+$//e"
})

-- Disable auto comment on new line
au({ "BufEnter" }, {
    pattern = '*',
    command = "set formatoptions-=cro"
})
-- au({"BufEnter"}, {
--     pattern = '*',
--     command = "setlocal formatoptions-=cro"
-- })

-- Highlight on yank
au('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end
})
