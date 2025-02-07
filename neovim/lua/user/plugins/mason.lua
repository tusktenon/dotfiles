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
        'gopls',
        'html',
        'jdtls',
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
        'checkstyle', -- Java linter
        'eslint_d',
        'gofumpt', -- a stricter alternative to 'gofmt'
        'goimports', -- updates Go imports
        'golines', -- fixes long lines
        -- 'golangci-lint', -- Go linters runner
        'google-java-format',
        -- 'isort',
        'prettier',
        'revive', -- drop-in replacement for `golint`
        'staticcheck', -- advanced Go linter
        'stylua',
      },
    }
  end,
}
