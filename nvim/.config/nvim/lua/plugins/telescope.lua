require('telescope').setup
{
  defaults =
  {
    vimgrep_arguments =
    {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden'
    },
    prompt_prefix = " ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config =
    {
        horizontal =
        {
            mirror = false,
        },
        vertical =
        {
            mirror = true
        },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns =
    {
        "node_modules",
        ".git/.*"
    },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = { "truncate" },
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    cache_picker =
    {
        num_pickers = -1
    },

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
-- require('telescope').load_extension('luasnip')

map('n', '<Leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true, layout_strategy = \'vertical\',  })<CR>', nosil)
map('n', '<Leader>fb', ':lua require"telescope.builtin".buffers({ hidden = true, layout_strategy = \'vertical\',  })<CR>', nosil)
map('n', '<Leader>fg', ':lua require"telescope.builtin".live_grep({ hidden = true })<CR>', nosil)
-- Live Grep Raw
map('n', '<Leader>fr', ':lua require("telescope").extensions.live_grep_raw.live_grep_raw({ hidden = true })<CR>', nosil)

map('n', '<Leader>fo', ':lua require"telescope.builtin".oldfiles({ hidden = true })<CR>', nosil)
map('n', 'q/', ':lua require"telescope.builtin".search_history({ hidden = true })<CR>', nosil)
map('n', 'q:', ':lua require"telescope.builtin".command_history({ hidden = true })<CR>', nosil)
map('n', '<Leader>fd', ':lua require"telescope.builtin".diagnostics({ hidden = true, layout_strategy = \'vertical\',  })<CR>', nosil)
-- map('n', '<Leader>fs', ':Telescope luasnip<CR>', nosil)
