require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})
vim.g.kommentary_create_default_mappings = false
map("n", "<A-/>", "<Plug>kommentary_line_default", {})
map("i", "<A-/>", "<ESC><Plug>kommentary_line_default", {})
map("x", "<A-/>", "<Plug>kommentary_visual_default", {})
