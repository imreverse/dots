map('n', '<Leader>so', ":SymbolsOutline<CR>", nosil)

vim.g.symbols_outline =
{
    highlight_hovered_item = false,
    show_guides = false,
    auto_preview = false,
    position = 'right',
    width = 25,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    -- These keymaps can be a string or a table for multiple keys
    keymaps = {
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview  = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {}
}
