-- Custom colors and theme
local colors =
{
    black   = '#343a44',
    lblack  = '#464e5b',

    blue    = '#85d3f2',
    lblue   = '#c1e2f2',
    dblue   = '#314e59',

    green   = '#B0FF9D',
    lgreen  = '#ceffc7',
    dgreen  = '#3a5434',

    purple  = '#CB99C9',
    lpurple = '#ffe0fc',
    dpurple = '#423241',

    red     = '#DB5856',
    lred    = '#ffb0b0',
    dred    = '#411919',

    yellow  = '#e7c664',
    lyellow = '#ffeda7',
    dyellow = '#6c5c2f'
}

local r3v =
{
    normal =
    {
        a = {fg = colors.black, bg = colors.blue, gui = 'bold'},
        b = {fg = colors.lblue, bg = colors.lblack},
        c = {fg = colors.lblue, bg = colors.black}
    },
    insert =
    {
        a = {fg = colors.black, bg = colors.green, gui = 'bold'},
        b = {fg = colors.lgreen, bg = colors.lblack},
        c = {fg = colors.lgreen, bg = colors.black}
    },
    visual =
    {
        a = {fg = colors.black, bg = colors.purple, gui = 'bold'},
        b = {fg = colors.lpurple, bg = colors.lblack},
        c = {fg = colors.lpurple, bg = colors.black}
    },
    command =
    {
        a = {fg = colors.black, bg = colors.yellow, gui = 'bold'},
        b = {fg = colors.lyellow, bg = colors.lblack},
        c = {fg = colors.lyellow, bg = colors.black}
    },
    terminal =
    {
        a = {fg = colors.black, bg = colors.green, gui = 'bold'},
        b = {fg = colors.lgreen, bg = colors.lblack},
        c = {fg = colors.lgreen, bg = colors.black}
    },
    replace =
    {
        a = {fg = colors.black, bg = colors.red, gui = 'bold'},
        b = {fg = colors.lred, bg = colors.lblack},
        c = {fg = colors.lred, bg = colors.black}
    },
    inactive =
    {
        a = {fg = colors.black, bg = colors.blue, gui = 'bold'},
        b = {fg = colors.lblue, bg = colors.lblack},
        c = {fg = colors.lblue, bg = colors.black}
    }
}
local function getPos()
    local fn = vim.api.nvim_call_function
    local currentLn = tostring(fn('line',{'.'}))
    local totalLn   = tostring(fn('line',{'$'}))
    local currentCol= tostring(fn('col',{'.'}))
    local totalCol  = tostring(fn('col',{'$'}))
    return 'Ln '..currentLn..'/'..totalLn..' Col '..currentCol
end

local function readOnly()
    if vim.bo.modifiable == false or vim.bo.readonly == true then
        return 'READ ONLY'
    end
    return ''
end


-- Default
local leftComSep = '│'
local rightComSep ='│'

-- Bubbles
-- local leftSecSep = ''
-- local leftComSep = ''
-- local rightSecSep = ''
-- local rightComSep =''

-- Inclined
-- local leftSecSep = ''
-- local leftComSep = '/'
-- local rightSecSep = ''
-- local rightComSep ='/'

-- Arrows
-- local leftSecSep = ''
-- local leftComSep = ''
-- local rightSecSep = ''
-- local rightComSep =''


local helpSection =
{
    sections =
    {
        lualine_c =
        {
            {
                'filename',
                file_status = false,
                path = 0
            }
        },
        lualine_y = {{getPos}},
        lualine_z =
        {
            {
                'filetype',
                fmt = string.upper,
                colored = false,
                separator = { left = rightSecSep, right = leftSecSep },
                icons_enabled = false,
                padding = 1
            }
        }
    },
    filetypes = {'help'}
}

local function gitBlameText()
    return 'Git Blame'
end
local gitBlame =
{
    sections =
    {
        lualine_a =
        {
            {
                gitBlameText,
                separator = { left = rightSecSep, right = leftSecSep },
                padding = 1
            }
        }
    },
    filetypes = {'fugitiveblame'}
}

local function symbolsOutlineText()
    return 'Outline'
end
local symbolsOutline =
{
    sections =
    {
        lualine_z =
        {
            {
                symbolsOutlineText,
                separator = { left = rightSecSep, right = leftSecSep },
                padding = 1
            }
        }
    },
    filetypes = {'Outline'}
}

local function packerText()
    return 'Packer'
end
local packer =
{
    sections =
    {
        lualine_z =
        {
            {
                packerText,
                separator = { left = rightSecSep, right = leftSecSep },
                padding = 1
            }
        }
    },
    filetypes = {'packer'}
}
require'lualine'.setup
{
    options =
    {
        icons_enabled = true,
        theme = r3v,
        section_separators = { left = leftSecSep, right = rightSecSep },
        component_separators = { left = leftComSep, right = rightComSep },
        disabled_filetypes = {}
    },
    sections =
    {
        lualine_a =
        {
            {
                'mode',
                separator = { left = rightSecSep, right = leftSecSep },
                padding = 1
            }
        },
        lualine_b =
        {
            'branch',
            {
                'diff',
                colored = true, -- displays diff status in color if set to true
                -- -- all colors are in format #rrggbb
                -- diff_color =
                -- {
                --     added = colors.black, -- changes diff's added foreground color
                --     modified = colors.black, -- changes diff's modified foreground color
                --     removed = colors.black -- changes diff's removed foreground color
                -- },
                symbols = {added = '+', modified = '~', removed = '-'} -- changes diff symbols
            }
        },
        lualine_c =
        {
            {
                'filename',
                file_status = true,
                path = 1
            }
        },
        lualine_x =
        {
            {
                'diagnostics',
                -- table of diagnostic sources, available sources:
                -- nvim_lsp, coc, ale, vim_lsp
                sources = { 'nvim_lsp' },
                -- displays diagnostics from defined severity
                sections = {'error', 'warn', 'info', 'hint'},
                -- Displays diagnostics for the defined severity types
                sections = { 'error', 'warn', 'info', 'hint' },

                diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = 'DiagnosticError', -- Changes diagnostics' error color.
                    warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                    info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                    hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                },
                symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
                colored = true,           -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = true,   -- Show diagnostics even if there are none.
            },
            {readOnly}
        },
        lualine_y = {{getPos}},
        lualine_z =
        {
            {
                'filetype',
                fmt = string.upper,
                colored = false,
                separator = { left = rightSecSep, right = leftSecSep },
                icons_enabled = true,
                padding = 1
            }
        }
    },
    inactive_sections =
    {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {{getPos}},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = { 'fugitive', 'nvim-tree', 'toggleterm', helpSection, gitBlame, symbolsOutline, packer }
    -- echo &ft to get filetype (case-sensitive)
}
