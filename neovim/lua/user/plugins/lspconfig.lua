-- Mappings
local keymap = vim.keymap.set  -- Sets `noremap` by default
-- See `:help vim.diagnostic.*` for documentation on any of the functions below
keymap('n', 'gl', vim.diagnostic.open_float, {desc = 'Show diagnostics'})
keymap('n', ']d', vim.diagnostic.goto_next, {desc = 'Next diagnostic'})
keymap('n', '[d', vim.diagnostic.goto_prev, {desc = 'Previous diagnostic'})
keymap('n', '<leader>lq', vim.diagnostic.setloclist, {desc = 'List diagnostics'})

-- The `on_attach` callback is run after the language server successfully
-- attaches to the current buffer. This lets you conditionally map keybindings
-- or set other buffer options based on whether or not the language server is
-- active in the buffer.
local on_attach = function(client, bufnr)
  -- Mappings
  local bufmap = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = bufnr
    keymap(mode, lhs, rhs, opts)
  end

  -- See `:help vim.lsp.*` for documentation on any of the functions below
  bufmap('n', 'gD', vim.lsp.buf.declaration, {desc = 'Go to declaration'})
  bufmap('n', 'gd', vim.lsp.buf.definition, {desc = 'Go to definition'})
  bufmap('n', 'K', vim.lsp.buf.hover)
  bufmap('n', 'gi', vim.lsp.buf.implementation, {desc = 'Go to implementation'})
  bufmap('n', 'gr', vim.lsp.buf.references, {desc = 'List references'})
  -- bufmap('n', 'gr', require'telescope.builtin'.lsp_references, {desc = 'List references'})
  bufmap('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, {desc = 'List document symbols'})
  bufmap('n', '<leader>la', vim.lsp.buf.code_action, {desc = 'Code action'})
  bufmap('v', '<leader>la', vim.lsp.buf.range_code_action, {desc = 'Code action'})
  bufmap('n', '<leader>lD', vim.lsp.buf.type_definition, {desc = 'Go to type definition'})
  bufmap('n', '<leader>lf', vim.lsp.buf.format, {desc = 'Format buffer'})
  bufmap('v', '<leader>lf', vim.lsp.buf.range_formatting, {desc = 'Format range'})
  bufmap('n', '<leader>lr', vim.lsp.buf.rename, {desc = 'Rename'})
  bufmap('n', '<leader>ls', vim.lsp.buf.signature_help, {desc = 'Signature help'})
  bufmap('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, {desc = 'Add folder'})
  bufmap('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, {desc = 'Remove folder'})
  bufmap('n', '<leader>lwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, {desc = 'List folders'})
end


-- UI Customization
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
-- --Enable (broadcasting) snippet capability for completion:
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Add additional capabilities supported by nvim-cmp:
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require 'lspconfig'

-- HTML
lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Lua
lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
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
    on_attach = on_attach,
}
