local nvim_lsp_status, nvim_lsp = pcall(require, 'lspconfig')
if (not nvim_lsp_status) then return end
local mason_status, mason = pcall(require, 'mason')
if (not mason_status) then return end
local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not mason_lspconfig_status) then return end

mason.setup({})
mason_lspconfig.setup {
    ensure_installed = {
        'sumenko_lua',
        'pylsp',
    }
}

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- mappings
    local opts = { noremap = true, silent = true }

    -- see `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    -- formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end
end


protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

-- set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

-- set up for lua
nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
    },
}

nvim_lsp.pylsp.setup {
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 100
                }
            }
        }
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
})


-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})
