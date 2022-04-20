-- Custom colors and theme
local colors =
{
    black  = '#2d2c42',
    lblack = '#44475a',

    blue  = '#7aa2f7',
    lblue = '#aec7fc',
    dblue = '#3b4261',

    green  = '#B0FF9D',
    lgreen = '#ceffc7',
    dgreen = '#3e473c',

    purple  = '#ba7af5',
    lpurple = '#d2a7fa',
    dpurple = '#3f3454',

    red  = '#DB5856',
    lred = '#ffb0b0',
    dred = '#3d2525',

    yellow  = '#e7c664',
    lyellow = '#ffeda7',
    dyellow = '#54543d'
}

local r3v =
{
    normal = {
        a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
        b = { fg = colors.lblue, bg = colors.dblue },
        c = { fg = colors.lblue, bg = colors.black }
    },
    insert = {
        a = { fg = colors.black, bg = colors.green, gui = 'bold' },
        b = { fg = colors.lgreen, bg = colors.dgreen },
        c = { fg = colors.lgreen, bg = colors.black }
    },
    visual = {
        a = { fg = colors.black, bg = colors.purple, gui = 'bold' },
        b = { fg = colors.lpurple, bg = colors.dpurple },
        c = { fg = colors.lpurple, bg = colors.black }
    },
    command = {
        a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
        b = { fg = colors.lyellow, bg = colors.dyellow },
        c = { fg = colors.lyellow, bg = colors.black }
    },
    terminal = {
        a = { fg = colors.black, bg = colors.green, gui = 'bold' },
        b = { fg = colors.lgreen, bg = colors.dgreen },
        c = { fg = colors.lgreen, bg = colors.black }
    },
    replace = {
        a = { fg = colors.black, bg = colors.red, gui = 'bold' },
        b = { fg = colors.lred, bg = colors.dred },
        c = { fg = colors.lred, bg = colors.black }
    },
    inactive = {
        a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
        b = { fg = colors.lblue, bg = colors.dblue },
        c = { fg = colors.lblue, bg = colors.black }
    }
}
local function getPos()
    local fn         = vim.api.nvim_call_function
    local currentLn  = tostring(fn('line', { '.' }))
    local totalLn    = tostring(fn('line', { '$' }))
    local currentCol = tostring(fn('col', { '.' }))
    return 'Ln ' .. currentLn .. '/' .. totalLn .. ' Col ' .. currentCol
end

-- local function readOnly()
--     if vim.bo.modifiable == false or vim.bo.readonly == true then
--         return 'READ ONLY'
--     end
--     return ''
-- end


-- Empty
-- local leftComSep = ''
-- local rightComSep =''

-- Default
local leftComSep = '│'
local rightComSep = '│'
local leftSecSep = ''
local rightSecSep = ''

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


local function gitBlameText()
    return 'Git Blame'
end

local gitBlame =
{
    sections = {
        lualine_a = {
            {
                gitBlameText,
                separator = { left = rightSecSep, right = leftSecSep },
                padding = 1
            }
        }
    },
    filetypes = { 'fugitiveblame' }
}

-- local function symbolsOutlineText()
--     return 'Outline'
-- end

-- local symbolsOutline =
-- {
--     sections = {
--         lualine_z = {
--             {
--                 symbolsOutlineText,
--                 separator = { left = rightSecSep, right = leftSecSep },
--                 padding = 1
--             }
--         }
--     },
--     filetypes = { 'Outline' }
-- }

local function alphaText()
    return 'NEOVIM'
end

local alpha =
{
    sections = {
        lualine_a = {
            {
                alphaText,
                separator = { left = rightSecSep, right = leftSecSep },
                padding = 1
            }
        }
    },
    filetypes = { 'alpha' }
}


-- local function packerText()
--     return 'Packer'
-- end

-- local packer =
-- {
--     sections = {
--         lualine_z = {
--             {
--                 packerText,
--                 separator = { left = rightSecSep, right = leftSecSep },
--                 padding = 1
--             }
--         }
--     },
--     filetypes = { 'packer' }
-- }
require 'lualine'.setup
    {
        options = {
            icons_enabled = true,
            theme = r3v,
            section_separators = { left = leftSecSep, right = rightSecSep },
            component_separators = { left = leftComSep, right = rightComSep },
            disabled_filetypes = {},
            globalstatus = true
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                    separator = { left = rightSecSep, right = leftSecSep },
                    padding = 1
                }
            },
            lualine_b = {
            },
            lualine_c = {
                {
                    'filename',
                    file_status = true,
                    path = 1
                }
            },
            lualine_x = {
                {
                    'diagnostics',
                    -- table of diagnostic sources, available sources:
                    -- nvim_lsp, coc, ale, vim_lsp
                    sources = { 'nvim_lsp' },
                    -- Displays diagnostics for the defined severity types
                    sections = { 'error', 'warn', 'info', 'hint' },

                    diagnostics_color = {
                        -- Same values as the general color option can be used here.
                        error = 'DiagnosticError', -- Changes diagnostics' error color.
                        warn  = 'DiagnosticWarn', -- Changes diagnostics' warn color.
                        info  = 'DiagnosticInfo', -- Changes diagnostics' info color.
                        hint  = 'DiagnosticHint', -- Changes diagnostics' hint color.
                    },
                    symbols = { error = '● ', warn = '● ', info = '● ', hint = '● ' },
                    colored = true, -- Displays diagnostics status in color if set to true.
                    update_in_insert = false, -- Update diagnostics in insert mode.
                    always_visible = false, -- Show diagnostics even if there are none.
                }
            },
            lualine_y = { { getPos } },
            lualine_z = { 'branch' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { { getPos } },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = { alpha, 'toggleterm', gitBlame }
        -- echo &ft to get filetype (case-sensitive)
    }
