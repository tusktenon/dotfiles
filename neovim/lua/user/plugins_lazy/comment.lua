-- Commenting (c.f. tpope/vim-commentary)
return {
  'numToStr/Comment.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    require('Comment').setup {
      -- Comment.nvim has native Treesitter support for calculating the `commentstring` based on
      -- cursor location, for situations in which there are multiple (embedded/injected) languages,
      -- as in Markdown or Vue files. This implementation does not support `jsx`/`tsx`, but you can
      -- add this with `nvim-ts-context-commentstring`. See
      --   * https://github.com/numToStr/Comment.nvim#-treesitter
      --   * https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#commentnvim
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
    }
  end
}
