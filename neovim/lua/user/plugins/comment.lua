-- Commenting (c.f. tpope/vim-commentary)
return {
  'numToStr/Comment.nvim',
  event = { "BufReadPre", "BufNewFile" },
  opts = {}
}
