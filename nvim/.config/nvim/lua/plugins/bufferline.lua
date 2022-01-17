require "bufferline".setup
{
    -- highlights =
    -- {
    --     buffer_selected =
    --     {
    --         guifg = normal_fg,
    --         guibg = normal_bg,
    --         gui = ""
    --     },
    --     indicator_selected = {
    --         guifg =
    --         {
    --             attribute = "bg",
    --             highlight = "Normal"
    --         },
    --         guibg =
    --         {
    --             attribute = "bg",
    --             highlight = "Normal"
    --         }
    --     }
    -- },
    options =
    {
        offsets =
        {
            {
                filetype = "NvimTree",
                text = "Explorer",
                highlight = "Directory",
                text_align = "center"
                -- padding = 1
            },
            {
                filetype = "undotree",
                text = "Undo History",
                highlight = "Directory",
                text_align = "center"
                -- padding = 1
            },
            {
                filetype = "fugitiveblame",
                text = "Git Blame",
                highlight = "Directory",
                text_align = "center"
                -- padding = 1
            },
            {
                filetype = "packer",
                text = "Neovim Package Manager",
                highlight = "Directory",
                text_align = "center"
                -- padding = 1
            },
            {
                filetype = "help",
                text = "Help",
                highlight = "Directory",
                text_align = "center"
                -- padding = 1
            }
        },
        show_buffer_icons = false,
        buffer_close_icon = "",
        modified_icon = "﯂",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        -- tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
    }
}

-- Goto buffer in position...
map('n', '<A-1>', ':BufferLineGoToBuffer 1<CR>', nosil)
map('n', '<A-2>', ':BufferLineGoToBuffer 2<CR>', nosil)
map('n', '<A-3>', ':BufferLineGoToBuffer 3<CR>', nosil)
map('n', '<A-4>', ':BufferLineGoToBuffer 4<CR>', nosil)
map('n', '<A-5>', ':BufferLineGoToBuffer 5<CR>', nosil)
map('n', '<A-6>', ':BufferLineGoToBuffer 6<CR>', nosil)
map('n', '<A-7>', ':BufferLineGoToBuffer 7<CR>', nosil)
map('n', '<A-8>', ':BufferLineGoToBuffer 8<CR>', nosil)
-- map('n', '<A-9>', ':BufferLast<CR>',   nosil)
-- Quickly move to a buffer with hotkey
map('n', '<Leader>b', ':BufferLinePick<CR>', nosil)
-- Move b/w buffers
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', nosil)
map('n', '<TAB>', ':BufferLineCycleNext<CR>', nosil)
-- Shift buffers
map('n', '<A-S-h>', ':BufferLineMovePrev<CR>', nosil)
map('n', '<A-S-l>', ':BufferLineMoveNext<CR>', nosil)
