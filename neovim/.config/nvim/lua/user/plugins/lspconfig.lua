-- Mappings
local keymap = vim.keymap.set  -- Sets `noremap` by default
-- See `:help vim.diagnostic.*` for documentation on any of the functions below
keymap('n', 'gl', vim.diagnostic.open_float)
keymap('n', ']d', vim.diagnostic.goto_next, {desc = 'Next diagnostic'})
keymap('n', '[d', vim.diagnostic.goto_prev, {desc = 'Previous diagnostic'})
keymap('n', '<leader>lq', vim.diagnostic.setloclist)

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
  bufmap('n', 'gD', vim.lsp.buf.declaration)
  bufmap('n', 'gd', vim.lsp.buf.definition)
  bufmap('n', 'K', vim.lsp.buf.hover)
  bufmap('n', 'gi', vim.lsp.buf.implementation)
  bufmap('n', 'gr', vim.lsp.buf.references)
  -- bufmap('n', 'gr', require'telescope.builtin'.lsp_references)
  bufmap('n', '<leader>fs', require'telescope.builtin'.lsp_document_symbols)
  bufmap('n', '<leader>la', vim.lsp.buf.code_action)
  bufmap('v', '<leader>la', vim.lsp.buf.range_code_action)
  bufmap('n', '<leader>lD', vim.lsp.buf.type_definition)
  bufmap('n', '<leader>lf', vim.lsp.buf.formatting)
  bufmap('v', '<leader>lf', vim.lsp.buf.range_formatting)
  bufmap('n', '<leader>lr', vim.lsp.buf.rename)
  bufmap('n', '<leader>ls', vim.lsp.buf.signature_help)
  bufmap('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder)
  bufmap('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder)
  bufmap('n', '<leader>lwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
end


-- UI Customization
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Set the diagnostic symbols used in the sign column
-- Consider '●', '◍', '■', '▥'
local signs = { Error = '●', Warn = '●', Hint = '●', Info = '●' }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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

-- Python
lspconfig.pyright.setup {}  -- Provides `PyrightOrganizeImports` command
