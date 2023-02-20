local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'lua_ls',
    'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    sighns = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = true,
})
