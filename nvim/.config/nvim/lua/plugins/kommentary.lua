require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})
require('kommentary.config').configure_language('lua', {
    single_line_comment_string = 'auto', multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
})
require('kommentary.config').configure_language('javascript', {
    single_line_comment_string = 'auto', multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
})
require('kommentary.config').configure_language('typescript', {
    single_line_comment_string = 'auto', multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
})
require('kommentary.config').configure_language('tsx', {
    single_line_comment_string = 'auto', multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
})
require('kommentary.config').configure_language('html', {
    single_line_comment_string = 'auto', multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
})
require('kommentary.config').configure_language('graphql', {
    single_line_comment_string = 'auto', multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
})
vim.g.kommentary_create_default_mappings = false
map("n", "<A-/>", "<Plug>kommentary_line_default", {})
map("i", "<A-/>", "<ESC><Plug>kommentary_line_default", {})
map("x", "<A-/>", "<Plug>kommentary_visual_default", {})
