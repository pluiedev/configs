return function()
    local lspconfig = require 'lspconfig'
    local capabilities = require 'cmp_nvim_lsp'.default_capabilities()
    
    -- Setup lspconfig.
    function on_attach(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end
    
        -- Enable completion triggered by <C-x><C-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    
        local opts = {
            noremap = true,
            silent = true,
        }
        
        buf_set_keymap('n', 'gD', vim.lsp.buf.declaration, opts)
        buf_set_keymap('n', 'gd', vim.lsp.buf.definition, opts)
        buf_set_keymap('n', 'K', vim.lsp.buf.hover, opts)
        buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, opts)
        buf_set_keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        buf_set_keymap('n', '<space>D', vim.lsp.buf.type_definition, opts)
        buf_set_keymap('n', '<space>r', vim.lsp.buf.rename, opts)
        buf_set_keymap('n', '<space>a', vim.lsp.buf.code_action, opts)
        buf_set_keymap('n', 'gr', vim.lsp.buf.references, opts)
        buf_set_keymap('n', '<space>e', vim.lsp.diagnostic.show_line_diagnostics, opts)
        buf_set_keymap('n', '[d', vim.lsp.diagnostic.goto_prev, opts)
        buf_set_keymap('n', ']d', vim.lsp.diagnostic.goto_next, opts)
        buf_set_keymap('n', '<space>q', vim.lsp.diagnostic.set_loclist, opts)
        buf_set_keymap("n", "<space>f", vim.lsp.buf.formatting, opts)
    
        -- Get signatures (and _only_ signatures) when in argument lists.
        require("lsp_signature").on_attach {
           doc_lines = 0,
           handler_opts = {
             border = "none"
           },
        }
    end

    -- rust-analyzer
    lspconfig.rust_analyzer.setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    -- Enable all cargo features.
                    allFeatures = true,
                },
            },
        },
        capabilities = capabilities,
    }
        
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            update_in_insert = true,
        }
    )
end


