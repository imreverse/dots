vim.g.nvim_tree_highlight_opened_files  = 3
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_indent_markers = 1
vim.api.nvim_set_var('nvim_tree_icons',
{
    default = '',
    symlink = '',
    git =
    {
        unstaged =  "✗",
        staged =    "✓",
        unmerged =  "",
        renamed =   "➜",
        untracked = "★",
        deleted =   "",
        ignored =   "?"
    },
    folder =
    {
        arrow_open =    "",
        arrow_closed =  "",
        default =       "",
        open =          "",
        empty =         "",
        empty_open =    "",
        symlink =       "",
        symlink_open =  "",
    }
})

vim.api.nvim_set_keymap('n', '<A-e>', ":NvimTreeToggle<CR>:NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>el', ":NvimTreeFindFile<CR>:NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ec', ":lua require'nvim-tree.lib'.collapse_all()<CR>:NvimTreeRefresh<CR>", { noremap = true, silent = true })

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    update_to_buf_dir   =
    {
        enable = true,
        auto_open = true,
    },
    diagnostics =
    {
        enable = false,
        icons =
        {
            hint =      "",
            info =      "",
            warning =   "",
            error =     "",
        }
    },
    update_focused_file =
    {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open =
    {
        cmd  = nil,
        args = {}
    },
    filters =
    {
        dotfiles = false,
        custom = {}
    },
    git =
    {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view =
    {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        mappings =
        {
            custom_only = false,
            list = {}
        },
        number = false,
        relativenumber = false
    },
    trash =
    {
        cmd = "trash",
        require_confirm = true
    }
}

