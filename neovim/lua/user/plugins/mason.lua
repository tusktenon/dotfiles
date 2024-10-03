-- Package manager for LSP servers, DAP servers, linters and formatters
return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim', -- Bridges mason and lspconfig
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- Install/upgrade third-party tools
  },
  config = function()
    require('mason').setup {
      ui = {
        border = 'single',
        -- border = { '┏', '━' ,'┓', '┃', '┛', '━', '┗', '┃' },  -- heavy single
      },
    }

    require('mason-lspconfig').setup {
      ensure_installed = {
        -- clangd is provided by the Homebrew package `llvm`
        'html',
        'lemminx',
        'lua_ls',
        'omnisharp',
        'pyright',
        'ts_ls',
      },
      automatic_installation = true,
    }

    require('mason-tool-installer').setup {
      ensure_installed = {
        -- 'black',
        'csharpier',
        -- 'isort',
        'eslint_d',
        'prettier',
        'stylua',
      },
    }
  end,
}
