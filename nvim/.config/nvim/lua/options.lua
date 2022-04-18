set.clipboard:append { "unnamedplus" }            -- Set clipboard global linux
-- set.guicursor     = ''                            -- Set cursor block default
-- set.cursorline    = true
set.mouse         = 'n'
set.undofile      = true                          -- Undofile exists
set.tabstop       = 4
set.softtabstop   = 4
set.shiftwidth    = 4
set.expandtab     = true
set.autoindent    = true
set.number        = true                          -- Show numberline
-- set.relativenumber= true                          -- Relative line [slow]
set.wrap          = false                         -- No wrapping when size small
set.splitbelow    = true                          -- Open horizontal split view below
set.splitright    = true                          -- Open vertical split view right
set.hidden        = true                          -- Hide buffer when opening new file
set.scrolloff     = 5                             -- Scroll offset
set.termguicolors = true                          -- TermGUIcolor
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
set.inccommand    = 'nosplit'                     -- Live substitution
-- set.laststatus    = 3

-- Italic support?
-- set.t_ZH          = '^[[3m'
-- set.t_ZR          = '^[[23m'
cmd[[
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
]]

-- Show gutter for help files
exe([[
autocmd FileType help setlocal number
]])

-- exe('au BufWritePre * %s/\\s\\+$//e')           -- Remove trailing spaces [may not be safe]
-- exe('au SwapExists * let v:swapchoice = "o"')   -- If swap exists for a file, open in read-only

-- problemo postponed
-- set.formatoptions = "-=cro"                        -- Disable auto comment on new line
-- set.formatoptions:remove{ "c","r","o" }            -- Disable auto comment on new line

-- set.formatoptions = set.formatoptions:remove('c','')
-- set.formatoptions = set.formatoptions:remove('r','')
-- set.formatoptions = set.formatoptions:remove('o','')
-- set.formatoptions = set.formatoptions - 'r'
-- set.formatoptions = set.formatoptions - 'o'
-- set.fo:remove { "cro", "r", "o" }
-- exe([[
-- augroup AutoCompileLatex
-- setlocal fo-=cro
-- augroup END
-- ]])
-- exe([[
-- autocmd filetype * set fo-=cro
-- ]])
-- exe('autocmd filetype * set fo-=c fo-=r fo-=o') -- disable auto comment insertion
-- exe('au filetype * set fo-=cro') -- disable auto comment insertion
-- exe('au filetype * set.fo:remove { "c", "r", "o" }') -- disable auto comment insertion
-- -- au filetype * set fo-=c fo-=r fo-=o "disable auto comment insertion
-- TODO find a new home for these autocommands
require('lv-utils').define_augroups({
    _general_settings =
    {
        {
            'TextYankPost', '*',
            'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'
        }, {
            'BufWinEnter', '*',
            'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
        },
        {
            'BufRead', '*',
            'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
        }, {
            'BufNewFile', '*',
            'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
        }, {'VimLeavePre', '*', 'set title set titleold='},
        {'FileType', 'qf', 'set nobuflisted'}
    },
    -- _solidity = {
    --     {'BufWinEnter', '.sol', 'setlocal filetype=solidity'}, {'BufRead', '*.sol', 'setlocal filetype=solidity'},
    --     {'BufNewFile', '*.sol', 'setlocal filetype=solidity'}
    -- },
    -- _gemini = {
    --     {'BufWinEnter', '.gmi', 'setlocal filetype=markdown'}, {'BufRead', '*.gmi', 'setlocal filetype=markdown'},
    --     {'BufNewFile', '*.gmi', 'setlocal filetype=markdown'}
    -- },
    -- _markdown = {
    --     {'FileType', 'markdown', 'setlocal wrap'},
    --     {'FileType', 'markdown', 'setlocal spell'}
    -- },
    -- _buffer_bindings = {
    --     {'FileType', 'floaterm', 'nnoremap <silent> <buffer> q :q<CR>'}
    -- }
})
