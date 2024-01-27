-- Commenting (c.f. tpope/vim-commentary)
return {
  'numToStr/Comment.nvim',
  event = { "BufRead", "BufWinEnter", "BufNewFile" },
  opts = {}
}
