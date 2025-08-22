-- Package manager for LSP servers, DAP servers, linters and formatters
return {
  {
    'mason-org/mason.nvim',
    opts = {
      ui = {
        border = 'single',
        -- border = { '┏', '━' ,'┓', '┃', '┛', '━', '┗', '┃' },  -- heavy single
      },
    },
  },
  {
    -- Bridges mason and lspconfig
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'mason-org/mason.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      ensure_installed = {
        -- clangd is provided by the Homebrew package `llvm`
        'gopls',
        'html',
        -- 'jdtls',
        'lemminx',
        'lua_ls',
        'pyright',
        'ts_ls',
      },
      automatic_installation = true,
    },
  },
  {
    -- Install/upgrade third-party tools
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        -- 'black',
        -- 'checkstyle', -- Java linter
        'eslint_d',
        'gofumpt', -- a stricter alternative to 'gofmt'
        'goimports', -- updates Go imports
        'golines', -- fixes long lines
        -- 'golangci-lint', -- Go linters runner
        -- 'google-java-format',
        -- 'isort',
        'prettier',
        'revive', -- drop-in replacement for `golint`
        'staticcheck', -- advanced Go linter
        'stylua',
      },
    },
  },
}
