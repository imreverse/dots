-- vim.g.indent_blankline_char = "▏"
-- vim.g.indent_blankline_show_current_context = true
-- -- g:indent_blankline_show_current_context_start
-- vim.g.indent_blankline_context_patterns = {
--         "declaration", "expression", "pattern", "primary_expression",
--         "statement", "switch_body"
--     }
vim.g.indent_blankline_filetype_exclude = {'alpha'}
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    space_char_blankline = " ",
    show_current_context = true
    -- show_current_context_start = true,
}
