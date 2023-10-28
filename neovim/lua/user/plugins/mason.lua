-- Package manager for LSP servers, DAP servers, linters and formatters
return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',  -- Bridges mason and lspconfig
  },
  opts = {
    ui = { border = 'rounded' }
  }
}
