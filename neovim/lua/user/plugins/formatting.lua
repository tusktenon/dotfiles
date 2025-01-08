return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>F',
      function() require('conform').format { async = true, lsp_fallback = true } end,
      desc = 'Format buffer',
    },
    {
      '<C-f>',
      function() require('conform').format { async = true, lsp_fallback = true } end,
      mode = 'v',
      desc = 'Format buffer',
    },
  },
  opts = {
    -- Customize formatters
    formatters = {
      rustfmt = {
        -- `+nightly` allows single-line standalone if-else statements
        args = { '+nightly' },
      },
    },
    -- Define your formatters
    formatters_by_ft = {
      cs = { 'csharpier' },
      css = { 'prettier' },
      go = { 'goimports', 'gofumpt', 'golines' },
      html = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      json = { 'prettier' },
      lua = { 'stylua' },
      -- python = { "isort", "black" },
      rust = { 'rustfmt' },
      typescript = { 'prettier' },
      yaml = { 'prettier' },
    },
    -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
  },
}
