local lsp = require('lsp-zero').preset({})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})

    -- Enable completion triggered by <c-x><c-o>
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '<Leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    map('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    map('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    map('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    map('n', '<Leader>ca', '<cmd>CodeActionMenu<CR>', opts)
    map('n', '<Leader>od', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end)

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup()
