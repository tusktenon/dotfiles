-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the functions below
local keymap = vim.keymap.set  -- Sets `noremap` by default
keymap('n', 'gl', vim.diagnostic.open_float)
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>lq', vim.diagnostic.setloclist)

-- The `on_attach` callback is run after the language server successfully
-- attaches to the current buffer. This lets you conditionally map keybindings
-- or set other buffer options based on whether or not the language server is
-- active in the buffer.
local on_attach = function(client, bufnr)
  -- Mappings
  -- See `:help vim.lsp.*` for documentation on any of the functions below
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
  keymap('n', 'K', vim.lsp.buf.hover, bufopts)
  keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keymap('n', 'gr', vim.lsp.buf.references, bufopts)
  keymap('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
  keymap('n', '<leader>lD', vim.lsp.buf.type_definition, bufopts)
  keymap('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)
  keymap('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
  keymap('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
  keymap('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, bufopts)
  keymap('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap('n', '<leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require 'lspconfig'

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
