-- Package manager for LSP servers, DAP servers, linters and formatters
return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',  -- Bridges mason and lspconfig
  },
  config = function()
    require('mason').setup {
      ui = {
        border = 'single',
        -- border = { '┏', '━' ,'┓', '┃', '┛', '━', '┗', '┃' },  -- heavy single
      }
    }

    require('mason-lspconfig').setup {
      ensure_installed = {
        -- clangd is provided by the Homebrew package `llvm`
        'html',
        'lua_ls',
        'pyright'
      },
      automatic_installation = true,
    }
  end
}
