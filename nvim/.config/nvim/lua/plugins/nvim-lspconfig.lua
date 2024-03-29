local signs = { Error = "●", Warn = "●", Info = "●", Hint = "●" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

-- Enable Floatin Diagnostics [THIS BREAKS UNDO HISTORY!!]
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Disable Virtual Text
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics,
--     {
--         virtual_text = false
--     }
-- )


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>ca', '<cmd>CodeActionMenu<CR>', opts)
    buf_set_keymap('n', '<Leader>od', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

end

-- local nvim_lsp = require('lspconfig')
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- nvim_lsp.ccls.setup {
--     -- capabilities = capabilities,
--     filetypes = { "cpp", "c", "hpp", "h" },
--     on_attach = on_attach,
--     flags = {
--         debounce_text_changes = 150,
--     }
-- }

-- nvim_lsp.sumneko_lua.setup {
--     -- capabilities = capabilities,
--     filetypes = { "lua" },
--     on_attach = on_attach,
--     flags = {
--         debounce_text_changes = 150,
--     }
-- }

-- nvim_lsp.tsserver.setup {
--     cmd = { "typescript-language-server", "--stdio" },
--     filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--     on_attach = on_attach,
--     init_options = {
--         hostInfo = "neovim"
--     }
-- }

-- nvim_lsp.graphql.setup {
--     cmd = { "graphql-lsp", "server", "-m", "stream" },
--     filetypes = { "graphql", "typescriptreact", "javascriptreact" },
--     on_attach = on_attach,
--     init_options = {
--         hostInfo = "neovim"
--     }
-- }

-- nvim_lsp.eslint.setup {
--     cmd = { "vscode-eslint-language-server", "--stdio" },
--     filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
--     on_attach = on_attach,
--     init_options = {
--         hostInfo = "neovim"
--     }
-- }

-- nvim_lsp.cssmodules_ls.setup {
--     cmd = { "cssmodules-language-server" },
--     filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--     on_attach = on_attach,
--     init_options = {
--         hostInfo = "neovim"
--     }
-- }

-- nvim_lsp.bashls.setup {
--     cmd = { "bash-language-server", "start" },
--     cmd_env = {
--         GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
--     },
--     filetypes = { "sh" },
--     single_file_support = true
-- }
