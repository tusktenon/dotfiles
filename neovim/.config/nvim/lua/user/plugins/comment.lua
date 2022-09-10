--[[
Comment.nvim has native Treesitter support for calculating the `commentstring` based on cursor
location, for situations in which there are multiple (embedded/injected) languages, as in Markdown
or Vue files. This implementation does not support `jsx`/`tsx`, but you can add this with
`nvim-ts-context-commentstring`. See
  * https://github.com/numToStr/Comment.nvim#-treesitter
  * https://github.com/JoosepAlviste/nvim-ts-context-commentstring#commentnvim
  * https://github.com/JoosepAlviste/nvim-ts-context-commentstring/blob/main/lua/ts_context_commentstring/integrations/comment_nvim.lua
--]]

require('Comment').setup {
  pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == 'typescriptreact' then
      local U = require('Comment.utils')

      -- Determine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.blockwise then
        location = require('ts_context_commentstring.utils').get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require('ts_context_commentstring.utils').get_visual_start_location()
      end

      return require('ts_context_commentstring.internal').calculate_commentstring({
        key = type, location = location,
      })
    end
  end,
}
