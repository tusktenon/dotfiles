local keymap = vim.keymap.set  -- Sets `noremap` by default

-- Global Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the functions below
keymap('n', 'gl', vim.diagnostic.open_float, {desc = 'Show diagnostics'})
keymap('n', ']d', vim.diagnostic.goto_next, {desc = 'Next diagnostic'})
keymap('n', '[d', vim.diagnostic.goto_prev, {desc = 'Previous diagnostic'})
keymap('n', '<leader>lq', vim.diagnostic.setloclist, {desc = 'List diagnostics'})

-- Buffer-Local Mappings
-- Use the LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local bufmap = function(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = ev.buf
      keymap(mode, lhs, rhs, opts)
    end

    -- See `:help vim.lsp.*` for documentation on any of the functions below
    bufmap('n', 'gD', vim.lsp.buf.declaration, {desc = 'Go to declaration'})
    bufmap('n', 'gd', vim.lsp.buf.definition, {desc = 'Go to definition'})
    bufmap('n', 'K', vim.lsp.buf.hover, {desc = 'Hover documentation'})
    bufmap('n', 'gi', vim.lsp.buf.implementation, {desc = 'Go to implementation'})
    bufmap('n', 'gr', vim.lsp.buf.references, {desc = 'List references'})
    -- bufmap('n', 'gr', require'telescope.builtin'.lsp_references, {desc = 'List references'})
    bufmap('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, {desc = 'List document symbols'})
    bufmap({'n', 'v'}, '<leader>la', vim.lsp.buf.code_action, {desc = 'Code action'})
    bufmap('n', '<leader>lD', vim.lsp.buf.type_definition, {desc = 'Go to type definition'})
    bufmap('n', '<leader>lf', function() vim.lsp.buf.format {async = true} end, {desc = 'Format buffer'})
    bufmap('n', '<leader>lr', vim.lsp.buf.rename, {desc = 'Rename'})
    bufmap('n', '<leader>ls', vim.lsp.buf.signature_help, {desc = 'Signature help'})
    bufmap('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, {desc = 'Add folder'})
    bufmap('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, {desc = 'Remove folder'})
    bufmap('n', '<leader>lwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
           {desc = 'List folders'})
  end
})


-- UI Customization
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = {severity = {min = vim.diagnostic.severity.ERROR}},
  update_in_insert = false,
  severity_sort = true,
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
-- --Enable (broadcasting) snippet capability for completion:
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Add additional capabilities supported by nvim-cmp:
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require 'lspconfig'

-- C/C++
lspconfig.clangd.setup {
  capabilities = capabilities,
}

-- HTML
lspconfig.html.setup {
  capabilities = capabilities,
}

-- Lua
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},  -- Recognize `vim` as a global variable
      },
      runtime = {
        version = 'LuaJIT',  -- Use 'LuaJIT' for Neovim
      },
      workspace = {
        -- Get completion and context from the Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = true,
      },
    },
  },
}

-- Python
lspconfig.pyright.setup {  -- Provides `PyrightOrganizeImports` command
    capabilities = capabilities,
}
